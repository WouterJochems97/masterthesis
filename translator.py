import sys
from collections import defaultdict

from elftools.elf.elffile import ELFFile

from vars import *

from elftools.elf.sections import SymbolTableSection

definitions = set()
globVars = "\n"
faultCode = dict()
threads = dict()
waits = ""

dslCode = list()
nextLine = 0

joinedThreads = list()

step = ""

stepCount = ""

lookUp = set()
symbols = dict()
codes = dict()


def symbolsLookUp(fileName):
    with open(fileName) as f:
        elffile = ELFFile(f)
        symbol_tables = [(idx, s) for idx, s in enumerate(elffile.iter_sections())
                         if isinstance(s, SymbolTableSection)]

        for section_index, section in symbol_tables:
            if not isinstance(section, SymbolTableSection):
                continue

            if section['sh_entsize'] == 0:
                continue

            for nsym, symbol in enumerate(section.iter_symbols()):
                if symbol.name in lookUp:
                    symbols[symbol.name] = symbol['st_value']
                    lookUp.remove(symbol.name)


def onFault():
    global faultCode, dslCode, nextLine
    line = dslCode[nextLine]
    parts = line.split()
    nextLine += 1

    lookUp.add(parts[1])
    parts[1] += "_address"
    if parts[1] not in faultCode:
        faultCode[parts[1]] = "\t\t" + readCode(2)

    return block(parts[1])


def ecall():
    global dslCode, nextLine
    line = dslCode[nextLine]
    line = line.split(" ", 1)[1]
    parts = line.split("(")
    if parts[1].startswith(")"):
        return "SGX_ASSERT(" + parts[0] + "(eid));"
    return "SGX_ASSERT(" + parts[0] + "(eid, " + parts[1] + ");"


def varStat():
    global dslCode, nextLine, globVars
    line = dslCode[nextLine]
    globVars += line + ";\n"
    return ""


def thread():
    global dslCode, nextLine, threads
    line = dslCode[nextLine]
    nextLine += 1

    name = line.split()[1]

    threads[name] = "\t" + readCode(1)

    return "pthread_create(&" + name + ", NULL," + name + "Func, NULL);\n"


def resume():
    global dslCode, nextLine
    line = dslCode[nextLine]
    line = line.split()
    return line[1] + "Wait = 0;\n"


def pause():
    global dslCode, nextLine, waits
    line = dslCode[nextLine]
    name = line.split()[1]
    waits += "int " + name + "Wait = 1;\n"
    return "while(" + name + "Wait) {sleep(1);}"


def joinFunc():
    global dslCode, nextLine
    line = dslCode[nextLine]
    line = line.split()
    joinedThreads.append(line[1])
    return "pthread_join(" + line[1] + ",NULL);\n"


def IRQStep():
    global dslCode, nextLine, step, globVars, faultCode
    line = dslCode[nextLine]
    nextLine += 1
    line = line.split()
    lookUp.add(line[1])

    code = "\tattacker_config_runtime();\n" \
            "\tattacker_config_page_table();\n\n"
    code += "\tidt_t idt = {0};\n" \
            "\tmap_idt(&idt);\n" \
            "\tinstall_kernel_irq_handler(&idt, __ss_irq_handler, IRQ_VECTOR);\n" \
            "\tapic_timer_oneshot(IRQ_VECTOR);\n"

    step = "void aep_cb_func(void) {" + "\n\tirq_cnt++;\n\t"
    step += "if (ACCESSED(*pte_" + line[1] + ")) {\n\t\t"
    step += readCode(2)
    step += "\n\t}\n\n\t"

    step += "*pte_" + line[1] + " = MARK_NOT_ACCESSED(*pte_" + line[1] + ");\n\t"
    step += aep3

    step += attacker_config_runtime()

    step += attacker_config_page_table(line[1]) + "\n"

    globVars += "\nuint64_t *pte_" + line[1] + " = NULL;\n"

    faultCode = "\tif(base_adrs == " + line[1] + "_address && stepFault == 1) {\n\t\tstepFault = 0;\n\t\t" + unBlock(line[1] + "_address") + "\n\t\treturn;\n\t}\n" + faultCode

    return code


def arbitraryC():
    global dslCode, nextLine
    return dslCode[nextLine] + ";"


def defaultTrampoline():
    return arbitraryC


keywords = defaultdict(defaultTrampoline)
keywords["int"] = varStat
keywords["uint16_t"] = varStat
keywords["uint32_t"] = varStat
keywords["onFault"] = onFault
keywords["ecall"] = ecall
keywords["thread"] = thread
keywords["resume"] = resume
keywords["pause"] = pause
keywords["join"] = joinFunc
keywords["IRQStep"] = IRQStep


def readCode(nbTabs):
    global nextLine, dslCode
    codeRead = list()
    while nextLine != len(dslCode):
        print(dslCode[nextLine])
        if dslCode[nextLine] != "}":
            keyword = dslCode[nextLine].split(" ", 1)[0]
            if keyword == "onFault" or keyword == "IRQStep":
                codeRead.insert(max(len(codeRead) - 1, 0), keywords[keyword]())
            else:
                codeRead.append(keywords[keyword]())
            nextLine += 1
        else:
            break
    tabs = "\n" + nbTabs*"\t"
    return tabs.join(codeRead)


def generateCode(args):
    global step
    print("Reading DSL file...\n*********************")
    with open(args[1]) as f:
        line = f.readline()
        while line:
            line = line.strip('\n')
            print(line)
            line = line.lstrip()
            dslCode.append(line)
            line = f.readline()

    print("\nGenerating code...\n*********************")
    mainCode = "\t" + readCode(1)

    symbolsLookUp(args[2])

    outputFile = open(args[1] + ".c", "w")

    # Add imports
    outputFile.write(imports)
    # Add variables
    outputFile.write(variables)
    outputFile.write(globVars)
    if step:
        outputFile.write(stepVariables)

    for sym in symbols:
        outputFile.write("void *" + sym + "_address;\n")
    outputFile.write("\n")

    for th in threads.keys():
        outputFile.write("pthread_t " + th + ";\n")
    outputFile.write("\n")

    outputFile.write(waits)

    for d in definitions:
        outputFile.write(d + "\n")
    outputFile.write("\n")

    # Add step functions if necessary
    if step:
        outputFile.write(step)

    # Add fault_handler
    if bool(faultCode):
        outputFile.write("void fault_handler(void *base_adrs) {\n")

        for f in faultCode.keys():
            outputFile.write("\tif(base_adrs == " + f + ") {\n\t\t" + unBlock(f) + "\n")
            outputFile.write(faultCode[f])
            outputFile.write("\n\t\treturn;\n\t}\n")
        outputFile.write("}\n\n")


    # Add thread code
    for th in threads.keys():
        outputFile.write("void *" + th + "Func(void* args) {\n")
        outputFile.write(threads[th] + "\n")
        outputFile.write("}\n\n")

    # Add main
    outputFile.write("int main( int argc, char **argv) {\n")

    outputFile.write(createEnclave)
    if bool(faultCode):
        outputFile.write(addFaultHandler)

    for sym in symbols:
        outputFile.write("\t" + sym + "_address = baseAddress + (" + str(symbols[sym]) + "/4096)*4096;\n")
    outputFile.write('\n')

    outputFile.write(mainCode)

    for th in threads.keys():
        if th not in joinedThreads:
            outputFile.write("\t" + joinFuncMain("# " + th))
    outputFile.write("\n")

    if step or stepCount:
        outputFile.write("\tapic_timer_deadline();\n")
    outputFile.write(destroyEnclave)

    outputFile.write("}")
    outputFile.close()


generateCode(sys.argv)

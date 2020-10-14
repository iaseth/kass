AMP = @

GCC = ${AMP}gcc
INCLUDE_FLAG = -Iinclude
LINK_FLAG = -lnone

RM = ${AMP}rm -f

KASS_NAMES = 
KASS_NAMES += kass_common

KASS_OBJ_NAMES = ${addsuffix .o, ${KASS_NAMES}}
KASS_OBJS = ${addprefix build/, ${KASS_OBJ_NAMES}}

MAIN_SRC = src/main.c
MAIN_OBJ = build/main.o

BIN = build/kass

default: ${BIN}

debug:
	${eval AMP := }

${MAIN_OBJ}: ${MAIN_SRC}
	${GCC} -c $< -o $@ ${INCLUDE_FLAG}

${KASS_OBJS}: build/%.o: src/%.c include/%.h
	${GCC} -c $< -o $@ ${INCLUDE_FLAG}

${BIN}: ${MAIN_OBJ} ${KASS_OBJS}
	${GCC} $^ -o $@

redo: clean default

run: ${BIN}
	@${BIN}

move:
	sudo cp ${BIN} /usr/bin

clean:
	${RM} ${BIN}
	${RM} ${MAIN_OBJ}
	${RM} ${KASS_OBJS}



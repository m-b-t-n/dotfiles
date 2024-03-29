#!/bin/bash

readonly PLANTUML_JAR_BASE="$HOME/dotfiles/plantuml/bin/plantuml.jar"
readonly UNAME="$(uname)"

# Windows with MinGW
if echo "${UNAME}" | grep -i ^mingw.* > /dev/null; then
	PLANTUML_CMD="java -jar ${PLANTUML_JAR_BASE} -tpng -charset UTF-8"

# Linux
elif [[ "${UNAME}" = "Linux" ]]; then
	PLANTUML_CMD="plantuml -tpng"

# macOS
elif [[ "${UNAME}" = "Darwin" ]]; then
	PLANTUML_CMD="java -jar ${PLANTUML_JAR_BASE} -tpng"
fi

echo "${PLANTUML_CMD} $1"
${PLANTUML_CMD} $1


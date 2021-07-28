#!/bin/bash

readonly PLANTUML_JAR_BASE="$HOME/dotfiles/common/plantuml/bin/plantuml.jar"

if uname | grep -i ^mingw.* > /dev/null; then
	PLANTUML_CMD="java -jar ${PLANTUML_JAR_BASE} -tpng"
elif [[ "$(uname)" = "Linux" ]]; then
	PLANTUML_CMD="plantuml -tpng"
elif [[ "$(uname)" = "Darwin" ]]; then
	PLANTUML_CMD="java -jar ${PLANTUML_JAR_BASE} -tpng"
fi

echo "${PLANTUML_CMD} $1"
${PLANTUML_CMD} $1


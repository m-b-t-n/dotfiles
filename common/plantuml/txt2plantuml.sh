#!/bin/bash

if uname | grep -i ^mingw.* > /dev/null; then
	PLANTUML_CMD="java -jar $HOME/Apps/plantuml/plantuml.jar -tpng"
elif [[ "$(uname)" = "Linux" ]] || [[ "$(uname)" = "Darwin" ]]; then
	PLANTUML_CMD="plantuml -tpng"
fi

${PLANTUML_CMD} $@


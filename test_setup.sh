#!/bin/bash

OS_LIST=(\
	"MINGW_00x" \
	"Linux" \
	"Darwin" \
	"unko" \
)

OS_LIST_EXPECTED_RESULT=(\
	0 \
	0 \
	0 \
	1 \
)

function check_result() {
	local expected_ret="$1"
	local actual_ret="$2"

	if [[ ${expected_ret} -eq ${actual_ret} ]]; then
		echo 0
	else
		echo 1
	fi
}

LOGFILE="$(dirname $0)/$(basename $0).log"
if [[ -f ${LOGFILE} ]]; then
	rm -fv ${LOGFILE}
fi

for ((i=0; i<${#OS_LIST[@]}; ++i)); {
	echo -e "--- $(basename $0): OS(${OS_LIST[$i]}) ---"
	echo -e "--- $(basename $0): OS(${OS_LIST[$i]}) ---" >> ${LOGFILE}

	bash dotfiles/setup.sh -d ${OS_LIST[${i}]}; RETVAL=$?
	RESULT=$(check_result ${OS_LIST_EXPECTED_RESULT[${i}]} ${RETVAL})

	if [[ ${RESULT} -eq 0 ]]; then
		echo -e "--- $(basename $0): OK. ---\n"
		echo -e "--- $(basename $0): OK. ---\n" >> ${LOGFILE}
	else
		echo -e "--- $(basename $0): NG. EXPECTED=${OS_LIST_EXPECTED_RESULT[${i}]}, RETVAL=${RETVAL} ---\n"
		echo -e "--- $(basename $0): NG. EXPECTED=${OS_LIST_EXPECTED_RESULT[${i}]}, RETVAL=${RETVAL} ---\n" >> ${LOGFILE}
	fi
}


#!/usr/bin/env bash

# TEST RUNNER
#
# This script will run all of the files in the `tests/` directory who's name
# starts with `test` and ends with `.sh`. If a file named `setup.sh` is present
# in the `tests/` directory it will be run *before* each test. If a file named
# `teardown.sh` is present in the `tests/` directory it will be run *after* each
# test.
#
# If a test fails, the test runner will abort, rather than running all tests.


set -o nounset # exit on use of an uninitialised variable, same as -u
set -o errexit # exit on all and any errors, same as -e

bSuccess=false
sCurrentTest=''
sTestList=''

source './common.sh'

function runSetup() {
    status 'Starting setup...'
    sourceIfExists 'tests/setup.sh'
    status 'Setup complete.'
}

function runTeardown() {
    status 'Starting teardown...'
    sourceIfExists 'tests/teardown.sh'
    status 'Teardown Complete.'
}

function runTestSuite() {
    topic 'Starting Test Suite...'

    sPath='tests'
    iLength=${#sPath}

    aFiles=$(find "${sPath}" -type f -name 'test*.sh' | sort -d)

    for sFile in $aFiles;do
        # Remove the '/path/to/test' from the front of the file name
        sCurrentTest="${sFile:$iLength+5}"
        # Remove the '.sh' from the end of the file name
        sCurrentTest="${sCurrentTest%.sh}"

        sCurrentTest="$(echo "${sCurrentTest}" | sed 's/\(.\)\([A-Z]\)/\1 \2/g')"

        topic "Test: ${sCurrentTest}"
        runSetup
        status 'Starting Test'

        set -x
        source "${sFile}"
        set +x

        status 'Test Passed'
        runTeardown

        sTestList="${sTestList}\n✅  ${sCurrentTest}"

    done

    topic 'Tests Suite Complete.'
    bSuccess=true
}

exitHandler() {
    set +x

    # signal handler for end of the program (clean or unclean).
    if [ "${bSuccess}" = true ];then
        echo -e "${sTestList}"
        echo -e "\n✅  SUCCESS\n"
    else
        status 'Test Failed'
        runTeardown
        echo -e "${sTestList}"
        echo -e "🚫  Failed: '${sCurrentTest}'"
        echo -e "\n🚫  FAILURE\n"
    fi

    echo -e "\nTests took $SECONDS seconds to run.\nDone.\n"
}

trap exitHandler INT TERM EXIT

runTestSuite

exit

#EOF

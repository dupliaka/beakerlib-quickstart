#!/bin/bash
. /usr/share/beakerlib/beakerlib.sh

test_dir=""
ret=""

rlJournalStart

    rlPhaseStartSetup "Setup phase: Prepare a temporary directory for the test"
        test_dir=$(mktemp -d /tmp/beakerlib-test-XXXXXX)
        rlAssertExists "$test_dir"
    rlPhaseEnd

    rlPhaseStartTest "Wait for file creation"
        # Background process that creates a file after 5 seconds
        (sleep 5; touch "${test_dir}"/file)&

        # Wait for the file to be created with a timeout of 10 seconds
        rlWaitForFile -t 10 "${test_dir}"/file
        ret=$?

        # Check if rlWaitForFile succeeded
        if [ $ret -eq 0 ]; then
            rlPass "The file was created within the expected time."
        else
            rlFail "The file was not created within the expected time."
        fi
    rlPhaseEnd

    rlPhaseStartCleanup "Cleanup phase: Clean up the temporary directory"
        rlRun "rm -rf $test_dir" 0 "Removing temporary directory"
    rlPhaseEnd

rlJournalEnd
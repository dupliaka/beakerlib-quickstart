#!/bin/bash
. /usr/share/beakerlib/beakerlib.sh

TEST_FILE=testfile

rlJournalStart

    rlPhaseStartSetup "Create test file"
        rlRun "echo 'Assertion Functions' > $TEST_FILE" 0
    rlPhaseEnd

    rlPhaseStartTest "Assertion sample"
        rlAssertEquals "Asserts equality of expected and actual" "$(echo 1)" 1
        rlAssertNotEquals "Asserts inequality of expected and actual" "$(false)" 1
        rlAssertGrep "Assertion Functions" $TEST_FILE # keep quotes around expected pattern prevents space split commands to be interpreted as a pattern and filepath
        rlAssertNotGrep "Unexpected" $TEST_FILE
        rlAssertRpm "setup"
        rlAssertNotRpm "testrpm"
        rlAssertExists "../02_assertion_functions"
        rlAssertExists "asssertions.sh"
        rlAssertNotExists "testNonExistingFileOrDirectory"
    rlPhaseEnd

    rlPhaseStartCleanup "Cleanup - remove testfile"
        rlRun "rm $TEST_FILE" 0
    rlPhaseEnd

rlJournalEnd
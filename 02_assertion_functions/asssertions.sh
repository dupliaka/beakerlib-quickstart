#!/bin/bash
. /usr/share/beakerlib/beakerlib.sh

EXPECTED=0
ACTUAL_EQ_EXPECTED=0
ACTUAL_NEQ_EXPECTED=1
TEST_FILE="./README.md"
EXPECTED_PATTERN="Assertion Functions"
UNEXPECTED_PATTERN="Unexpected"


rlJournalStart
    rlPhaseStartTest "Assertion sample"
      rlAssertEquals "Asserts equality of expected and actual" $EXPECTED $ACTUAL_EQ_EXPECTED
      rlAssertNotEquals "Asserts inequality of expected and actual" $EXPECTED $ACTUAL_NEQ_EXPECTED
      rlAssertGrep "$EXPECTED_PATTERN" $TEST_FILE # keep quotes around expected pattern prevents space split commands to be interpreted as a pattern and filepath
      rlAssertNotGrep "$UNEXPECTED_PATTERN" $TEST_FILE
      rlAssertRpm setup
      rlAssertNotRpm testrpm
      rlAssertExists ../02_assertion_functions
      rlAssertExists asssertions.sh
      rlAssertNotExists testNonExistingFileOrDirectory
    rlPhaseEnd
rlJournalEnd
#!/bin/bash
# Include BeakerLib environment
. /usr/share/beakerlib/beakerlib.sh

rlJournalStart
    rlPhaseStartTest "Sample Test"
        rlAssertEquals "Check if true is true" 0 0
    rlPhaseEnd
rlJournalEnd
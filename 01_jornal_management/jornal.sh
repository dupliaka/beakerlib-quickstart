#!/bin/bash
. /usr/share/beakerlib/beakerlib.sh

# In BeakerLib, rlJournalStart is typically used to start the journaling of a test.
# It initializes the journal environment and should be paired with rlJournalEnd to close the journal properly.
# While the BeakerLib framework is designed to handle one journal per test script,
# it is technically possible to call rlJournalStart more than once in a single file.
# However, this is not a standard practice and could lead to unexpected behavior.

#rlJournalPrintText prints meta-information like CPU, RAM, HDD size, BeakerLib version.

rlJournalStart
    rlPhaseStartSetup "Test Setup - if it is fails it reports WARN"
    rlPhaseEnd

    rlPhaseStartTest "Test Phase - if it is fails it reports FAIL"
        rlLog "Journaling messages example"
        rlAssertEquals "With assert equals showcase" "$(true && echo 'Success')" "Success"
        rlAssertGrep "Journal Management" "./README.md"
        rlJournalPrint
        rlJournalPrintText
    rlPhaseEnd

    rlPhaseStartCleanup "Cleanup - if it is fails it reports WARN"
    rlPhaseEnd
rlJournalEnd
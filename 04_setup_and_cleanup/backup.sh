#!/bin/bash
. /usr/share/beakerlib/beakerlib.sh

# To backup files you need to have permission to change ownership in BEAKERLIB_DIR
# Setup beakerlib custom dir.  /var/tmp/ by default

export BEAKERLIB_DIR=/home/adupliak/PycharmProjects/beakerlib-quickstart/.beakerlibdir

rlJournalStart "Sample of backup"

    rlPhaseStartSetup "Create a directory for demonstration"
        rlRun "mkdir demoDir"
    rlPhaseEnd

    rlPhaseStartTest "Backup phase demo"
        rlRun "rlFileBackup --clean --no-missing-ok demoDir" 0
    rlPhaseEnd

    rlPhaseStartTest "Make some changes in the dir"
        rlRun "mkdir ./demoDir/newDir" 0
    rlPhaseEnd

    rlPhaseStartTest "Restore from backup"
        rlRun "rlFileRestore"
    rlPhaseEnd

    rlPhaseStartTest "Check backup"
        rlAssertNotExists "./demoDir/newDir"
    rlPhaseEnd

    rlPhaseStartCleanup "Cleanup demoDir"
        rlRun "rm -rf demoDir"
    rlPhaseEnd

rlJournalEnd
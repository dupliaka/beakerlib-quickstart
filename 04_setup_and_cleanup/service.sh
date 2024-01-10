#!/bin/bash
. /usr/share/beakerlib/beakerlib.sh || exit 1

# Service restart requires root permission
rlJournalStart

    rlPhaseStartSetup "Start the httpd service before tests"
        rlRun "rlServiceStart httpd" 0 "Starting httpd service"
    rlPhaseEnd

    rlPhaseStartTest "Test phase"
        rlAssertEquals "Assert that http server response OK" "$(curl -s -o /dev/null -w '%{http_code}' localhost)" 200
    rlPhaseEnd

    rlPhaseStartCleanup "Cleanup phase"
        # Stop the httpd service after tests
        rlRun "rlServiceStop httpd" 0 "Stopping httpd service"
    rlPhaseEnd

rlJournalEnd
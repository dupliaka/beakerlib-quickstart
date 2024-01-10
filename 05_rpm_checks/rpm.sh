#!/bin/bash
. /usr/share/beakerlib/beakerlib.sh

rlJournalStart

    rlPhaseStartSetup "Install specific RPM"
        rlRpmInstall httpd 2.4.58 1.fc38 x86_64
    rlPhaseEnd

    rlPhaseStartTest "Check httpd RPM is installed"
        rlCheckRpm httpd 2.4.58 1.fc38 x86_64
        rlAssertRpm httpd 2.4.58 1.fc38 x86_64
        rlAssertNotRpm httpd 1.0.5.1 13 i386
    rlPhaseEnd

rlJournalEnd
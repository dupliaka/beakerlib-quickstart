#!/bin/bash

# Include BeakerLib environment
. /usr/share/beakerlib/beakerlib.sh

rlJournalStart

    rlPhaseStartTest "Hello World Test"
        rlLog "Hello, World!"
        rlAssert0 "Check if 'Hello, World!' was logged" 0
    rlPhaseEnd

rlJournalEnd
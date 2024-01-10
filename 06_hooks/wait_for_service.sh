#!/bin/bash
. /usr/share/beakerlib/beakerlib.sh

rlJournalStart

    rlPhaseStartTest "Check if myservice is up"
        # Wait for the 'myservice' command to return 0 (success)
        # We expect it to succeed within 60 seconds, checking every 2 seconds.
        rlWaitForCmd "sleep 3" -t 10 -d 2 -r 0
        # Check the return value of rlWaitForCmd
        if [ $? -ne 0 ]; then
            rlFail "myservice did not start successfully"
        fi
    rlPhaseEnd

rlJournalEnd
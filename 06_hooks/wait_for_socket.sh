#!/bin/bash
# Include BeakerLib library
. /usr/share/beakerlib/beakerlib.sh

nc_pid=""

rlJournalStart

    rlPhaseStartTest "Wait for TCP socket to open"
        # Start a background process that opens a TCP socket on port 12345
        nc -l 12345 &
        nc_pid=$!

        # Wait for the TCP socket on port 12345 to be available
        rlWaitForSocket 12345 -t 10
        if [ $? -ne 0 ]; then
            rlFail "TCP socket on port 12345 did not open in time."
        else
            rlPass "TCP socket on port 12345 is open."
        fi

        # Clean up the background netcat process
        kill -s SIGTERM $nc_pid
        wait $nc_pid 2>/dev/null
    rlPhaseEnd

rlJournalEnd
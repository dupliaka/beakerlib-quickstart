#!/bin/bash
. /usr/share/beakerlib/beakerlib.sh

my_callback() {
  rlLogWarning "The command did not complete within the specified time limit."
  # Perform any necessary cleanup or additional commands
}

rlJournalStart
  rlPhaseStartTest "Test Execution and Helpers"
    rlRun -s "pwd" 0 "Showing current directory path"
    rlWatchdog "sleep 11" 10 1 my_callback
    rlShowRunningKernel
    rlGetArch
  rlPhaseEnd
rlJournalEnd

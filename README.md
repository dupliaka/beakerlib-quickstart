# BeakerLib quickstarts

BeakerLib is a shell-level integration testing library, providing developers with a tool to simplify writing and running test cases. It is primarily used for testing applications and system services in a real environment, ensuring that they behave as expected.

## Features

- **Library Functions**: Offers a rich set of commands and utilities to handle various aspects of testing.
- **Logging and Reporting**: Provides detailed logging and reporting mechanisms to track test progress and results.
- **Test Execution**: Facilitates the execution of tests and the collection of results.
- **Hooks and Cleanups**: Allows for setup and cleanup operations to be executed before and after test runs.

## Getting Started

To get started with BeakerLib, you can clone the repository and install it on your system.

```bash
git clone https://github.com/beakerlib/beakerlib.git
cd beakerlib
make install
```

## Writing tests
BeakerLib tests are written as shell scripts that utilize BeakerLib library functions. Here's a simple example:
```bash
#!/bin/bash
# Include BeakerLib environment
. /usr/share/beakerlib/beakerlib.sh

rlJournalStart
    rlPhaseStartTest "Hello World Test"
        rlLog "Hello, World!"
        rlAssert0 "Check if 'Hello, World!' was logged" 0
    rlPhaseEnd
rlJournalEnd
```

## Documentation

For more detailed information on writing tests, using library functions, and understanding BeakerLib's features, please refer to:

Manual Pages: https://beakerlib.readthedocs.io/en/latest/manual.html

GitHub Repo: https://github.com/beakerlib/beakerlib
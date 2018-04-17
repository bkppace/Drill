# myLIFTER Android Test Report
Prepared by Alex Hall, Software Tester, TESSERACT LAB

## Full test run completed 
72 of 76 tests passed, 90% passed.

- Git commit:
- Device:
- Operating system:

| *Test* | *Domain* | *Status* | *GitHub Issue* |
-----------------------------------------------------------------------------|--------------------------------|--------------|---------------------------------------------------------------------------
Pair to single lifter                                                        |  Pairing                       |  Passed      |  *~*
Pair to two more lifters                                                     |  Pairing                       |  Passed      |  *~*
Unpaired nearby lifters make "ADD NEW" button active                         |  Main Screen                   |  Passed      |  *~*
Lifters and groups persist in app after app termination and relaunch         |  Main Screen                   |  Passed      |  *~*
All nearby lifters can connect and validate                                  |  Main Screen                   |  Passed      |  *~*
Connect to lifter                                                            |  Single lifter control         |  Passed      |  *~*
Up arrow control                                                             |  Single lifter control         |  Passed      |  *~*
Down arrow control                                                           |  Single lifter control         |  Passed      |  *~*
Slider control                                                               |  Single lifter control         |  Passed      |  *~*
Warning: no smart top, on attempt move to smart top                          |  Single lifter control         |  Passed      |  *~*
Warning: no smart bottom, on attempt move to smart bottom                    |  Single lifter control         |  Passed      |  *~*
Set smart top                                                                |  Single lifter control         |  Passed      |  *~*
Go to smart top                                                              |  Single lifter control         |  Passed      |  *~*
Does not permit motion past smart top after warning prompt and answer no     |  Single lifter control         |  Passed      |  *~*
Go past smart top via override after warning prompt                          |  Single lifter control         |  Passed      |  *~*
Clear smart top                                                              |  Single lifter control         |  Passed      |  *~*
Set smart bottom                                                             |  Single lifter control         |  Passed      |  *~*
Go to smart bottom                                                           |  Single lifter control         |  Passed      |  *~*
Does not permit motion past smart bottom after warning prompt and answer no  |  Single lifter control         |  Passed      |  *~*
Go past smart bottom via override after warning prompt                       |  Single lifter control         |  Passed      |  *~*
Clear smart bottom                                                           |  Single lifter control         |  Passed      |  *~*
Disconnect lifter power while moving via app control                         |  Single lifter control         |  Passed      |  *~*
End of travel message, high                                                  |  Single lifter control         |  Passed      |  *~*
End of travel message, low                                                   |  Single lifter control         |  Passed      |  *~*
STOP button interrupts travel during smart top and bottom movement           |  Single lifter control         |  Passed      |  *~*
Reconnects after connection interruption                                     |  Single lifter control         |  Passed      |  *~*
Rename lifter                                                                |  Single lifter control         |  Passed      |  *~*
Create locked group                                                          |  Locked groups                 |  Passed      |  *~*
Help button for locked group                                                 |  Locked groups                 |  Passed      |  *~*
App connects to valid group                                                  |  Locked groups                 |  Passed      |  *~*
App connects to valid group                                                  |  Locked groups                 |  **Failed**  |  *~*
App connects to valid group                                                  |  Locked groups                 |  Passed      |  *~*
Up arrow control                                                             |  Locked groups                 |  Passed      |  *~*
Down arrow control                                                           |  Locked groups                 |  Passed      |  *~*
Slider control                                                               |  Locked groups                 |  Passed      |  *~*
Warning: no smart top, on attempt move to smart top                          |  Locked groups                 |  Passed      |  *~*
Warning: no smart bottom, on attempt move to smart bottom                    |  Locked groups                 |  Passed      |  *~*
Set smart top                                                                |  Locked groups                 |  Passed      |  *~*
Go to smart top                                                              |  Locked groups                 |  Passed      |  *~*
Does not permit motion past smart top after warning prompt and answer no     |  Locked groups                 |  Passed      |  *~*
Go past smart top via override after warning prompt                          |  Locked groups                 |  Passed      |  *~*
Clear smart top                                                              |  Locked groups                 |  Passed      |  *~*
Set smart bottom                                                             |  Locked groups                 |  Passed      |  *~*
Go to smart bottom                                                           |  Locked groups                 |  Passed      |  *~*
Does not permit motion past smart bottom after warning prompt and answer no  |  Locked groups                 |  Passed      |  *~*
Go past smart bottom via override after warning prompt                       |  Locked groups                 |  Passed      |  *~*
Clear smart bottom                                                           |  Locked groups                 |  Passed      |  *~*
Disconnect lifter power while moving via app control                         |  Locked groups                 |  Passed      |  *~*
STOP button interrupts lifters' smart high and low travel                    |  Locked groups                 |  Passed      |  *~*
Control group with different weight loads on each lifter (up to 50 lbs)      |  Locked groups                 |  Passed      |  *~*
Control group with different weight loads on each lifter (up to 50 lbs)      |  Locked groups                 |  **Failed**  |  *~*
Help button -> level group flow                                              |  Locked groups                 |  Passed      |  *~*
Remove (delete) group from app                                               |  Locked groups                 |  Passed      |  *~*
Pair to a locked group (which exists but is not in the app)                  |  Locked groups                 |  Passed      |  *~*
Rename locked group                                                          |  Locked groups                 |  Passed      |  *~*
Disband group                                                                |  Locked groups                 |  Passed      |  *~*
Group calibration off warning, start fix flow                                |  Locked groups                 |  Passed      |  *~*
Group calibration fix flow                                                   |  Locked groups                 |  Passed      |  *~*
Group disbanded from another control device                                  |  Invalid group error handling  |  Passed      |  *~*
Invalidated group, path 1                                                    |  Invalid group error handling  |  Passed      |  *~*
Invalidated group, path 2                                                    |  Invalid group error handling  |  Passed      |  *~*
Invalidated single lifter                                                    |  Invalid group error handling  |  Passed      |  *~*
Interrupted disband detected and resumes                                     |  Invalid group error handling  |  Passed      |  *~*
Create flex group                                                            |  Flex groups                   |  Passed      |  *~*
Help button for flex group                                                   |  Flex groups                   |  **Failed**  |  *[116 (link)](https://github.com/NewVistas/myLifter2-android/issues/116)*
Warning: no smart top, on attempt move to smart top                          |  Flex groups                   |  Passed      |  *~*
Go to smart top                                                              |  Flex groups                   |  Passed      |  *~*
Warning: no smart bottom, on attempt move to smart bottom                    |  Flex groups                   |  Passed      |  *~*
STOP button press interrupts lifters' smart high and low travel              |  Flex groups                   |  Passed      |  *~*
Go to smart bottom                                                           |  Flex groups                   |  Passed      |  *~*
Rename flex group                                                            |  Flex groups                   |  Passed      |  *~*
Disband group                                                                |  Flex groups                   |  Passed      |  *~*
Remove (delete) group from app                                               |  Flex groups                   |  Passed      |  *~*
App lifter motion control stops on OS interruption (e.g. a phone call)       |  Other                         |  *Untested*  |  *~*
Reel out limit switch stops app-controlled lifter travel                     |  Other                         |  Passed      |  *~*
Reel in limit switch stops app-controlled lifter travel                      |  Other                         |  Passed      |  *~*

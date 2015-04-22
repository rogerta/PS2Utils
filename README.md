PS2Utils
========
PS2Utils is an Arduino library for interfacing with PS2 devices, such as keyboards and mice.  Major features include:

1. support for all keyboard keys, including multimedia keys
2. bidirectional communication for setting keyboard LEDs
3. support for multiple simultaneous PS2 devices (as many devices as external interrupt pins)
4. fully unit tested
5. lots of example code

PS2Utils works with Arduino IDE 1.0.6 and 1.6.3.

Classes
-------
The [PS2Protocol](https://github.com/rogerta/PS2Utils/blob/master/PS2Utils/ps2_protocol.h) class handles the low level signalling between the Arduino and the PS2 device, acting as the "host" side of the protocol.  PS2Protocol reads the clock and data lines, converting them to a stream of bytes.  PS2Protocol can also drives the clock and data lines to send commands to the PS2 device.  Each instance of PS2Protocol handles the communication with one PS2 device.

The [PS2Keyboard](https://github.com/rogerta/PS2Utils/blob/master/PS2Utils/ps2_keyboard.h) class accepts a stream of bytes from PS2Protocol, interpreting them as make and break codes, to produce a stream of key codes compatible with USB HID keyboard reports.

The [PS2KeyboardManager](https://github.com/rogerta/PS2Utils/blob/master/PS2Utils/ps2_keyboard_manager.h) class manages a PS2 keyboard.  It tracks the state of all keys, including modifiers, and keyboard LEDs.  PS2KeyboardManager also converts key codes from PS2Keyboard into USB keyboard report packets.

Finally, the [PS2Debug](https://github.com/rogerta/PS2Utils/blob/master/PS2Utils/ps2_debug.h) class is an optional component to help debug sketches that use PS2Utils.  It collects statistics about the previous three classes and can dump state to the serial monitor.

Build and Test
--------------
To use PS2Utils first clone the git repo and run the tests:
```
$ git clone git@github.com:rogerta/PS2Utils.git
$ cd PS2Utils
$ make run
```

If all goes well, the last command should end with:
```
ALL TESTS COMPLETED SUCCESSFULLY

END TESTS
```
The tests are only supported on Mac 10.10.3+ and Ubuntu 14.04.2 LTS (Trusty Tahr).

Installation
------------
In Arduino IDE 1.6.3 it is easiest to install PS2Utils as a zip file.  First build the zip:
```
$ make zip
```
Then follow the [instruction for importing](http://www.arduino.cc/en/Guide/Libraries#toc4) the zip file.

In Arduino IDE 1.0.6 following the [instructions for manual installation](http://www.arduino.cc/en/Guide/Libraries#toc5).

Examples
--------
Once the library is installed into the IDE, examples of all the classes can be found in the usual location under the menu `File > Examples > PS2Utils`.

References
----------
Most of this code was written following the excellent description of the PS2 protocol at Computer-Engineering.org
- http://www.computer-engineering.org/ps2protocol/
- http://www.computer-engineering.org/ps2keyboard/

----

> Written with [StackEdit](https://stackedit.io/).

PS2Utils
========
PS2Utils is an [Arduino](http://www.arduino.cc/) library for interfacing with [PS2 devices](http://en.wikipedia.org/wiki/PS/2_port), such as keyboards and mice.  Major features include:

1. support for all keyboard keys, including multimedia keys
2. bidirectional communication for setting keyboard LEDs
3. support for multiple simultaneous PS2 devices (as many devices as external interrupt pins on the Arduino device)
4. fully suite of unit tests
5. lots of example code

PS2Utils works with Arduino IDE versions 1.0.6 and [1.6.3](http://www.arduino.cc/en/Main/Software).

Classes
-------
The [PS2Protocol](https://github.com/rogerta/PS2Utils/blob/master/PS2Utils/ps2_protocol.h) class handles the low level signalling between the Arduino and the PS2 device, acting as the "host" side of the protocol.  PS2Protocol reads the clock and data lines, converting them to a stream of bytes.  PS2Protocol can also drives the clock and data lines to send commands to the PS2 device.  Each instance of PS2Protocol handles the communication with one PS2 device.

The [PS2Keyboard](https://github.com/rogerta/PS2Utils/blob/master/PS2Utils/ps2_keyboard.h) class accepts a stream of bytes from PS2Protocol, interpreting them as make and break codes, to produce a stream of key codes compatible with USB.

The [PS2KeyboardManager](https://github.com/rogerta/PS2Utils/blob/master/PS2Utils/ps2_keyboard_manager.h) class manages a PS2 keyboard.  It tracks the state of all keys, including modifiers, and keyboard LEDs.  PS2KeyboardManager converts the key code stream from PS2Keyboard into a stream of USB keyboard report packets.

The [PS2Debug](https://github.com/rogerta/PS2Utils/blob/master/PS2Utils/ps2_debug.h) class is an optional component to help debug sketches that use PS2Utils classes.  It collects statistics about the previous three classes and can dump state to the serial monitor.

Getting started
---------------
To get started clone the repository as follows:
```
$ git clone git@github.com:rogerta/PS2Utils.git
```
This creates a directory called PS2Utils in the current directory that contains all the code, examples and tests.

Cloning the repository is the only required step to using PS2Utils.  If you'd like to build the library's zip file or run the tests, then you'll need to have a make tool installed.

To create a zip file for use with the Arduino IDE (version 1.6.3 or later), execute the following:
```
$ cd PS2Utils
$ make zip
```
This creates a file called `PS2Utils.zip` in the current directory.  See how to use this file in the installation instructions below.

Testing
-------
PS2Utils comes with a full suite of tests that run on your computer and not on the Arduino.  You'll need to have a gcc-compatible tool chain installed first.  Run the tests as follows:
```
$ make run
```
If all goes well, the last command should end with:
```
ALL TESTS COMPLETED SUCCESSFULLY

END TESTS
```

Installation
------------
In Arduino IDE 1.6.3 follow the [instruction for importing the zip file](http://www.arduino.cc/en/Guide/Libraries#toc4).

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


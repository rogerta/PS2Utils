# This Makefile built using ideas from:
# http://make.mad-scientist.net/papers/multi-architecture-builds/

ifeq (,$(filter _%,$(notdir $(CURDIR))))

.SUFFIXES:

ifndef _OS
_OS := $(shell uname -s)
export _OS
endif

OBJDIR := _out

MAKETARGET = $(MAKE) --no-print-directory -C $@ -f $(CURDIR)/Makefile \
                 SRCROOT=$(CURDIR) $(MAKECMDGOALS)

.PHONY: $(OBJDIR)
$(OBJDIR):
	+@[ -d $@ ] || mkdir -p $@
	+@$(MAKETARGET)

Makefile : ;
%.mk :: ;

% :: $(OBJDIR) ; :

.PHONY: clean
clean:
	rm -rf $(OBJDIR)
	rm -f PS2Utils.zip

else
#----- End Boilerplate


CFLAGS=-I$(SRCROOT)/tests -I$(SRCROOT)/PS2Utils
CXXFLAGS=-I$(SRCROOT)/tests -I$(SRCROOT)/PS2Utils -std=c++11
LD=c++
VPATH=$(SRCROOT)/PS2Utils:$(SRCROOT)/tests

.PHONY: all run zip

OBJS=unit_tests.o
OBJS+=Arduino.o
OBJS+=ps2_debug.o \
      ps2_keyboard.o \
      ps2_protocol.o \
      ps2_keyboard_manager.o
OBJS+=ps2_keyboard_unittests.o \
      ps2_protocol_unittests.o \
      ps2_keyboard_manager_unittests.o
UNIT_TESTS=unit_tests

all: $(UNIT_TESTS)

$(UNIT_TESTS): $(OBJS)
	$(LD) $(LDFLAGS) $^ -o $@

run: all
	./unit_tests

zip:
	cd $(SRCROOT)/PS2Utils && zip -r $(SRCROOT)/PS2Utils.zip .

# Header dependencies

TEST_H=unit_tests.h
ARDUINO_H=Arduino.h HardwareSerial.h
PS2_COMMON_H=ps2_debug.h
PS2D_H=$(PS2_COMMON_H) ps2_protocol.h
PS2P_H=$(PS2_COMMON_H) ps2_protocol.h
PS2K_H=$(PS2_COMMON_H) ps2_keyboard.h ps2_protocol.h
PS2M_H=$(PS2_COMMON_H) ps2_keyboard.h ps2_keyboard_manager.h ps2_protocol.h

unit_tests.o: $(TEST_H)

Arduino.o: $(ARDUINO_H)

ps2_debug.o: $(ARDUINO_H) $(PS2D_H)

ps2_keyboard.o: $(ARDUINO_H) $(PS2K_H)

ps2_protocol.o: $(ARDUINO_H) $(PS2P_H)

ps2_keyboard_manager.o: $(ARDUINO_H) $(PS2M_H)

ps2_keyboard_unittests.o: $(ARDUINO_H) $(TEST_H) $(PS2K_H)

ps2_protocol_unittests.o: $(ARDUINO_H) $(TEST_H) $(PS2P_H)

ps2_keyboard_manager_unittests.o: $(ARDUINO_H) $(TEST_H) $(PS2M_H)


#----- Begin Boilerplate
endif

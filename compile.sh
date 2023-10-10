#!/bin/bash
avr-as -g -mmcu=atmega328p -o ${1}.o ${1}.s
avr-ld -o ${1}.elf ${1}.o
avr-objcopy -O ihex -R .eeprom ${1}.elf ${1}.hex

avrdude -C /etc/avrdude.conf -p atmega328p -c arduino -P /dev/ttyUSB0 -b 57600 -D -U flash:w:${1}.hex:i 

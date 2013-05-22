#
# Simplified Makefile for the Atmel SAM4E
#
# Rob Laswick
# May 2013
#

all: getting_started.axf
	@arm-none-eabi-objdump -DS getting_started.axf >| getting_started.out.s
	@echo
	@arm-none-eabi-gcc --version

getting_started.axf: getting_started.o
	arm-none-eabi-gcc getting_started.o -T getting_started.ld -nostartfiles \
      -Xlinker -Map=getting_started.map -o getting_started.axf \
      -mcpu=cortex-m4 -mthumb

%.o: %.s
	arm-none-eabi-as -g getting_started.s -o getting_started.o \
      -mcpu=cortex-m4 -mthumb

clean:
	rm -f getting_started.o
	rm -f getting_started.axf
	rm -f getting_started.map
	rm -f getting_started.out.s


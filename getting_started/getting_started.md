
# GETTING STARTED GUIDE

## Atmel SAM4E / ARM Cortex M4F Project

Rob Laswick  
May 21 2013  
[www.laswick.net](http://www.laswick.net)


***
## GETTING STARTED

Read the [project page](http://www.laswick.net/sam.html).


***
## THE TOOLCHAIN

We'll be using the GNU tools, newlib, and openocd, **and** we'll be building our toolchain from scratch!  Checkout my [ARM Toolchain Project](http://www.laswick.net/arm-toolchain.html) for a complete set of scripts that will actually download, configure, patch, build, and install the entire toolchain for you _(including `binutils`, `gcc`, `newlib`, `gdb`, and `openocd`)_!  These scripts are relatively simple and easy to modify should you feel the need to customize them.


#### NOTE

Typically non-commercial tools only provide an assembler, compiler, and linker.  They do not provide any processor specific support files, such as `start code`, `linker scripts`, and `processor header files`...BUT FEAR NOT...I've got you covered ;)


***
## DOWNLOAD THE PROJECT (SOURCE CODE)

Public (read-only) Access:

        git clone git://github.com/laswick/sam.git sam.git


Private (read-write) Access:

        git clone git@github.com:laswick/sam.git sam.git

***
## VERIFY YOUR TOOLCHAIN

Enter the `sam.git` directory, then move into the `getting_started` directory.

        cd sam.git/getting_started

You should see 4 files:

        getting_started.md   (this document)
        getting_started.s    (simplified start code)
        getting_started.ld   (simplified linker script)
        getting_started.mak  (Makefile)

`symlink` the Makefile as `makefile` for convenience:

        ln -s getting_started.mak makefile

Type `make`

`make` should complete without errors and produce 

        getting_started.axf    : full image
        getting_started.out.s  : disassembly listing


Connect the `SAM-ICE` debugger to the `SAM4E-EK` development board, and apply power to the board.

In a shell type _(note: depending on your setup, you may need to do this as root)_:

        ~/opt/arm-toolchain/openocd/bin/openocd -f interface/jlink.cfg -f board/atmel_sam4s_ek.cfg


In a separate shell (in the same directory) type

        arm-none-eabi-gdb getting_started.axf

From the (gdb) prompt:

Type `target remote localhost:3333` to connect to the gdb server (`openocd`)

Type `monitor at91sam4 gpnvm set 1` to program the `boot-from-flash` switch.

Type `monitor flash write_image erase "getting_started.axf" 0 elf` to program the image into the board.

Type 'x/100x 0` to display 100 bytes of memory.  You should see a _signature_ word of ` 0xabcdef55 ` at address  ` 0x00000100`.

Type `layout src` to view the source and assembly listings.

Type `tb first_break` to set a temporary breakpoint in the source.

Type `c` to allow the software to run.  gdb will halt at `first_break`.

From here use the step instruction `si` to step through the rest of the program.

If all went well, the **blue** LED should be now be **on**!


***
## NOW WHAT?

Read the `sam.git/README.md` file to understand more about this project and how it may be of use to you.

Enjoy, and happy hacking ;)

-- Rob --






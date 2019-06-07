@echo. off

:: qt4_blink.c,
:: ref, source code, http://hc08web.de/#examples
:: SDCC manual, http://sdcc.sourceforge.net/doc/sdccman.pdf
:: see page 29, Command line option, select target MCU
:: how to compile

:: xiaolaba, 2018-OCT-20
:: 2018-NOV-12, split command the multi lines, ^


:: del *.asm
del *.cdb
del *.lk
del *.lst
del *.map
del *.rel
del *.rst
del *.sym
del *.s19

pause
cls


:: ^ is used to split the command to multi lines, easy for reading
:: compile multiple C files for QT4
:: sdcc -c -mhc08 --data-loc 0x80 --code-loc 0xEE00 --stack-loc 0xFF xmp.c
:: sdcc -c -mhc08 --data-loc 0x80 --code-loc 0xEE00 --stack-loc 0xFF usleep.c
sdcc    -mhc08 --data-loc 0x80 --code-loc 0xEE00 --stack-loc 0xFF ^
        test.c


:::: then link them 
sdcc    -mhc08 --data-loc 0x80 --code-loc 0xEE00 --stack-loc 0xFF ^
        -o test.s19 ^
        test.rel




:: clear screen
::cls


@echo.
@echo *.rst is the disassembly code and cpu cycle counter list
@echo *.s19 is the firmware
:end




pause
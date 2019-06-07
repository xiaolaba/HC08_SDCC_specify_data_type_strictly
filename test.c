/*
 * xiaolaba, 2019-JUN-06
 * sdcc 3.9.0 used
 * 
how to build :

:: compile multiple C files for QT4
sdcc -c -mhc08 --data-loc 0x80 --code-loc 0xEE00 --stack-loc 0xFF xmp.c
sdcc -c -mhc08 --data-loc 0x80 --code-loc 0xEE00 --stack-loc 0xFF usleep.c
sdcc    -mhc08 --data-loc 0x80 --code-loc 0xEE00 --stack-loc 0xFF ^
        test.c

:::: then link them 
sdcc    -mhc08 --data-loc 0x80 --code-loc 0xEE00 --stack-loc 0xFF ^
        -o test.s19 ^
        test.rel
 */ 

#include <mc68hc908qy.h>

#define base 0x12340000l

volatile unsigned long ir_code32bit = 0xFFFFFFFF;

// 0b11000000 = unsigned 0xC0 = signed -0x40
// 0b01000000 = unsigned 0x40 = signed +0x40

void main() {
/*
    ir_code32bit = base + (0b01000000  <<8); // correct 0x12344000
    ir_code32bit = base + (0b01000000u <<8); // correct 0x12344000
    ir_code32bit = base + (-0b01000000 <<8); // correct 0x12344000
    ir_code32bit = base + (0b11000000u <<8); // correct 0x12344000    
*/

    ir_code32bit = base + ( 0b11000000  <<8); // = 0x12340000 + (-0x40 << 8 ) = 0x1233C000, need signed int extension
    ir_code32bit = base + (-0b01000000  <<8); // = 0x12340000 - (0x40  << 8 ) = 0x1233C000, need singed int extension
          
    ir_code32bit = base + (0b1100000000000000); // = 0x12340000 + 0x0000C000 = 0x1234C000, no need signed int extension 

//    ir_code32bit = base + (0b11000000l  <<8); // 0xc0  << 8, wrong   0x1233c000
//    ir_code32bit = base + (0b11000000u <<8) + (unsigned char)(~0x1); // 0xc0u << 8, correct 0x1234c000
//    ir_code32bit = base + (0b11000000u <<8) + (~0x80); // 0xc0u << 8, correct 0x1234c000

    ir_code32bit = base + (0xC0u <<8) + (unsigned char)(~0xF0); // correct 0x1234c03F, no need signed int extension
    ir_code32bit = base + (0xC0u <<8) + (~0xF0); //  0x1234bf3F, need signed int extension

  
}




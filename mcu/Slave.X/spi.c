//------------------------------------------------------------------------------
//Initialization SSP1
//  Mode SPI Master
//  RC3 -> SCLK y RC5 -> MOSI
//  High priority interrupt
//------------------------------------------------------------------------------
#include "spi.h"

void spi_ini(void){
    //Setup PPS Pins
    SSP1CLKPPS = 0x13;    
    RC3PPS=0x0F; 
    RC5PPS=0x10;  
    SSP1DATPPS=0x14;   
    //SPI setup
    SSP1STAT=0x40;
    SSP1CON1=0x02;
    SSP1ADD=0x01;
    ANSELC=0xC7;
    TRISC=0xD7;

    SSP1CON1bits.SSPEN=1;
    PIE3bits.SSP1IE=1;
}

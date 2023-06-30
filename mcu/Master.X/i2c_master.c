//------------------------------------------------------------------------------
//Initialization SSP2
//  Mode I2C Master
//  1 MHz clock frequency
//  RB1 -> SCL y RB4 -> SDA
//  High priority interrupt
//------------------------------------------------------------------------------
#include "i2c_master.h"

void i2c_ini_master(void){
    TRISBbits.TRISB1=1;
    TRISBbits.TRISB2=1;
    ANSELBbits.ANSELB1=0;
    ANSELBbits.ANSELB2=0;
    
    SSP2CLKPPS=0X09;
    SSP2DATPPS=0X0A;
    RB1PPS=0X11;
    RB2PPS=0X12;
    
    
    SSP2STATbits.SMP=1;
    SSP2CON1=0X00;
    SSP2CON1bits.SSPM3=1;
    SSP2ADD=0x0F;
    SSP2CON1bits.SSPEN=1;
    
    PIR3bits.SSPIF=0;
    IPR3bits.SSP2IP=1;
    PIE3bits.SSP2IE=1;
}

void i2c_start(void){
    SSP2CON2bits.SEN=1;
}
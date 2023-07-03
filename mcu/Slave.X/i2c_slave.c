//------------------------------------------------------------------------------
//Initialization SSP2
//  Mode I2C Slave
//  Slave address 0x06
//  RB1 -> SCL y RB4 -> SDA
//  High priority interrupt
//------------------------------------------------------------------------------
#include "i2c_slave.h"

void i2c_ini_slave(void){
    //Pin config
    TRISBbits.TRISB1=1;
    TRISBbits.TRISB2=1;
    ANSELBbits.ANSELB1=0;
    ANSELBbits.ANSELB2=0;
    SSP2CLKPPS=0X09;
    SSP2DATPPS=0X0A;
    RB1PPS=0X11;
    RB2PPS=0X12;
    //I2C configuration
    SSP2STATbits.SMP=1;
    SSP2CON1=0x06;  //7-bit address configuration
    SSP2CON2=0x81;
    SSP2ADD=(uint8_t)(0x06<<1); //Address
    SSP2MSK=0xFE;
    SSP2CON1bits.SSPEN=1;
    //Interrupt configuration
    PIR3bits.SSPIF=0;
    IPR3bits.SSP2IP=1;
    PIE3bits.SSP2IE=1;
}
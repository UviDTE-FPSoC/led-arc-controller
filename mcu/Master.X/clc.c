//------------------------------------------------------------------------------
//Initialization CLC
//  Clock permission for the SPI clock of LED strip
//  RA3 -> SCL y RA1 -> Permission
//  High priority interrupt
//------------------------------------------------------------------------------
#include "clc.h"

void clc_ini(void){
    ANSELAbits.ANSELA1=0;
    TRISAbits.TRISA1=0;
    LATAbits.LATA1=1;
    
    ANSELAbits.ANSELA3=0;
    TRISAbits.TRISA3=0;
    
    CLC1POL=0x00;
    CLC1SEL0=0x2E;
    CLC1SEL1=0x00;
    CLC1SEL2=0x01;
    CLC1SEL3=0x02;
    CLC1GLS0=0x02;
    CLC1GLS1=0x04;
    CLC1GLS2=0x00;
    CLC1GLS3=0x00;
    CLC1CON=0x80;
    CLCIN0PPS=0x01;
    RA3PPS=0x18;
}
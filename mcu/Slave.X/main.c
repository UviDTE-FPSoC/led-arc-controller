//------------------------------------------------------------------------------
//Slave Module
//  Waits for the reception of data, save it in memory, and activate the transmission
//  with the general I2C call. Operation through interrupts.
//------------------------------------------------------------------------------
#pragma config FEXTOSC = OFF
#pragma config RSTOSC = HFINTOSC_64MHZ
#pragma config LVP = ON
#pragma config XINST = OFF
#pragma config WDTE=OFF
#pragma config BORV = VBOR_190
#pragma config CLKOUTEN = OFF

#include <xc.h>
#include "i2c_slave.h"
#include "spi.h"
#include <stdlib.h>

#define _XTAL_FREQ 64000000 //micro frequency

uint8_t *pixel; //Pointer to the array of lights status data
uint8_t spi_estado=0;   //SPI transmission status variable
                    //state=0 -> start frame
                    //state=1 -> LED status transmission
                    //state=2 -> end frame
                    //state=3 -> end of transmission
uint8_t s=0;    //Internal variable of the SPI transmission functions
uint8_t n=0;    //Variable to iterate over the number of LEDs
uint8_t direccion;  //Variable I2C address
uint16_t n_led, led_group, led_env=0; //Variable number of LEDs, groups of LEDs and LED info trasmitted
uint16_t  est_sec, est_sec_r=0; //Variable sequences and done sequences
uint16_t i=0, contador=0;
uint32_t periodo, rep, rep_r=0, tiempo=0;   //Variable period in between light state changes, repetitions, repetitions done and time
volatile uint8_t dummy;

//------------------------------------------------------------------------------
//Timer0 initialization. 100 us.
//------------------------------------------------------------------------------
void ini_timer0(void){
    T0CON1=0x43;
    T0CON0=0x00;
    TMR0L=0x00;
    TMR0H=0xC7;
    PIR0bits.TMR0IF=0;
    PIE0bits.TMR0IE=1;
}

//------------------------------------------------------------------------------
//Initialization of the memory that will store the data from the I2C communication.
//  secu -> number of sequences
//  led -> number of LEDs groups
//------------------------------------------------------------------------------
uint8_t* ini_array(uint16_t secu, uint16_t led){
    uint8_t* array=(uint8_t*)malloc((secu*led)*sizeof(char));
    return array;
}

//------------------------------------------------------------------------------
//Records the state of a LED in memory.
//  m -> LED position
//  c -> status (0 a 255)
//------------------------------------------------------------------------------
void set_pixel_color(uint16_t m, uint8_t c){
    if(m<led_group*est_sec){
        uint8_t *p=&pixel[m];
        *p=c;
    }
}

//------------------------------------------------------------------------------
//Sends the end frame following the DotStar library.
//------------------------------------------------------------------------------
void end_frame(void){
        SSP1BUF=0xFF;
        s++;
        if(s==((n_led+15)/16)){
            s=0;
            spi_estado++;
        }
}

//------------------------------------------------------------------------------
//Sends the data stored in the pixel to the LED strip.
//The data is sent according to the datasheet of the strip, first one byte with a value of 1
//followed by the three bytes of intensity.
//------------------------------------------------------------------------------
void envio_pixel(void){
    if(s==0){
        SSP1BUF=0xFF;
        s++;
    }
    else if(s==1 || s==2){
        SSP1BUF=pixel[n+est_sec_r*led_group];
        s++;
    }
    else if(s==3){
        SSP1BUF=pixel[n+est_sec_r*led_group];
        s=0;
        led_env++;
        
        if(led_env==(n_led/led_group)){ //If it has been send one group, it continues with the next one until there is no more
            led_env=0;
            n++;
            if(n==led_group){
                n=0;
                spi_estado++;
            }
        }
    }
}

//------------------------------------------------------------------------------
//Sends the start frame following the datasheet.
//------------------------------------------------------------------------------
void start_frame(void){
    SSP1BUF=0x00;
    s++;
    if(s==4){
        s=0;
        spi_estado++;
    }
}

//------------------------------------------------------------------------------
//Management of state sequences and repetitions.
//------------------------------------------------------------------------------
void gestion_est_rep(void){
    if(est_sec_r<est_sec){  //If there are remaining sequences, their transmission is initiated.
        start_frame();
    }
    else{
        est_sec_r=0; 
        if(rep==0){ //Infinite repetition
            start_frame();
        }
        else if(rep_r==(rep-1)){ //When the repetitions are over, the memory is released
            free(pixel);
            rep_r=0;
            PIE3bits.SSP1IE=0; //SPI interrupt permission
        }
        else{
            rep_r++;
            start_frame();
        }
    }    
}

void __interrupt(high_priority) interrupciones(void){
    if (PIR3bits.SSP1IF==1 && PIE3bits.SSP1IE==1){  //SPI interrupt
        PIR3bits.SSP1IF=0;  //Clear flag interrupt
        switch(spi_estado){ //Status of SPI transmission
            case 0:
                start_frame();
                break;
            case 1:
                envio_pixel();
                break;
            case 2:
                end_frame();
                break;
            case 3:
                spi_estado=0;
                est_sec_r++;
                T0CON0bits.T0EN=1; //Start Timer0
                break;
        }
    }
    if (PIR3bits.SSP2IF==1 && PIE3bits.SSP2IE==1){  //I2C interrupt
        PIR3bits.SSP2IF=0;  //Clear flag interrupt
        if (SSP2STATbits.RW==0){    //Verification of write operation
            if (SSP2STATbits.D_nA==0){  //Verification of address reception
                direccion=SSP2BUF;
                SSP2CON1bits.CKP=1; //Clock release
                if (direccion==0x00){   //If generall call, start SPI transmission
                    PIE3bits.SSP1IE=1;
                    start_frame();
                }
                else{
                    i=0;
                    contador=0;
                }
            }
            else{
                if (direccion==0x0C){   //Assigned address verification
                    if(i==0){
                       n_led=((uint16_t)SSP2BUF << 8);
                    }
                    else if(i==1){
                        n_led=n_led | (uint16_t)SSP2BUF;
                    }
                    else if(i==2){
                        periodo=((uint32_t)SSP2BUF << 24);
                    }
                    else if(i==3){
                        periodo=periodo | ((uint32_t)SSP2BUF << 16);
                    }
                    else if(i==4){
                        periodo=periodo | ((uint32_t)SSP2BUF << 8);
                    }
                    else if(i==5){
                        periodo=periodo | (uint32_t)SSP2BUF;
                        periodo=periodo/100;
                    }
                    else if(i==6){
                        est_sec=((uint16_t)SSP2BUF << 8);
                    }
                    else if(i==7){
                        est_sec=est_sec | (uint16_t)SSP2BUF;
                    }
                    else if(i==8){
                        led_group=((uint16_t)SSP2BUF << 8);
                    }
                    else if(i==9){
                        led_group=led_group | (uint16_t)SSP2BUF;
                        pixel=ini_array(est_sec,led_group); //Initialization of dynamic memory
                    }
                    else if(i==10){
                        rep=((uint32_t)SSP2BUF << 24);
                    }
                    else if(i==11){
                        rep=rep | ((uint32_t)SSP2BUF << 16);
                    }
                    else if(i==12){
                        rep=rep | ((uint32_t)SSP2BUF << 8);
                    }
                    else if(i==13){
                        rep=rep | (uint32_t)SSP2BUF;
                    }
                    else{
                        set_pixel_color(contador,SSP2BUF);  //Save of illumination states
                        contador++;
                    }
                    i++;
                    SSP2CON1bits.CKP=1;
                }
                else{
                    dummy=SSP2BUF;  //To avoid unwanted info
                }
            }
        }
    }
    if(PIR0bits.TMR0IF==1 && PIE0bits.TMR0IE==1){   //Timer0 interrupt
        PIR0bits.TMR0IF=0;  //Clear flag interrupt
        tiempo++; //Count of 100 us
        if(tiempo>=periodo){
            T0CON0bits.T0EN=0;  //Stop Timer0
            tiempo=0;
            gestion_est_rep();
        }
    }
}

void main(void){
    //Initialization of the system
    spi_ini();
    i2c_ini_slave();
    ini_timer0();
    
    //Interrupts permitted
    INTCONbits.PEIE=1;
    INTCONbits.GIE=1;
    while(1);
}
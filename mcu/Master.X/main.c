//------------------------------------------------------------------------------
//Master Module
//  Waits for Ethernet reception, then handle the received data and 
//  manages the start of the lighting of all LED strips. Operation through interrupts.
//------------------------------------------------------------------------------
#include "mcc_generated_files/mcc.h"
#include "mcc_generated_files/TCPIPLibrary/network.h"
#include "mcc_generated_files/TCPIPLibrary/ip_database.h"
#include "lan9250.h"
#include "mcc_generated_files/TCPIPLibrary/tcpv4.h"
#include "mcc_generated_files/TCPIPLibrary/ipv4.h"
#include "mcc_generated_files/TCPIPLibrary/tcpip_config.h"
#include "i2c_master.h"
#include "memory_buffer.h"
#include "clc.h"
#include <xc.h>
#include <stdlib.h>
//Ethernet variables
static tcpTCB_t port7TCB;
extern uint8_t RXBuffer[500];   //Array for Ethernet reception, to increase its syze, modify the memory_buffer.h file
uint8_t pixel[500]; //Array with LEDs groups states data
extern uint8_t TXBuffer[100];   //Array for Ethernet send
socketState_t socket_state; //Variable to know Ethernet transmission status
uint16_t rxLen; //Syze of received data
uint8_t error=0, mensaje;
uint8_t dir_slave[]={0x0C,0x0F}, dir_gen=0x00;  //Array with slaves addresses
uint8_t direccion, timer_type;  ////Variable I2C address and time type
uint16_t contador=0;
uint8_t estado_t=0; //I2C transmission status variable
uint8_t trigger;    //Variable enable trigger
uint32_t delay, duration;   //Variable delay and duration times
uint16_t n_arc; //Variable number of arcs
uint16_t arc_tar;   //Variable I2C slave target
uint8_t spi_estado=0;   //SPI transmission status variable
                    //state=0 -> start frame
                    //state=1 -> LED status transmission
                    //state=2 -> end frame
                    //state=3 -> end of transmission
uint8_t s=0;    //Internal variable of the SPI transmission functions
uint8_t n=0;    //Variable to iterate over the number of LEDs
uint16_t n_led, led_group, led_env=0; //Variable number of LEDs, groups of LEDs and LED info trasmitted
uint16_t  est_sec, est_sec_r=0; //Variable sequences and done sequences
uint32_t periodo, rep, rep_r=0, tiempo=0, tiempo1=0;    //Variable period in between light state changes, repetitions, repetitions done and times

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
//Timer2 initialization. 5 us.
//------------------------------------------------------------------------------
void ini_timer2(void){
    T2CLKCON = 0x01;
    T2HLT = 0x20;
    T2RST = 0x00;
    T2PR = 0x4F;
    T2TMR = 0x00;
    T2CON = 0x00;
    PIR4bits.TMR2IF=0;
    PIE4bits.TMR2IE=1;
}

//------------------------------------------------------------------------------
//Camera trigger
//------------------------------------------------------------------------------
void trigger_cam(void){
    if(trigger==1){
        timer_type=0;   //delay between light state change and trigger
        T2CONbits.ON=1; //Timer 2 start
    }
}

//------------------------------------------------------------------------------
//Sends the data stored in the pixel to the LED strip.
//The data is sent according to the datasheet of the strip, first one byte with a value of 1
//followed by the three bytes of intensity.
//------------------------------------------------------------------------------
void envio_pixel(){
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
        else if(rep_r==(rep-1)){    //When the repetitions are over, handle Ethernet communication
            rep_r=0;
            LATAbits.LATA1=1;   //LED strip clock permission negated
            PIE3bits.SSP1IE=0;  //SPI interrupt permission
            PIR0bits.IOCIF=0;   //Ethernet interrupt flag
            PIE0bits.IOCIE=1;   //Ethernet interrupt permission
            SPI1_Open(MAC_CONFIG);  //SPI configuration Ethernet communication
        }
        else{
            rep_r++;
            start_frame();
        }
    }    
}

//------------------------------------------------------------------------------
//I2C general call
//------------------------------------------------------------------------------
void general_call(void){
    switch(estado_t){
            case 0:
                SSP2BUF=0x00;   //General call address
                estado_t=1;
                break;
            case 1:
                if (SSP2CON2bits.ACKSTAT==0){   //ACK bit reception
                    estado_t=0;
                    error=0;
                    SSP2CON2bits.PEN=1; //I2C stop
                    PIE3bits.SSP1IE=0;
                    SPI1_Open(MAC_CONFIG);  //SPI configuration for Ethernet communication
                    TCP_Send(&port7TCB, (uint8_t*)&error, 1);   //Error transmission
                    SPI1_Open(LED_CONFIG);  //SPI configuration for LED strip
                    PIE3bits.SSP1IE=1;
                    LATAbits.LATA1=0;   //Clock permission
                    start_frame();
                }
                else{
                    error=1;
                    estado_t=0;
                    SSP2CON2bits.PEN=1; //I2C stop
                    PIE3bits.SSP1IE=0;
                    SPI1_Open(MAC_CONFIG);  //SPI configuration for Ethernet communication
                    TCP_Send(&port7TCB, (uint8_t*)&error, 1);   //Error transmission
                }
                break;
        }
}

//------------------------------------------------------------------------------
//I2C transmission
//------------------------------------------------------------------------------
void gestion_transmision(void){
    uint8_t *p=&RXBuffer[3];    //Pointer to data
    switch(estado_t){
            case 0:
                SSP2BUF=direccion;  //Address send
                estado_t=1;
                break;
            case 1:
                if (SSP2CON2bits.ACKSTAT==0){   //If ACK bit, send first byte
                    SSP2BUF=*p;
                    estado_t=2;
                }
                else{   //No ACK bit, stop and error transmission
                    error=1;
                    estado_t=3;
                    SSP2CON2bits.PEN=1;
                    TCP_Send(&port7TCB, (uint8_t*)&error, 1);
                }
                break;
            case 2:
                if (SSP2CON2bits.ACKSTAT==0){   //ACK bit verification
                    if (contador==(rxLen-4)){   //Reached the end of data to send verification
                        error=0;
                        estado_t=3;
                        SSP2CON2bits.PEN=1;
                        TCP_Send(&port7TCB, (uint8_t*)&error, 1);   //Error transmission
                    }
                    else{
                        contador++;
                        *p++;
                        SSP2BUF=*p;
                    }
                }
                else{   //No ACK bit, stop and error transmission
                    error=1;
                    estado_t=3;
                    SSP2CON2bits.PEN=1;
                    TCP_Send(&port7TCB, (uint8_t*)&error, 1);
                }
                break;
            case 3:
                estado_t=0;
                break;
        }
}

//------------------------------------------------------------------------------
//Start sequence message management.
//------------------------------------------------------------------------------
void start_lights(void){
    PIR0bits.IOCIF=0;
    PIE0bits.IOCIE=0;   //Stop Ethernet communication
    if(n_arc==1){   //If there are no more arcs than master then start illumination
        SPI1_Open(MAC_CONFIG);
        error=0;
        TCP_Send(&port7TCB, (uint8_t*)&error, 1);   //Error transmission
        SPI1_Open(LED_CONFIG);  //SPI configuration for LED strip
        PIE3bits.SSP1IE=1;
        LATAbits.LATA1=0;   //Clock permission
        start_frame();
    }
    else{
        direccion=dir_gen;
        i2c_start();    //General call start
    }
}

//------------------------------------------------------------------------------
//I2C send management.
//  arc -> number of target arc
//------------------------------------------------------------------------------
void i2c_envio(uint16_t arc){
    direccion=dir_slave[arc-1];
    i2c_start();
}

//------------------------------------------------------------------------------
//Global configuration management. Following transmission protocol.
//------------------------------------------------------------------------------
void global_config(void){
    trigger=RXBuffer[1];
    delay=((uint32_t)RXBuffer[2] << 24);
    delay=delay | ((uint32_t)RXBuffer[3] << 16);
    delay=delay | ((uint32_t)RXBuffer[4] << 8);
    delay=delay | (uint32_t)RXBuffer[5];
    delay=delay/5;  //Because we use 5 us as time base
    duration=((uint32_t)RXBuffer[6] << 24);
    duration=duration | ((uint32_t)RXBuffer[7] << 16);
    duration=duration | ((uint32_t)RXBuffer[8] << 8);
    duration=duration | (uint32_t)RXBuffer[9];
    duration=duration/5;    //Because we use 5 us as time base
    n_arc=((uint16_t)RXBuffer[10] << 8);
    n_arc=n_arc | (uint16_t)RXBuffer[11];
    error=0;
    TCP_Send(&port7TCB, (uint8_t*)&error, 1);   //Error transmission
}

//------------------------------------------------------------------------------
//Arc configuration management. Following transmission protocol.
//------------------------------------------------------------------------------
void arc_config(void){
    arc_tar=(uint16_t)RXBuffer[1]<<8;
    arc_tar=arc_tar | (uint16_t) RXBuffer[2];
    if(arc_tar==0){ //Configuration of master module if arc_tar is 0
        n_led=((uint16_t)RXBuffer[3] << 8);
        n_led=n_led | (uint16_t)RXBuffer[4];
        periodo=((uint32_t)RXBuffer[5] << 24);
        periodo=periodo | ((uint32_t)RXBuffer[6] << 16);
        periodo=periodo | ((uint32_t)RXBuffer[7] << 8);
        periodo=periodo | (uint32_t)RXBuffer[8];
        periodo=periodo/100;    //Because we use 100 us as time base
        est_sec=((uint16_t)RXBuffer[9] << 8);
        est_sec=est_sec | (uint16_t)RXBuffer[10];
        led_group=((uint16_t)RXBuffer[11] << 8);
        led_group=led_group | (uint16_t)RXBuffer[12];
        rep=((uint32_t)RXBuffer[13] << 24);
        rep=rep | ((uint32_t)RXBuffer[14] << 16);
        rep=rep | ((uint32_t)RXBuffer[15] << 8);
        rep=rep | (uint32_t)RXBuffer[16];
        for(uint32_t i=0;i<led_group*est_sec;i++){  //Save of light states in memory
            pixel[i]=RXBuffer[17+i];
        }
        error=0;
        TCP_Send(&port7TCB, (uint8_t*)&error, 1);   //Error transmission
    }
    else{   //When the configuration belongs to a slave, it is sent to the slave selected
        i2c_envio(arc_tar);
    }
}

void __interrupt(high_priority) interrupciones(void){
    if(PIE4bits.TMR1IE == 1 && PIR4bits.TMR1IF == 1)    //Time base for Ethernet library
        {
            TMR1_ISR();
        }
    if(PIR0bits.IOCIF==1 && PIE0bits.IOCIE==1){ //Ethernet interrupt
        PIR0bits.IOCIF=0;   //Clear flag interrupt
        if(IOCAFbits.IOCAF4==1){    //Interrupt of pin A4 verification to avoid false positives
            IOCAFbits.IOCAF4=0; //Clear flag interrupt
            LATAbits.LATA1=1;   //No permission for communication with LED strip
            PIE3bits.SSP1IE=0;  //SPI interrupt permission negated
            SPI1_Open(MAC_CONFIG);  //SPI configuration for Ethernet
            Network_Manage();   //Manage of received data
            socket_state = TCP_SocketPoll(&port7TCB);   //Socket state poll
            rxLen=TCP_GetRxLength(&port7TCB);   //Length of received data
            if(rxLen > 0){  //If there is data, manages the data
                rxLen=TCP_GetReceivedData(&port7TCB);   //Length of received data
                mensaje=RXBuffer[0];    //Read the first byte
                switch(mensaje){
                case 0:
                    global_config();
                    break;
                case 1:
                    arc_config();
                    break;
                case 2:
                    start_lights();
                    break;
                }
                TCP_InsertRxBuffer(&port7TCB, RXBuffer, sizeof(RXBuffer));  //Reuse the buffer
            }
            if(socket_state==SOCKET_CLOSING){   //To know if the client has disconnected from the server, then reboot the server if it happens
                TCP_SocketRemove(&port7TCB);
                TCP_SocketInit(&port7TCB);
                TCP_Bind(&port7TCB, 7);
                TCP_InsertRxBuffer(&port7TCB, &RXBuffer, sizeof(RXBuffer));
                TCP_Listen(&port7TCB);
            }
        }
    }
    if (PIR3bits.SSP2IF==1 && PIE3bits.SSP2IE==1){  //I2C interrupt
        PIR3bits.SSP2IF=0;  //Clear flag interrupt
        switch(direccion){  //Add here new slave addresses to include them in the system
            case 0x00:
                general_call();
                break;
            case 0x0C:
                gestion_transmision();
                break;
        }
    }
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
                //Handle Ethernet communication while waiting for a light state change
                //Prove to do it without clearing flag interrupts
                ETH_EventHandler(); //Clear internal Ethernet module flag interrupt
                LATAbits.LATA1=1;
                PIE3bits.SSP1IE=0;
                PIR0bits.IOCIF=0;   //Clear Ethernet flag interrupt
                PIE0bits.IOCIE=1;
                SPI1_Open(MAC_CONFIG);  //SPI configuration for Ethernet
                T0CON0bits.T0EN=1;  //Start Timer0
                trigger_cam();  //Call camera trigger
                break;
        }
    }
    if(PIR0bits.TMR0IF==1 && PIE0bits.TMR0IE==1){   //Timer0 interrupt
        PIR0bits.TMR0IF=0;  //Clear flag interrupt
        tiempo++;   //Count of 100 us
        if(tiempo>=periodo){
            T0CON0bits.T0EN=0;  //Stop Timer0
            tiempo=0;
            //Stop handling Ethernet communication
            ETH_EventHandler();
            PIR0bits.IOCIF=0;
            PIE0bits.IOCIE=0;
            SPI1_Open(LED_CONFIG);  //SPI configuration for LED strip
            PIR3bits.SSP1IF=0;
            PIE3bits.SSP1IE=1;
            LATAbits.LATA1=0;
            gestion_est_rep();
        }      
    }
    if(PIR4bits.TMR2IF==1 && PIE4bits.TMR2IE==1){   //Timer2 interrupt
        PIR4bits.TMR2IF=0;  //Clear flag interrupt
        tiempo1++;  //Count of 5 us
        switch(timer_type){ //Timer for duration time or delay time
            case 0:
                if(tiempo1>=delay){
                    T2CONbits.ON=0; //Stop Timer2
                    tiempo1=0;
                    LATAbits.LATA0=0;   //Trigger activate
                    timer_type=1;   //Timer for duration time
                    T2CONbits.ON=1; //Start Timer2
                }
                break;
            case 1:
                if(tiempo1>=duration){
                    T2CONbits.ON=0; //Stop Timer2
                    tiempo1=0;
                    LATAbits.LATA0=1;   //Trigger stop
                }
                break;
        }
    }
}

void main(void)
{
    //System initialization
    SYSTEM_Initialize();
    INTCONbits.PEIE=1;
    INTCONbits.GIE=1;
    i2c_ini_master();
    clc_ini();
    ini_timer0();
    ini_timer2();
    PIE3bits.SSP1IE=0;
    
    //Ethernet interrupt configuration
    TRISAbits.TRISA4=1;
    ANSELAbits.ANSELA4=0;
    IOCAFbits.IOCAF4=0;
    IOCANbits.IOCAN4=0;
    IOCAPbits.IOCAP4=1;
    PIE0bits.IOCIE=1;
    
    //Camera trigger
    ANSELAbits.ANSELA0=0;
    TRISAbits.TRISA0=0;
    LATAbits.LATA0=1;
    
    //SPI LED strip permission pin
    ANSELAbits.ANSELA1=0;
    TRISAbits.TRISA1=0;
    LATAbits.LATA1=1;
    
    //Server creation
    TCP_SocketInit(&port7TCB);
    TCP_Bind(&port7TCB, 7);
    TCP_InsertRxBuffer(&port7TCB, &RXBuffer, sizeof(RXBuffer));
    TCP_Listen(&port7TCB);
    Network_Manage();
    while (1);
}
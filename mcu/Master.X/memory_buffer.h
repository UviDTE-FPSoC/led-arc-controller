#ifndef MEMORY_BUFFER_H
#define	MEMORY_BUFFER_H

#include <stdint.h>
#include <string.h>
#include "mcc_generated_files/spi1.h"
#include "mcc_generated_files/TCPIPLibrary/tcpip_types.h"

#define TXBUFFER_SIZE       (100)
#define RXBUFFER_SIZE       (500)

#define ETH_NCS_HIGH()      do{LATD0 = 1;} while(0)  //Use the Ethernet Chip select as per your hardware specification here
#define ETH_NCS_LOW()       do{LATD0 = 0;} while(0)  //Use the Ethernet Chip select as per your hardware specification here
        
#define ETH_SPI_READ8()     SPI1_ExchangeByte(0)
#define ETH_SPI_WRITE8(a)   SPI1_ExchangeByte(a)

typedef struct 
{
    uint8_t *start;
    uint8_t *currentLocation;
    uint16_t bufferLength;
    uint16_t dataLength;
 } memoryBuffer;
 
 typedef struct 
 {
     memoryBuffer txBuffer;
     memoryBuffer rxBuffer;
 } lan_buffers;
 
 extern lan_buffers dataBuffers;

 void TXBuffer_Init(void);
 void RXBuffer_Init(void);
 uint16_t BufferReceive(memoryBuffer *buffer, uint16_t length);
 void BufferReplaceAtOffset( memoryBuffer *buffer, char *data, uint16_t length, uint16_t offset);
 
 uint8_t BufferRead8(memoryBuffer *buffer);
 uint16_t BufferRead16(memoryBuffer *buffer);
 uint32_t BufferRead32(memoryBuffer *buffer);
 uint16_t BufferReadBlock(memoryBuffer *buffer,  void *data , uint16_t length);

 
 void BufferWrite8(memoryBuffer *buffer, uint8_t data);
 void BufferWrite16(memoryBuffer *buffer, uint16_t data);
 void BufferWrite32(memoryBuffer *buffer, uint32_t data);
 uint16_t BufferWriteString(memoryBuffer *buffer, const char *data);
 uint16_t BufferWriteBlock(memoryBuffer *buffer, char *data, uint16_t length);

 uint8_t BufferPeekCopy(memoryBuffer *buffer, uint16_t offset);
 void BufferDump(memoryBuffer *buffer, uint16_t length);
 error_msg BufferRXtoTXCopy(memoryBuffer *rxbuffer, memoryBuffer *txbuffer, uint16_t length);

 void BufferSend(memoryBuffer *buffer);

 #endif
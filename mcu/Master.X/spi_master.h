#ifndef _SPI_MASTER_H
#define _SPI_MASTER_H

/**
  Section: Included Files
 */
#include <stdint.h>
#include <stdbool.h>
#include "mcc_generated_files/spi1.h"

typedef enum { 
    MAC
} spi_master_configurations_t;

typedef struct {    void (*spiClose)(void);
                    bool (*spiOpen)(void);
                    uint8_t (*exchangeByte)(uint8_t b);
                    void (*exchangeBlock)(void * block, size_t blockSize);
                    void (*writeBlock)(void * block, size_t blockSize);
                    void (*readBlock)(void * block, size_t blockSize);
                    void (*writeByte)(uint8_t byte);
                    uint8_t (*readByte)(void);
                    void (*setSpiISR)(void(*handler)(void));
                    void (*spiISR)(void);
} spi_master_functions_t;

extern const spi_master_functions_t spiMaster[];

bool spi_master_open(spi_master_configurations_t config);   //for backwards compatibility

#endif	// _SPI_MASTER_H
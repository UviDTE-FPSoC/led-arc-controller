#include "spi_master.h"

bool MAC_open(void);

const spi_master_functions_t spiMaster[] = {   
    { SPI1_Close, MAC_open, SPI1_ExchangeByte, SPI1_ExchangeBlock, SPI1_WriteBlock, SPI1_ReadBlock, SPI1_WriteByte, SPI1_ReadByte}
};

bool MAC_open(void){
    return SPI1_Open(MAC_CONFIG);
}

//This function serves keep backwards compatibility with older api users
bool spi_master_open(spi_master_configurations_t config){
    switch(config){
        case MAC:
            return MAC_open();
        default:
            return 0;
    }
}
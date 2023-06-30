#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/Master.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/Master.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=clc.c i2c_master.c lan9250.c main.c memory_buffer.c mcc_generated_files/device_config.c mcc_generated_files/mcc.c mcc_generated_files/pin_manager.c mcc_generated_files/spi1.c mcc_generated_files/TCPIPLibrary/arpv4.c mcc_generated_files/TCPIPLibrary/icmp.c mcc_generated_files/TCPIPLibrary/ipv4.c mcc_generated_files/TCPIPLibrary/ip_database.c mcc_generated_files/TCPIPLibrary/lfsr.c mcc_generated_files/TCPIPLibrary/log.c mcc_generated_files/TCPIPLibrary/log_console.c mcc_generated_files/TCPIPLibrary/mac_address.c mcc_generated_files/TCPIPLibrary/network.c mcc_generated_files/TCPIPLibrary/rtcc.c mcc_generated_files/TCPIPLibrary/tcpv4.c mcc_generated_files/tmr1.c spi_master.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/clc.p1 ${OBJECTDIR}/i2c_master.p1 ${OBJECTDIR}/lan9250.p1 ${OBJECTDIR}/main.p1 ${OBJECTDIR}/memory_buffer.p1 ${OBJECTDIR}/mcc_generated_files/device_config.p1 ${OBJECTDIR}/mcc_generated_files/mcc.p1 ${OBJECTDIR}/mcc_generated_files/pin_manager.p1 ${OBJECTDIR}/mcc_generated_files/spi1.p1 ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/arpv4.p1 ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/icmp.p1 ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/ipv4.p1 ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/ip_database.p1 ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/lfsr.p1 ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/log.p1 ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/log_console.p1 ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/mac_address.p1 ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/network.p1 ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/rtcc.p1 ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/tcpv4.p1 ${OBJECTDIR}/mcc_generated_files/tmr1.p1 ${OBJECTDIR}/spi_master.p1
POSSIBLE_DEPFILES=${OBJECTDIR}/clc.p1.d ${OBJECTDIR}/i2c_master.p1.d ${OBJECTDIR}/lan9250.p1.d ${OBJECTDIR}/main.p1.d ${OBJECTDIR}/memory_buffer.p1.d ${OBJECTDIR}/mcc_generated_files/device_config.p1.d ${OBJECTDIR}/mcc_generated_files/mcc.p1.d ${OBJECTDIR}/mcc_generated_files/pin_manager.p1.d ${OBJECTDIR}/mcc_generated_files/spi1.p1.d ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/arpv4.p1.d ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/icmp.p1.d ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/ipv4.p1.d ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/ip_database.p1.d ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/lfsr.p1.d ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/log.p1.d ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/log_console.p1.d ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/mac_address.p1.d ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/network.p1.d ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/rtcc.p1.d ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/tcpv4.p1.d ${OBJECTDIR}/mcc_generated_files/tmr1.p1.d ${OBJECTDIR}/spi_master.p1.d

# Object Files
OBJECTFILES=${OBJECTDIR}/clc.p1 ${OBJECTDIR}/i2c_master.p1 ${OBJECTDIR}/lan9250.p1 ${OBJECTDIR}/main.p1 ${OBJECTDIR}/memory_buffer.p1 ${OBJECTDIR}/mcc_generated_files/device_config.p1 ${OBJECTDIR}/mcc_generated_files/mcc.p1 ${OBJECTDIR}/mcc_generated_files/pin_manager.p1 ${OBJECTDIR}/mcc_generated_files/spi1.p1 ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/arpv4.p1 ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/icmp.p1 ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/ipv4.p1 ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/ip_database.p1 ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/lfsr.p1 ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/log.p1 ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/log_console.p1 ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/mac_address.p1 ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/network.p1 ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/rtcc.p1 ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/tcpv4.p1 ${OBJECTDIR}/mcc_generated_files/tmr1.p1 ${OBJECTDIR}/spi_master.p1

# Source Files
SOURCEFILES=clc.c i2c_master.c lan9250.c main.c memory_buffer.c mcc_generated_files/device_config.c mcc_generated_files/mcc.c mcc_generated_files/pin_manager.c mcc_generated_files/spi1.c mcc_generated_files/TCPIPLibrary/arpv4.c mcc_generated_files/TCPIPLibrary/icmp.c mcc_generated_files/TCPIPLibrary/ipv4.c mcc_generated_files/TCPIPLibrary/ip_database.c mcc_generated_files/TCPIPLibrary/lfsr.c mcc_generated_files/TCPIPLibrary/log.c mcc_generated_files/TCPIPLibrary/log_console.c mcc_generated_files/TCPIPLibrary/mac_address.c mcc_generated_files/TCPIPLibrary/network.c mcc_generated_files/TCPIPLibrary/rtcc.c mcc_generated_files/TCPIPLibrary/tcpv4.c mcc_generated_files/tmr1.c spi_master.c



CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk ${DISTDIR}/Master.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=18F47Q10
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/clc.p1: clc.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/clc.p1.d 
	@${RM} ${OBJECTDIR}/clc.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -DLAN9250 -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/clc.p1 clc.c 
	@-${MV} ${OBJECTDIR}/clc.d ${OBJECTDIR}/clc.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/clc.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/i2c_master.p1: i2c_master.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/i2c_master.p1.d 
	@${RM} ${OBJECTDIR}/i2c_master.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -DLAN9250 -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/i2c_master.p1 i2c_master.c 
	@-${MV} ${OBJECTDIR}/i2c_master.d ${OBJECTDIR}/i2c_master.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/i2c_master.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/lan9250.p1: lan9250.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/lan9250.p1.d 
	@${RM} ${OBJECTDIR}/lan9250.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -DLAN9250 -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/lan9250.p1 lan9250.c 
	@-${MV} ${OBJECTDIR}/lan9250.d ${OBJECTDIR}/lan9250.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/lan9250.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/main.p1: main.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.p1.d 
	@${RM} ${OBJECTDIR}/main.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -DLAN9250 -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/main.p1 main.c 
	@-${MV} ${OBJECTDIR}/main.d ${OBJECTDIR}/main.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/main.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/memory_buffer.p1: memory_buffer.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/memory_buffer.p1.d 
	@${RM} ${OBJECTDIR}/memory_buffer.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -DLAN9250 -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/memory_buffer.p1 memory_buffer.c 
	@-${MV} ${OBJECTDIR}/memory_buffer.d ${OBJECTDIR}/memory_buffer.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/memory_buffer.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/mcc_generated_files/device_config.p1: mcc_generated_files/device_config.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/device_config.p1.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/device_config.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -DLAN9250 -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/mcc_generated_files/device_config.p1 mcc_generated_files/device_config.c 
	@-${MV} ${OBJECTDIR}/mcc_generated_files/device_config.d ${OBJECTDIR}/mcc_generated_files/device_config.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/mcc_generated_files/device_config.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/mcc_generated_files/mcc.p1: mcc_generated_files/mcc.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/mcc.p1.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/mcc.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -DLAN9250 -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/mcc_generated_files/mcc.p1 mcc_generated_files/mcc.c 
	@-${MV} ${OBJECTDIR}/mcc_generated_files/mcc.d ${OBJECTDIR}/mcc_generated_files/mcc.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/mcc_generated_files/mcc.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/mcc_generated_files/pin_manager.p1: mcc_generated_files/pin_manager.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/pin_manager.p1.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/pin_manager.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -DLAN9250 -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/mcc_generated_files/pin_manager.p1 mcc_generated_files/pin_manager.c 
	@-${MV} ${OBJECTDIR}/mcc_generated_files/pin_manager.d ${OBJECTDIR}/mcc_generated_files/pin_manager.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/mcc_generated_files/pin_manager.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/mcc_generated_files/spi1.p1: mcc_generated_files/spi1.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/spi1.p1.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/spi1.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -DLAN9250 -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/mcc_generated_files/spi1.p1 mcc_generated_files/spi1.c 
	@-${MV} ${OBJECTDIR}/mcc_generated_files/spi1.d ${OBJECTDIR}/mcc_generated_files/spi1.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/mcc_generated_files/spi1.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/arpv4.p1: mcc_generated_files/TCPIPLibrary/arpv4.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/TCPIPLibrary" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/arpv4.p1.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/arpv4.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -DLAN9250 -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/arpv4.p1 mcc_generated_files/TCPIPLibrary/arpv4.c 
	@-${MV} ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/arpv4.d ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/arpv4.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/arpv4.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/icmp.p1: mcc_generated_files/TCPIPLibrary/icmp.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/TCPIPLibrary" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/icmp.p1.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/icmp.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -DLAN9250 -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/icmp.p1 mcc_generated_files/TCPIPLibrary/icmp.c 
	@-${MV} ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/icmp.d ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/icmp.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/icmp.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/ipv4.p1: mcc_generated_files/TCPIPLibrary/ipv4.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/TCPIPLibrary" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/ipv4.p1.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/ipv4.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -DLAN9250 -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/ipv4.p1 mcc_generated_files/TCPIPLibrary/ipv4.c 
	@-${MV} ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/ipv4.d ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/ipv4.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/ipv4.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/ip_database.p1: mcc_generated_files/TCPIPLibrary/ip_database.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/TCPIPLibrary" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/ip_database.p1.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/ip_database.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -DLAN9250 -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/ip_database.p1 mcc_generated_files/TCPIPLibrary/ip_database.c 
	@-${MV} ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/ip_database.d ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/ip_database.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/ip_database.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/lfsr.p1: mcc_generated_files/TCPIPLibrary/lfsr.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/TCPIPLibrary" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/lfsr.p1.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/lfsr.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -DLAN9250 -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/lfsr.p1 mcc_generated_files/TCPIPLibrary/lfsr.c 
	@-${MV} ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/lfsr.d ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/lfsr.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/lfsr.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/log.p1: mcc_generated_files/TCPIPLibrary/log.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/TCPIPLibrary" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/log.p1.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/log.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -DLAN9250 -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/log.p1 mcc_generated_files/TCPIPLibrary/log.c 
	@-${MV} ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/log.d ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/log.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/log.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/log_console.p1: mcc_generated_files/TCPIPLibrary/log_console.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/TCPIPLibrary" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/log_console.p1.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/log_console.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -DLAN9250 -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/log_console.p1 mcc_generated_files/TCPIPLibrary/log_console.c 
	@-${MV} ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/log_console.d ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/log_console.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/log_console.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/mac_address.p1: mcc_generated_files/TCPIPLibrary/mac_address.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/TCPIPLibrary" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/mac_address.p1.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/mac_address.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -DLAN9250 -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/mac_address.p1 mcc_generated_files/TCPIPLibrary/mac_address.c 
	@-${MV} ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/mac_address.d ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/mac_address.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/mac_address.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/network.p1: mcc_generated_files/TCPIPLibrary/network.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/TCPIPLibrary" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/network.p1.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/network.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -DLAN9250 -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/network.p1 mcc_generated_files/TCPIPLibrary/network.c 
	@-${MV} ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/network.d ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/network.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/network.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/rtcc.p1: mcc_generated_files/TCPIPLibrary/rtcc.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/TCPIPLibrary" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/rtcc.p1.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/rtcc.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -DLAN9250 -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/rtcc.p1 mcc_generated_files/TCPIPLibrary/rtcc.c 
	@-${MV} ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/rtcc.d ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/rtcc.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/rtcc.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/tcpv4.p1: mcc_generated_files/TCPIPLibrary/tcpv4.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/TCPIPLibrary" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/tcpv4.p1.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/tcpv4.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -DLAN9250 -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/tcpv4.p1 mcc_generated_files/TCPIPLibrary/tcpv4.c 
	@-${MV} ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/tcpv4.d ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/tcpv4.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/tcpv4.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/mcc_generated_files/tmr1.p1: mcc_generated_files/tmr1.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tmr1.p1.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tmr1.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -DLAN9250 -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/mcc_generated_files/tmr1.p1 mcc_generated_files/tmr1.c 
	@-${MV} ${OBJECTDIR}/mcc_generated_files/tmr1.d ${OBJECTDIR}/mcc_generated_files/tmr1.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/mcc_generated_files/tmr1.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/spi_master.p1: spi_master.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/spi_master.p1.d 
	@${RM} ${OBJECTDIR}/spi_master.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -DLAN9250 -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/spi_master.p1 spi_master.c 
	@-${MV} ${OBJECTDIR}/spi_master.d ${OBJECTDIR}/spi_master.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/spi_master.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
else
${OBJECTDIR}/clc.p1: clc.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/clc.p1.d 
	@${RM} ${OBJECTDIR}/clc.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -DLAN9250 -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/clc.p1 clc.c 
	@-${MV} ${OBJECTDIR}/clc.d ${OBJECTDIR}/clc.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/clc.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/i2c_master.p1: i2c_master.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/i2c_master.p1.d 
	@${RM} ${OBJECTDIR}/i2c_master.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -DLAN9250 -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/i2c_master.p1 i2c_master.c 
	@-${MV} ${OBJECTDIR}/i2c_master.d ${OBJECTDIR}/i2c_master.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/i2c_master.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/lan9250.p1: lan9250.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/lan9250.p1.d 
	@${RM} ${OBJECTDIR}/lan9250.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -DLAN9250 -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/lan9250.p1 lan9250.c 
	@-${MV} ${OBJECTDIR}/lan9250.d ${OBJECTDIR}/lan9250.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/lan9250.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/main.p1: main.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.p1.d 
	@${RM} ${OBJECTDIR}/main.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -DLAN9250 -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/main.p1 main.c 
	@-${MV} ${OBJECTDIR}/main.d ${OBJECTDIR}/main.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/main.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/memory_buffer.p1: memory_buffer.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/memory_buffer.p1.d 
	@${RM} ${OBJECTDIR}/memory_buffer.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -DLAN9250 -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/memory_buffer.p1 memory_buffer.c 
	@-${MV} ${OBJECTDIR}/memory_buffer.d ${OBJECTDIR}/memory_buffer.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/memory_buffer.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/mcc_generated_files/device_config.p1: mcc_generated_files/device_config.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/device_config.p1.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/device_config.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -DLAN9250 -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/mcc_generated_files/device_config.p1 mcc_generated_files/device_config.c 
	@-${MV} ${OBJECTDIR}/mcc_generated_files/device_config.d ${OBJECTDIR}/mcc_generated_files/device_config.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/mcc_generated_files/device_config.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/mcc_generated_files/mcc.p1: mcc_generated_files/mcc.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/mcc.p1.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/mcc.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -DLAN9250 -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/mcc_generated_files/mcc.p1 mcc_generated_files/mcc.c 
	@-${MV} ${OBJECTDIR}/mcc_generated_files/mcc.d ${OBJECTDIR}/mcc_generated_files/mcc.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/mcc_generated_files/mcc.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/mcc_generated_files/pin_manager.p1: mcc_generated_files/pin_manager.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/pin_manager.p1.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/pin_manager.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -DLAN9250 -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/mcc_generated_files/pin_manager.p1 mcc_generated_files/pin_manager.c 
	@-${MV} ${OBJECTDIR}/mcc_generated_files/pin_manager.d ${OBJECTDIR}/mcc_generated_files/pin_manager.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/mcc_generated_files/pin_manager.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/mcc_generated_files/spi1.p1: mcc_generated_files/spi1.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/spi1.p1.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/spi1.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -DLAN9250 -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/mcc_generated_files/spi1.p1 mcc_generated_files/spi1.c 
	@-${MV} ${OBJECTDIR}/mcc_generated_files/spi1.d ${OBJECTDIR}/mcc_generated_files/spi1.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/mcc_generated_files/spi1.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/arpv4.p1: mcc_generated_files/TCPIPLibrary/arpv4.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/TCPIPLibrary" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/arpv4.p1.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/arpv4.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -DLAN9250 -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/arpv4.p1 mcc_generated_files/TCPIPLibrary/arpv4.c 
	@-${MV} ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/arpv4.d ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/arpv4.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/arpv4.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/icmp.p1: mcc_generated_files/TCPIPLibrary/icmp.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/TCPIPLibrary" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/icmp.p1.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/icmp.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -DLAN9250 -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/icmp.p1 mcc_generated_files/TCPIPLibrary/icmp.c 
	@-${MV} ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/icmp.d ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/icmp.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/icmp.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/ipv4.p1: mcc_generated_files/TCPIPLibrary/ipv4.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/TCPIPLibrary" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/ipv4.p1.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/ipv4.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -DLAN9250 -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/ipv4.p1 mcc_generated_files/TCPIPLibrary/ipv4.c 
	@-${MV} ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/ipv4.d ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/ipv4.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/ipv4.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/ip_database.p1: mcc_generated_files/TCPIPLibrary/ip_database.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/TCPIPLibrary" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/ip_database.p1.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/ip_database.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -DLAN9250 -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/ip_database.p1 mcc_generated_files/TCPIPLibrary/ip_database.c 
	@-${MV} ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/ip_database.d ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/ip_database.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/ip_database.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/lfsr.p1: mcc_generated_files/TCPIPLibrary/lfsr.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/TCPIPLibrary" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/lfsr.p1.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/lfsr.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -DLAN9250 -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/lfsr.p1 mcc_generated_files/TCPIPLibrary/lfsr.c 
	@-${MV} ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/lfsr.d ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/lfsr.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/lfsr.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/log.p1: mcc_generated_files/TCPIPLibrary/log.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/TCPIPLibrary" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/log.p1.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/log.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -DLAN9250 -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/log.p1 mcc_generated_files/TCPIPLibrary/log.c 
	@-${MV} ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/log.d ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/log.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/log.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/log_console.p1: mcc_generated_files/TCPIPLibrary/log_console.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/TCPIPLibrary" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/log_console.p1.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/log_console.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -DLAN9250 -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/log_console.p1 mcc_generated_files/TCPIPLibrary/log_console.c 
	@-${MV} ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/log_console.d ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/log_console.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/log_console.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/mac_address.p1: mcc_generated_files/TCPIPLibrary/mac_address.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/TCPIPLibrary" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/mac_address.p1.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/mac_address.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -DLAN9250 -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/mac_address.p1 mcc_generated_files/TCPIPLibrary/mac_address.c 
	@-${MV} ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/mac_address.d ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/mac_address.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/mac_address.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/network.p1: mcc_generated_files/TCPIPLibrary/network.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/TCPIPLibrary" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/network.p1.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/network.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -DLAN9250 -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/network.p1 mcc_generated_files/TCPIPLibrary/network.c 
	@-${MV} ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/network.d ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/network.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/network.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/rtcc.p1: mcc_generated_files/TCPIPLibrary/rtcc.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/TCPIPLibrary" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/rtcc.p1.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/rtcc.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -DLAN9250 -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/rtcc.p1 mcc_generated_files/TCPIPLibrary/rtcc.c 
	@-${MV} ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/rtcc.d ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/rtcc.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/rtcc.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/tcpv4.p1: mcc_generated_files/TCPIPLibrary/tcpv4.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/TCPIPLibrary" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/tcpv4.p1.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/tcpv4.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -DLAN9250 -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/tcpv4.p1 mcc_generated_files/TCPIPLibrary/tcpv4.c 
	@-${MV} ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/tcpv4.d ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/tcpv4.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/mcc_generated_files/TCPIPLibrary/tcpv4.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/mcc_generated_files/tmr1.p1: mcc_generated_files/tmr1.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tmr1.p1.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tmr1.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -DLAN9250 -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/mcc_generated_files/tmr1.p1 mcc_generated_files/tmr1.c 
	@-${MV} ${OBJECTDIR}/mcc_generated_files/tmr1.d ${OBJECTDIR}/mcc_generated_files/tmr1.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/mcc_generated_files/tmr1.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/spi_master.p1: spi_master.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/spi_master.p1.d 
	@${RM} ${OBJECTDIR}/spi_master.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -DLAN9250 -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/spi_master.p1 spi_master.c 
	@-${MV} ${OBJECTDIR}/spi_master.d ${OBJECTDIR}/spi_master.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/spi_master.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${DISTDIR}/Master.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -Wl,-Map=${DISTDIR}/Master.X.${IMAGE_TYPE}.map  -D__DEBUG=1  -mdebugger=none  -DXPRJ_default=$(CND_CONF)  -Wl,--defsym=__MPLAB_BUILD=1   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -DLAN9250 -xassembler-with-cpp -mwarn=-3 -Wa,-a -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto        $(COMPARISON_BUILD) -Wl,--memorysummary,${DISTDIR}/memoryfile.xml -o ${DISTDIR}/Master.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}     
	@${RM} ${DISTDIR}/Master.X.${IMAGE_TYPE}.hex 
	
else
${DISTDIR}/Master.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -Wl,-Map=${DISTDIR}/Master.X.${IMAGE_TYPE}.map  -DXPRJ_default=$(CND_CONF)  -Wl,--defsym=__MPLAB_BUILD=1   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -DLAN9250 -xassembler-with-cpp -mwarn=-3 -Wa,-a -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     $(COMPARISON_BUILD) -Wl,--memorysummary,${DISTDIR}/memoryfile.xml -o ${DISTDIR}/Master.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}     
	
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${OBJECTDIR}
	${RM} -r ${DISTDIR}

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif

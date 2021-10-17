# List of the ChibiOS generic STM32F4xx startup and CMSIS files.
STARTUPSRC = $(CHIBIOS)/os/common/ports/ARMCMx/compilers/GCC/system_gd32e50x.c \
             # $(CHIBIOS)/os/common/ports/ARMCMx/compilers/GCC/vectors.c
          
#STARTUPASM = $(CHIBIOS)/os/common/ports/ARMCMx/compilers/GCC/crt0_v7m.s
STARTUPASM = $(CHIBIOS)/os/common/ports/ARMCMx/compilers/GCC/startup_gd32e503_hd.s

STARTUPINC = $(CHIBIOS)/os/common/ports/ARMCMx/devices/GD32E5xx \
			 $(CHIBIOS)/os/ext/CMSIS/GD \
			 $(CHIBIOS)/os/ext/CMSIS/include \
             $(CHIBIOS)/os/ext/GD32E50x_standard_peripheral/Include \
			 
STARTUPLD  = $(CHIBIOS)/os/common/ports/ARMCMx/compilers/GCC/ld

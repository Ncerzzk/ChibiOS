/******************************************************************************
 * @file     startup_ARMCM33.S
 * @brief    CMSIS-Core Device Startup File for Cortex-M33 Device
 * @version  V2.3.0
 * @date     26. May 2021
 ******************************************************************************/
/*
 * Copyright (c) 2009-2021 Arm Limited. All rights reserved.
 *
 * SPDX-License-Identifier: Apache-2.0
 *
 * Licensed under the Apache License, Version 2.0 (the License)@ you may
 * not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an AS IS BASIS, WITHOUT
 * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

                .syntax  unified
                .arch    armv8-m.main

                #define __INITIAL_SP     __StackTop
                #define __STACK_LIMIT    __StackLimit
                #if defined (__ARM_FEATURE_CMSE) && (__ARM_FEATURE_CMSE == 3U)
                #define __STACK_SEAL     __StackSeal
                #endif

                .section .vectors
                .align   2
                .globl   __Vectors
                .globl   __Vectors_End
                .globl   __Vectors_Size
__Vectors:
                .long    __INITIAL_SP                       /*     Initial Stack Pointer */
                .long    Reset_Handler                      /*     Reset Handler */
                .long    NMI_Handler                        /* -14 NMI Handler */
                .long    HardFault_Handler                  /* -13 Hard Fault Handler */
                .long    MemManage_Handler                  /* -12 MPU Fault Handler */
                .long    BusFault_Handler                   /* -11 Bus Fault Handler */
                .long    UsageFault_Handler                 /* -10 Usage Fault Handler */
                .long    SecureFault_Handler                /*  -9 Secure Fault Handler */
                .long    0                                  /*     Reserved */
                .long    0                                  /*     Reserved */
                .long    0                                  /*     Reserved */
                .long    SVC_Handler                        /*  -5 SVCall Handler */
                .long    DebugMon_Handler                   /*  -4 Debug Monitor Handler */
                .long    0                                  /*     Reserved */
                .long    PendSV_Handler                     /*  -2 PendSV Handler */
                .long    SysTick_Handler                    /*  -1 SysTick Handler */

            .long     WWDGT_IRQHandler                    @ 16:Window Watchdog Timer
            .long     LVD_IRQHandler                      @ 17:LVD through EXTI Line detect
            .long     TAMPER_IRQHandler                   @ 18:Tamper through EXTI Line detect
            .long     RTC_IRQHandler                      @ 19:RTC through EXTI Line
            .long     FMC_IRQHandler                      @ 20:FMC
            .long     RCU_CTC_IRQHandler                  @ 21:RCU and CTC
            .long     EXTI0_IRQHandler                    @ 22:EXTI Line 0
            .long     EXTI1_IRQHandler                    @ 23:EXTI Line 1
            .long     EXTI2_IRQHandler                    @ 24:EXTI Line 2
            .long     EXTI3_IRQHandler                    @ 25:EXTI Line 3
            .long     EXTI4_IRQHandler                    @ 26:EXTI Line 4
            .long     DMA0_Channel0_IRQHandler            @ 27:DMA0 Channel0
            .long     DMA0_Channel1_IRQHandler            @ 28:DMA0 Channel1
            .long     DMA0_Channel2_IRQHandler            @ 29:DMA0 Channel2
            .long     DMA0_Channel3_IRQHandler            @ 30:DMA0 Channel3
            .long     DMA0_Channel4_IRQHandler            @ 31:DMA0 Channel4
            .long     DMA0_Channel5_IRQHandler            @ 32:DMA0 Channel5
            .long     DMA0_Channel6_IRQHandler            @ 33:DMA0 Channel6
            .long     ADC0_1_IRQHandler                   @ 34:ADC0 and ADC1
            .long     USBD_HP_CAN0_TX_IRQHandler          @ 35:USBD HP and CAN0 TX
            .long     USBD_LP_CAN0_RX0_IRQHandler         @ 36:USBD LP and CAN0 RX0
            .long     CAN0_RX1_IRQHandler                 @ 37:CAN0 RX1
            .long     CAN0_EWMC_IRQHandler                @ 38:CAN0 EWMC
            .long     EXTI5_9_IRQHandler                  @ 39:EXTI5 to EXTI9
            .long     TIMER0_BRK_IRQHandler               @ 40:TIMER0 Break
            .long     TIMER0_UP_IRQHandler                @ 41:TIMER0 Update
            .long     TIMER0_TRG_CMT_IRQHandler           @ 42:TIMER0 Trigger and Commutation
            .long     TIMER0_Channel_IRQHandler           @ 43:TIMER0 Channel Capture Compare
            .long     TIMER1_IRQHandler                   @ 44:TIMER1
            .long     TIMER2_IRQHandler                   @ 45:TIMER2
            .long     TIMER3_IRQHandler                   @ 46:TIMER3
            .long     I2C0_EV_IRQHandler                  @ 47:I2C0 Event
            .long     I2C0_ER_IRQHandler                  @ 48:I2C0 Error
            .long     I2C1_EV_IRQHandler                  @ 49:I2C1 Event
            .long     I2C1_ER_IRQHandler                  @ 50:I2C1 Error
            .long     SPI0_IRQHandler                     @ 51:SPI0
            .long     SPI1_I2S1ADD_IRQHandler             @ 52:SPI1 or I2S1ADD
            .long     USART0_IRQHandler                   @ 53:USART0
            .long     USART1_IRQHandler                   @ 54:USART1
            .long     USART2_IRQHandler                   @ 55:USART2
            .long     EXTI10_15_IRQHandler                @ 56:EXTI10 to EXTI15
            .long     RTC_Alarm_IRQHandler                @ 57:RTC Alarm
            .long     USBD_WKUP_IRQHandler                @ 58:USBD Wakeup
            .long     TIMER7_BRK_IRQHandler               @ 59:TIMER7 Break
            .long     TIMER7_UP_IRQHandler                @ 60:TIMER7 Update
            .long     TIMER7_TRG_CMT_IRQHandler           @ 61:TIMER7 Trigger and Commutation
            .long     TIMER7_Channel_IRQHandler           @ 62:TIMER7 Channel Capture Compare
            .long     ADC2_IRQHandler                     @ 63:ADC2
            .long     EXMC_IRQHandler                     @ 64:EXMC
            .long     SDIO_IRQHandler                     @ 65:SDIO
            .long     TIMER4_IRQHandler                   @ 66:TIMER4
            .long     SPI2_I2S2ADD_IRQHandler             @ 67:SPI2 or I2S2ADD
            .long     UART3_IRQHandler                    @ 68:UART3
            .long     UART4_IRQHandler                    @ 69:UART4
            .long     TIMER5_DAC_IRQHandler               @ 70:TIMER5 or DAC
            .long     TIMER6_IRQHandler                   @ 71:TIMER6
            .long     DMA1_Channel0_IRQHandler            @ 72:DMA1 Channel0
            .long     DMA1_Channel1_IRQHandler            @ 73:DMA1 Channel1
            .long     DMA1_Channel2_IRQHandler            @ 74:DMA1 Channel2
            .long     DMA1_Channel3_4_IRQHandler          @ 75:DMA1 Channel3 and Channel4
            .long     0                                   @ Reserved
            .long     0                                   @ Reserved
            .long     0                                   @ Reserved
            .long     CAN1_TX_IRQHandler                  @ 79:CAN1 TX
            .long     CAN1_RX0_IRQHandler                 @ 80:CAN1 RX0
            .long     CAN1_RX1_IRQHandler                 @ 81:CAN1 RX1
            .long     CAN1_EWMC_IRQHandler                @ 82:CAN1 EWMC
            .long     0                                   @ Reserved
            .long     0                                   @ Reserved
            .long     SHRTIMER_IRQ2_IRQHandler             @ 85:SHRTIMER IRQ2
            .long     SHRTIMER_IRQ3_IRQHandler             @ 86:SHRTIMER IRQ3
            .long     SHRTIMER_IRQ4_IRQHandler             @ 87:SHRTIMER IRQ4
            .long     SHRTIMER_IRQ5_IRQHandler             @ 88:SHRTIMER IRQ5
            .long     SHRTIMER_IRQ6_IRQHandler             @ 89:SHRTIMER IRQ6
            .long     0                                   @ Reserved
            .long     0                                   @ Reserved
            .long     SHRTIMER_IRQ0_IRQHandler             @ 92:SHRTIMER IRQ0
            .long     SHRTIMER_IRQ1_IRQHandler             @ 93:SHRTIMER IRQ1
            .long     0                                   @ Reserved
            .long     0                                   @ Reserved
            .long     0                                   @ Reserved
            .long     0                                   @ Reserved
            .long     I2C2_EV_IRQHandler                  @ 98:I2C2 Event
            .long     I2C2_ER_IRQHandler                  @ 99:I2C2 Error
            .long     USART5_IRQHandler                   @ 100:USART5
            .long     I2C2_WKUP_IRQHandler                @ 101:I2C2 Wakeup
            .long     USART5_WKUP_IRQHandler              @ 102:USART5 Wakeup
            .long     0                                   @ Reserved/

__Vectors_End:
                .equ     __Vectors_Size, __Vectors_End - __Vectors
                .size    __Vectors, . - __Vectors


                .thumb
                .section .text
                .align   2

                .thumb_func
                .type    Reset_Handler, %function
                .globl   Reset_Handler
                .fnstart
Reset_Handler:
                ldr      r0, =__INITIAL_SP
                msr      psp, r0

                ldr      r0, =__STACK_LIMIT
                msr      msplim, r0
                msr      psplim, r0

                #if defined (__ARM_FEATURE_CMSE) && (__ARM_FEATURE_CMSE == 3U)
                ldr      r0, =__STACK_SEAL
                ldr      r1, =0xFEF5EDA5U
                strd     r1,r1,[r0,#0]
                #endif

                bl       SystemInit

                ldr      r4, =__copy_table_start__
                ldr      r5, =__copy_table_end__

.L_loop0:
                cmp      r4, r5
                bge      .L_loop0_done
                ldr      r1, [r4]                /* source address */
                ldr      r2, [r4, #4]            /* destination address */
                ldr      r3, [r4, #8]            /* word count */
                lsls     r3, r3, #2              /* byte count */

.L_loop0_0:
                subs     r3, #4                  /* decrement byte count */
                ittt     ge
                ldrge    r0, [r1, r3]
                strge    r0, [r2, r3]
                bge      .L_loop0_0

                adds     r4, #12
                b        .L_loop0
.L_loop0_done:

                ldr      r3, =__zero_table_start__
                ldr      r4, =__zero_table_end__

.L_loop2:
                cmp      r3, r4
                bge      .L_loop2_done
                ldr      r1, [r3]                /* destination address */
                ldr      r2, [r3, #4]            /* word count */
                lsls     r2, r2, #2              /* byte count */
                movs     r0, 0

.L_loop2_0:
                subs     r2, #4                  /* decrement byte count */
                itt      ge
                strge    r0, [r1, r2]
                bge      .L_loop2_0

                adds     r3, #8
                b        .L_loop2
.L_loop2_done:

                bl       main

                .fnend
                .size    Reset_Handler, . - Reset_Handler


/* The default macro is not used for HardFault_Handler
 * because this results in a poor debug illusion.
 */
                .thumb_func
                .type    HardFault_Handler, %function
                .weak    HardFault_Handler
                .fnstart
HardFault_Handler:
                b        .
                .fnend
                .size    HardFault_Handler, . - HardFault_Handler

                .thumb_func
                .type    Default_Handler, %function
                .weak    Default_Handler
                .fnstart
Default_Handler:
                b        .
                .fnend
                .size    Default_Handler, . - Default_Handler

/* Macro to define default exception/interrupt handlers.
 * Default handler are weak symbols with an endless loop.
 * They can be overwritten by real handlers.
 */
                .macro   Set_Default_Handler  Handler_Name
                .weak    \Handler_Name
                .set     \Handler_Name, Default_Handler
                .endm


/* Default exception/interrupt handler */

                Set_Default_Handler  NMI_Handler
                Set_Default_Handler  MemManage_Handler
                Set_Default_Handler  BusFault_Handler
                Set_Default_Handler  UsageFault_Handler
                Set_Default_Handler  SecureFault_Handler
                Set_Default_Handler  SVC_Handler
                Set_Default_Handler  DebugMon_Handler
                Set_Default_Handler  PendSV_Handler
                Set_Default_Handler  SysTick_Handler

                Set_Default_Handler     WWDGT_IRQHandler                    @ 16:Window Watchdog Timer
                Set_Default_Handler     LVD_IRQHandler                      @ 17:LVD through EXTI Line detect
                Set_Default_Handler     TAMPER_IRQHandler                   @ 18:Tamper through EXTI Line detect
                Set_Default_Handler     RTC_IRQHandler                      @ 19:RTC through EXTI Line
                Set_Default_Handler     FMC_IRQHandler                      @ 20:FMC
                Set_Default_Handler     RCU_CTC_IRQHandler                  @ 21:RCU and CTC
                Set_Default_Handler     EXTI0_IRQHandler                    @ 22:EXTI Line 0
                Set_Default_Handler     EXTI1_IRQHandler                    @ 23:EXTI Line 1
                Set_Default_Handler     EXTI2_IRQHandler                    @ 24:EXTI Line 2
                Set_Default_Handler     EXTI3_IRQHandler                    @ 25:EXTI Line 3
                Set_Default_Handler     EXTI4_IRQHandler                    @ 26:EXTI Line 4
                Set_Default_Handler     DMA0_Channel0_IRQHandler            @ 27:DMA0 Channel0
                Set_Default_Handler     DMA0_Channel1_IRQHandler            @ 28:DMA0 Channel1
                Set_Default_Handler     DMA0_Channel2_IRQHandler            @ 29:DMA0 Channel2
                Set_Default_Handler     DMA0_Channel3_IRQHandler            @ 30:DMA0 Channel3
                Set_Default_Handler     DMA0_Channel4_IRQHandler            @ 31:DMA0 Channel4
                Set_Default_Handler     DMA0_Channel5_IRQHandler            @ 32:DMA0 Channel5
                Set_Default_Handler     DMA0_Channel6_IRQHandler            @ 33:DMA0 Channel6
                Set_Default_Handler     ADC0_1_IRQHandler                   @ 34:ADC0 and ADC1
                Set_Default_Handler     USBD_HP_CAN0_TX_IRQHandler          @ 35:USBD HP and CAN0 TX
                Set_Default_Handler     USBD_LP_CAN0_RX0_IRQHandler         @ 36:USBD LP and CAN0 RX0
                Set_Default_Handler     CAN0_RX1_IRQHandler                 @ 37:CAN0 RX1
                Set_Default_Handler     CAN0_EWMC_IRQHandler                @ 38:CAN0 EWMC
                Set_Default_Handler     EXTI5_9_IRQHandler                  @ 39:EXTI5 to EXTI9
                Set_Default_Handler     TIMER0_BRK_IRQHandler               @ 40:TIMER0 Break
                Set_Default_Handler     TIMER0_UP_IRQHandler                @ 41:TIMER0 Update
                Set_Default_Handler     TIMER0_TRG_CMT_IRQHandler           @ 42:TIMER0 Trigger and Commutation
                Set_Default_Handler     TIMER0_Channel_IRQHandler           @ 43:TIMER0 Channel Capture Compare
                Set_Default_Handler     TIMER1_IRQHandler                   @ 44:TIMER1
                Set_Default_Handler     TIMER2_IRQHandler                   @ 45:TIMER2
                Set_Default_Handler     TIMER3_IRQHandler                   @ 46:TIMER3
                Set_Default_Handler     I2C0_EV_IRQHandler                  @ 47:I2C0 Event
                Set_Default_Handler     I2C0_ER_IRQHandler                  @ 48:I2C0 Error
                Set_Default_Handler     I2C1_EV_IRQHandler                  @ 49:I2C1 Event
                Set_Default_Handler     I2C1_ER_IRQHandler                  @ 50:I2C1 Error
                Set_Default_Handler     SPI0_IRQHandler                     @ 51:SPI0
                Set_Default_Handler     SPI1_I2S1ADD_IRQHandler             @ 52:SPI1 or I2S1ADD
                Set_Default_Handler     USART0_IRQHandler                   @ 53:USART0
                Set_Default_Handler     USART1_IRQHandler                   @ 54:USART1
                Set_Default_Handler     USART2_IRQHandler                   @ 55:USART2
                Set_Default_Handler     EXTI10_15_IRQHandler                @ 56:EXTI10 to EXTI15
                Set_Default_Handler     RTC_Alarm_IRQHandler                @ 57:RTC Alarm
                Set_Default_Handler     USBD_WKUP_IRQHandler                @ 58:USBD Wakeup
                Set_Default_Handler     TIMER7_BRK_IRQHandler               @ 59:TIMER7 Break
                Set_Default_Handler     TIMER7_UP_IRQHandler                @ 60:TIMER7 Update
                Set_Default_Handler     TIMER7_TRG_CMT_IRQHandler           @ 61:TIMER7 Trigger and Commutation
                Set_Default_Handler     TIMER7_Channel_IRQHandler           @ 62:TIMER7 Channel Capture Compare
                Set_Default_Handler     ADC2_IRQHandler                     @ 63:ADC2
                Set_Default_Handler     EXMC_IRQHandler                     @ 64:EXMC
                Set_Default_Handler     SDIO_IRQHandler                     @ 65:SDIO
                Set_Default_Handler     TIMER4_IRQHandler                   @ 66:TIMER4
                Set_Default_Handler     SPI2_I2S2ADD_IRQHandler             @ 67:SPI2 or I2S2ADD
                Set_Default_Handler     UART3_IRQHandler                    @ 68:UART3
                Set_Default_Handler     UART4_IRQHandler                    @ 69:UART4
                Set_Default_Handler     TIMER5_DAC_IRQHandler               @ 70:TIMER5 or DAC
                Set_Default_Handler     TIMER6_IRQHandler                   @ 71:TIMER6
                Set_Default_Handler     DMA1_Channel0_IRQHandler            @ 72:DMA1 Channel0
                Set_Default_Handler     DMA1_Channel1_IRQHandler            @ 73:DMA1 Channel1
                Set_Default_Handler     DMA1_Channel2_IRQHandler            @ 74:DMA1 Channel2
                Set_Default_Handler     DMA1_Channel3_4_IRQHandler          @ 75:DMA1 Channel3 and Channel4
                Set_Default_Handler     CAN1_TX_IRQHandler                  @ 79:CAN1 TX
                Set_Default_Handler     CAN1_RX0_IRQHandler                 @ 80:CAN1 RX0
                Set_Default_Handler     CAN1_RX1_IRQHandler                 @ 81:CAN1 RX1
                Set_Default_Handler     CAN1_EWMC_IRQHandler                @ 82:CAN1 EWMC
                Set_Default_Handler     SHRTIMER_IRQ2_IRQHandler             @ 85:SHRTIMER IRQ2
                Set_Default_Handler     SHRTIMER_IRQ3_IRQHandler             @ 86:SHRTIMER IRQ3
                Set_Default_Handler     SHRTIMER_IRQ4_IRQHandler             @ 87:SHRTIMER IRQ4
                Set_Default_Handler     SHRTIMER_IRQ5_IRQHandler             @ 88:SHRTIMER IRQ5
                Set_Default_Handler     SHRTIMER_IRQ6_IRQHandler             @ 89:SHRTIMER IRQ6
                Set_Default_Handler     SHRTIMER_IRQ0_IRQHandler             @ 92:SHRTIMER IRQ0
                Set_Default_Handler     SHRTIMER_IRQ1_IRQHandler             @ 93:SHRTIMER IRQ1
                Set_Default_Handler     I2C2_EV_IRQHandler                  @ 98:I2C2 Event
                Set_Default_Handler     I2C2_ER_IRQHandler                  @ 99:I2C2 Error
                Set_Default_Handler     USART5_IRQHandler                   @ 100:USART5
                Set_Default_Handler     I2C2_WKUP_IRQHandler                @ 101:I2C2 Wakeup
                Set_Default_Handler     USART5_WKUP_IRQHandler              @ 102:USART5 Wakeup

                .end
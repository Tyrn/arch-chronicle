# Mastering STM32
### *by Carmine Noviello*

### Notes

#### Cortex subfamilies

- Cortex-A: **A**pplication - Linux, Android.

- Cortex-M: e**M**bedded.

- Cortex-R: **R**eal-Time - high performance, fault tolerance.

#### Bitband

```
// Define base address of bit-band
#define BITBAND_SRAM_BASE 0x20000000
// Define base address of alias band
#define ALIAS_SRAM_BASE 0x22000000
// Convert SRAM address to alias region
#define BITBAND_SRAM(a,b) ((ALIAS_SRAM_BASE + ((uint32_t)&(a)-BITBAND_SRAM_BASE)*32 + (b*4\
)))
// Define base address of peripheral bit-band
#define BITBAND_PERI_BASE 0x40000000
// Define base address of peripheral alias band
#define ALIAS_PERI_BASE 0x42000000
// Convert PERI address to alias region
#define BITBAND_PERI(a,b) ((ALIAS_PERI_BASE + ((uint32_t)a-BITBAND_PERI_BASE)*32 + (b*4)))

```
```
 #define GPIOA_PERH_ADDR 0x40020000
 #define ODR_ADDR_OFF
 0x14
 uint32_t *GPIOA_ODR = GPIOA_PERH_ADDR + ODR_ADDR_OFF;
 uint32_t *GPIOA_PIN5 = BITBAND_PERI(GPIOA_ODR, 5);
 *GPIOA_PIN5 = 0x1; // Turns GPIO HIGH

```

#### Exceptions and Interrupts

```
Number      Exception type     Priority      Function


1           Reset              -3            Reset
2           NMI                -2            Non-Maskable Interrupt
3           Hard Fault         -1            All classes of Fault, when the fault cannot activate
                                             because of priority or the Configurable Fault handler
                                             has been disabled.
4           Memory Management  Configurable  MPU mismatch, including access violation and no
                                             match. This is used even if the MPU is disabled
                                             or not present.
5           Bus Fault          Configurable  Pre-fetch fault, memory access fault, and other
                                             address/memory related faults.
6           Usage Fault        Configurable  Usage fault, such as Undefined instruction executed
                                             or illegal state transition attempt.
7-10        -                  -             RESERVED
11          SVCall             Configurable  System service call with SVC instruction.
12          Debug Monitor      Configurable  Debug monitor for software based debug.
13          -                  -             RESERVED
14          PendSV             Configurable  Pending request for system service.
15          SysTick            Configurable  System tick timer has fired.
16-[47/240] IRQ                Configurable  IRQ input
```

#### STM32CubeMX

##### Chip view, pin colors

- *Green*: pin enabled (code to be generated).

- *Yellow*: pin is not configurable (power).

- *Orange*: the corresponding peripheral is not enabled (code for the pin, but not for the peripheral).

- *Khaki*: BOOT and RESET; not configurable.

- *Blue*: Possible alternatives, shown by Ctrl-click.

##### Generated Application Code

- `Inc/stm32f1xx_hal_conf.h`

- `Src/stm32f1xx_it.c` Generated ISRs; there is place for the user code.

- `startup/startup_stm32f103xb.s` 
```
...
g_pfnVectors:

  .word _estack
  .word Reset_Handler
  .word NMI_Handler
  .word HardFault_Handler
...
  .word SysTick_Handler
...
```
- `Src/stm32f1xx_hal_msp.c` Setting ISRs; user code. IP settings according to user configuration.
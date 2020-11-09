CC=arm-none-eabi-gcc
MACH=cortex-m4
CFLAGS= -c -mcpu=$(MACH) -mthumb -mfloat-abi=soft -std=gnu11 -O0 -Wall -Werror
# LDFLAGS= -nostdlib -T stm32f4_ls.ld -Wl,-Map=final.map
SPECS_FILE= nano.specs
# SPECS_FILE= rdimon.specs
LDFLAGS= -mcpu=$(MACH) -mthumb -mfloat-abi=soft --specs=$(SPECS_FILE) -T stm32f4_ls.ld -Wl,-Map=final.map
OUTPUT= final.elf

all:clean $(OUTPUT) size_info launch_openocd

main.o:main.c
	$(CC) $(CFLAGS) -o $@ $^
led.o:led.c
	$(CC) $(CFLAGS) -o $@ $^
stm32f4_startup.o:stm32f4_startup.c
	$(CC) $(CFLAGS) -o $@ $^
syscalls.o:syscalls.c
	$(CC) $(CFLAGS) -o $@ $^

$(OUTPUT): stm32f4_startup.o led.o main.o syscalls.o
	$(CC) $(LDFLAGS) -o $@ $^

clean:
	rm -rf *.o *.s *.i *.log *.elf

size_info:
	arm-none-eabi-size $(OUTPUT)

launch_openocd:
	openocd -f stm32f4discovery.cfg

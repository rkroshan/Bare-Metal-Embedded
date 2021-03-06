### BARE METAL EMBEDDED BOARD TESTING

#### - simple rtos program to run 4 leds on board at specific delays each task having equal priority with printf(semihosting) functionality

#### - USAGE : To test stm32f4Discovery board (can test other boards as well)

#### - Running program on board

#### I) Connecting with openocd and gdb server on Ubuntu/Linux

- clone the repository
- install arm gcc toolchain and openocd : " ***sudo apt-get install gcc-arm-none-eabi binutils-arm-none-eabi gdb-arm-none-eabi openocd*** "
- confirm arm toolchain and openocd installation from follwoing command: "***arm-none-eabi-gcc --version && openocd --version***"  
- connect your board (stm32f4 discovery board) : confirm the board detection from command : "**lsusb**" (this will show stlink)
- run the command : "**make**" (it will create the final.elf file and connect board with openocd)
- open new terminal (leave that terminal as it is) from the same directory and run command : "**arm-none-eabi-gdb**" (this will open gdb console)
- *(inside gdb console)* 
- run the following command to connect with board via openocd : "***target remote localhost:3333***"
- run the command to reset and reintialize the board : "***monitor reset init***"
- run the command to flash the final.elf file on to the board : "***monitor flash write_image erase final.elf***" 
- run the command to enable arm semihosting and see the printf statements on openocd console: "***monitor arm semihosting enable***" 
- run the command to reset the board to get the board in debiggung mode : "***monitor reset***"
- run the command to stop debugging and resume the program : "***monitor resume***"
- run the command to halt the program and enter into debugging mode : "***monitor halt***"
- run the command to shutdown the connection of board with openocd: "***monitor shutdown***"  

#### II) Connecting with openocd and telnet server on Ubuntu/Linux

- clone the repository
- install arm gcc toolchain, openocd and telnet: "***sudo apt-get install gcc-arm-none-eabi binutils-arm-none-eabi gdb-arm-none-eabi openocd telnet***" 
- confirm arm toolchain and openocd installation from follwoing command: "***arm-none-eabi-gcc --version && openocd --version***"  
- connect your board (stm32f4 discovery board) : confirm the board detection from command : "**lsusb**" (this will show stlink)
- run the command : "**make**" (it will create the final.elf file and connect board with openocd)
- open new terminal (leave that terminal as it is) from the same directory and run command : "***telnet localhost 4444***" (this will open telnet console connected with openocd)
- *(inside telnet console)*
- run the command to reset and reintialize the board : "***reset init***"
- run the command to flash the final.elf file on to the board : "***flash write_image erase final.elf***" 
- run the command to enable arm semihosting and see the printf statements on openocd console: "***arm semihosting enable***"                                
- run the command to reset the board to get the board in debiggung mode : "***reset***"
- run the command to stop debugging and resume the program : "***resume***"
- run the command to halt the program and enter into debugging mode : "***halt***"
- run the command to shutdown the connection of board with openocd: "***shutdown***"

*For more information go through the Makefile and programs to understand them better.*

*Other than stm32f4discovery boards can be tested just replace the stm32f4discovery.cfg file path with you board.cfg file which supports openocd*

*to find other boards cfg file On Ubuntu go to /usr/share/openocd/boards/*

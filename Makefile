##
##  Makefile for sp
##

CFLAGS = -W -Wall -std=c99 -O2 -s
#CFLAGS = -W -Wall -std=c99 -g

CC_LINUX32        = gcc
CC_LINUX64        = gcc
CC_WINDOWS32      = /usr/bin/i686-w64-mingw32-gcc
CC_WINDOWS64      = /usr/bin/x86_64-w64-mingw32-gcc
CC_OSX32          = /usr/bin/i686-apple-darwin10-gcc
CC_OSX64          = /usr/bin/i686-apple-darwin10-gcc

CFLAGS_LINUX32    = $(CFLAGS) -m32 -DLINUX
CFLAGS_LINUX64    = $(CFLAGS) -m64 -DLINUX
CFLAGS_WINDOWS32  = $(CFLAGS) -m32 -DWINDOWS
CFLAGS_WINDOWS64  = $(CFLAGS) -m64 -DWINDOWS
CFLAGS_OSX32      = $(CFLAGS) -m32 -DOSX
CFLAGS_OSX64      = $(CFLAGS) -m64 -DOSX

dbf: all

all: linux win mac

linux: linux_64.bin linux_32.bin
win: win_64.exe win_32.exe
mac: mac_64.app mac_32.app

clean:
	rm -f -R ./bin

linux_32.bin: ./src/sp.c
	mkdir -p ./bin
	-$(CC_LINUX32)   $(CFLAGS_LINUX32)   -o ./bin/cpu_$@ $^

linux_64.bin: ./src/sp.c
	mkdir -p ./bin
	-$(CC_LINUX64)   $(CFLAGS_LINUX64)   -o ./bin/cpu_$@ $^

win_32.exe: ./src/sp.c
	mkdir -p ./bin
	-$(CC_WINDOWS32) $(CFLAGS_WINDOWS32) -o ./bin/cpu_$@ $^

win_64.exe: ./src/sp.c
	mkdir -p ./bin
	-$(CC_WINDOWS64) $(CFLAGS_WINDOWS64) -o ./bin/cpu_$@ $^

mac_32.app: ./src/sp.c
	mkdir -p ./bin
	-$(CC_OSX32)     $(CFLAGS_OSX32)     -o ./bin/cpu_$@ $^

mac_64.app: ./src/sp.c
	mkdir -p ./bin
	-$(CC_OSX64)     $(CFLAGS_OSX64)     -o ./bin/cpu_$@ $^

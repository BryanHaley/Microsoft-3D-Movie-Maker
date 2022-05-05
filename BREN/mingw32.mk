#
# Makefile to build for Win32 from UNIX hosts
#

# Commands

CC  := x86_64-w64-mingw32-gcc
CXX := x86_64-w64-mingw32-g++

MKDIR := mkdir -p
RMDIR := rm -rf

# Directories

BUILD_DIR := BUILD
INC_DIR   := INC
KAUAI_DIR := ../kauai

# Options

CFLAGS   := -g -Wall -I$(INC_DIR) -I$(KAUAI_DIR)/SRC
CXXFLAGS := $(CFLAGS)

# Objects

OBJS := BRENFUN.o BWLD.o MATERIAL.o STDERR.o STDFILE.o STDMEM.o TMAP.o ZMBP.o

# Rules

all: $(OBJS)

$(OBJS): %.o : %.CPP
	$(CXX) $(CXXFLAGS) -c $< -o $(BUILD_DIR)/$@

mkdirs:
	$(MKDIR) $(BUILD_DIR)

clean:
	-$(RMDIR) $(BUILD_DIR)

.PHONY: all mkdirs
#***************************************************************************
#
# Project    _|_|_|_|  _|_|    _|    _|    _|_|_|
#              _|    _|    _|  _|    _|  _|    _|
#              _|    _|    _|  _|    _|  _|    _|  _|
#              _|    _|    _|    _|_|_|    _|_|_|_|
#                                    _|
#                                _|_|
#
#
# Copyright (C) 2020 - 2021, Joshua Mak, <jmakhack@protonmail.com>, et al.
#
############################################################################

.DEFAULT_GOAL := all
CC=gcc
CFLAGS=-c -g -Wall
DIRGUARD=@mkdir -p $(@D)
ODIR=obj
SDIR=src
EDIR=bin
EXEC=mya
LIBS=-lcurl -ljson-c -largp

TARGET=$(EDIR)/$(EXEC)

_OBJ=$(EXEC).o
OBJ=$(patsubst %,$(ODIR)/%,$(_OBJ))

$(TARGET): $(OBJ)
	$(DIRGUARD)
	$(CC) -o $@ $^ $(LIBS)

$(ODIR)/%.o: $(SDIR)/%.c
	$(DIRGUARD)
	$(CC) $(CFLAGS) $< -o $@

.PHONY: all clean

all: $(TARGET)

clean:
	rm -rf $(ODIR) $(EDIR) *~


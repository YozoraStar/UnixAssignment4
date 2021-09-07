#!/usr/bin/make -f
#
# Filename    Makefile
# Date        3/20/20
# Author      Jerry Huynh
# Email       jsh170830@utdallas.edu
# Course      CS 3377.501 Spring 2020
# Version     1.0 (or correct version)
# Copyright   2020, All Rights Reserved
#
# Description:
#
#	Builds a quick Lex Example Program.  Since Lex natively generates
#	C files, we will use the C compiler instead of the C++ compiler

#
# Flags for the C++ implicit rules
CC = gcc
CCFLAGS = -Wall
CPPFLAGS = 

# Flags for the Lex implicit rules
#
# Implicit Makefile rule to use Lex for C programs
#
#   n.c is made automatically from n.l by running Lex. The actual recipe is
#	$(LEX) $(LFLAGS)
LEX = /bin/flex
LFLAGS = 

#
# PROJECTNAME is a descriptive name used for the backup target
# This should not contain spaces or special characters
PROJECTNAME = CS3377.Assignment.4

EXECFILE = program4

OBJS = scan.o program4.o

# Because we are insane, keep the intermediate files so we can look at
# them If we comment this out (or remove it), the intermediate scan.c
# file is automatically deleted.
.PRECIOUS: scan.c

all: $(EXECFILE)

clean:
	rm -f $(OBJS) $(EXECFILE) *~ \#* scanner scan.c

$(EXECFILE):	$(OBJS)
	$(CC) -o $@ $(OBJS)
	ln -fs ./$@ scanner

backup:
	@make clean
	@mkdir -p ~/backups; chmod 700 ~/backups
	@$(eval CURDIRNAME := $(shell basename "`pwd`"))
	@$(eval MKBKUPNAME := ~/backups/$(PROJECTNAME)-$(shell date +'%Y.%m.%d-%H:%M:%S').tar.gz)
	@echo
	@echo Writing Backup file to: $(MKBKUPNAME)
	@echo
	@-tar zcfv $(MKBKUPNAME) ../$(CURDIRNAME) 2> /dev/null
	@chmod 600 $(MKBKUPNAME)
	@echo
	@echo Done!

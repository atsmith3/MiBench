# Copyright (c) 2005-2006 The Regents of The University of Michigan
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are
# met: redistributions of source code must retain the above copyright
# notice, this list of conditions and the following disclaimer;
# redistributions in binary form must reproduce the above copyright
# notice, this list of conditions and the following disclaimer in the
# documentation and/or other materials provided with the distribution;
# neither the name of the copyright holders nor the names of its
# contributors may be used to endorse or promote products derived from
# this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
# "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
# LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
# A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
# OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
# SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
# LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
# DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
# THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
# OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

CC=gcc
AS=as
LD=ld

CFLAGS=-O3
LFLAGS=-lm
OBJS_LARGE = basicmath_small.o   rad2deg.o  cubic.o   isqrt.o
OBJS_SMALL = basicmath_large.o   rad2deg.o  cubic.o   isqrt.o

GEM5 ?= 0
ifeq ($(GEM5),1)
	OBJS_LARGE+= m5op_x86.o
	OBJS_SMALL+= m5op_x86.o
	CFLAGS+=-I${GEM5_ROOT}/include -I../../ -DGEM5
endif

all: basicmath_small basicmath_large

%.o: %.S
	$(CC) $(CFLAGS) -o $@ -c $<

%.o: %.c
	$(CC) $(CFLAGS) -o $@ -c $<

basicmath_large: $(OBJS_LARGE)
	$(CC) -static -o $@ $(OBJS_LARGE) $(LFLAGS)

basicmath_small: $(OBJS_SMALL)
	$(CC) -static -o $@ $(OBJS_SMALL) $(LFLAGS)

clean:
	rm -f *.o basicmath_small basicmath_large

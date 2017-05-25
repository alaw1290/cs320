#
# A simple Makefile
#

######


export PATSHOMELOCS=./node_modules:./../../node_modules
PATSCC=patscc -O2 -D_GNU_SOURCE -DATS_MEMALLOC_LIBC


all: *.dats *.sats 
	$(PATSCC) fft.dats 


npm-install: 
	npm i effectivats-divideconquer




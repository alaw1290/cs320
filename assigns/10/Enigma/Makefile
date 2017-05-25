######
#
# A Simple Makefile
#
######
#
# NPM=npm
#
######

PATSHOMEQ="$(PATSHOME)"
PATSCONTRIBQ="$(PATSCONTRIB)"

######
#
export \
PATSHOMELOCS=\
./node_modules:./../../node_modules
#
######

PATSCC=$(PATSHOMEQ)/bin/patscc
GTKFLAGS=`pkg-config gtk+-2.0 --cflags --libs`

######

all:: \
TextProcessing
TextProcessing: \
Enigma.dats \
TextProcessing.dats \
TextProcessing_toplevel.dats ; \
  $(PATSCC) -DATS_MEMALLOC_LIBC -I$(PATSCONTRIBQ)/contrib -o $@ $^ $(GTKFLAGS)
cleanall:: ; $(RMF) TextProcessing

######
#
# npm-install:: ; $(NPM) install atscntrb-libcairo
#
######

RMF=rm -f

######

clean:: ; $(RMF) *~
clean:: ; $(RMF) *_?ats.o
clean:: ; $(RMF) *_?ats.c

######

cleanall:: clean

###### end of [Makefile] ######


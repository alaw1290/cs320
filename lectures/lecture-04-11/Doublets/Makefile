#
# A simple Makefile
#

######

NPM=npm

######

PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt
PATSLIB=$(PATSHOME)/ccomp/atslib/lib

######

PATSCC2=\
$(PATSCC) -O2 \
-D_GNU_SOURCE -DATS_MEMALLOC_LIBC

######
#
export \
PATSHOMELOCS=\
./node_modules:./../../node_modules
#
######

all::
regress::
cleanall::

######
#
npm-install:: ; \
$(NPM) i atscntrb-bucs320-graphsearch
#
######
#
all:: \
Doublets
Doublets: \
Doublets.sats \
Doublets_main.dats \
Doublets_dict.dats \
Doublets_word.dats ; \
$(PATSCC2) -o Doublets Doublets_main.dats -latslib
#
regress:: Doublets; ./$<
cleanall:: ; $(RMF) Doublets
#
######

testall:: all
testall:: regress
testall:: cleanall

######

RMF=rm -f

######

clean:: ; $(RMF) *~
clean:: ; $(RMF) *_?ats.c

######
#
cleanall:: clean
#
# cleanall:: ; $(RMF) -r node_modules
#
######

###### end of [Makefile] ######

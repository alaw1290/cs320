#
# A Simple Makefile
#
######
#
PATSCC=\
$(PATSHOME)/bin/patscc
PATSCC2=\
$(PATSCC) -DATS_MEMALLOC_LIBC
#
######

all::

######

all:: \
assign04_sol
assign04_sol: \
assign04_sol.dats; \
$(PATSCC2) -DATS_MEMALLOC_LIBC -o $@ $<

######

regress:: \
assign04_sol; ./$<

######

testall:: all
testall:: regress
testall:: cleanall

######

clean:: ; rm -f *~
clean:: ; rm -f *_?ats.c

######

cleanall:: clean
cleanall:: ; rm -f assign04_sol

###### end of [Makefile] ######

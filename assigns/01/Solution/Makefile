#
# A Simple Makefile
#
######

PATSCC=\
$(PATSHOME)/bin/patscc

######

all::

######

all:: \
assign01_sol
assign01_sol: \
assign01_sol.dats; $(PATSCC) -o $@ $<

######

regress:: \
assign01_sol; ./$<

######

testall:: all
testall:: regress
testall:: cleanall

######

clean:: ; rm -f *~
clean:: ; rm -f *_?ats.c

######

cleanall:: clean
cleanall:: ; rm -f assign01_sol

###### end of [Makefile] ######

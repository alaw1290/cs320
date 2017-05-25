#
# A Simple Makefile
#
######

NPM=npm

######
#
PATSCC=\
$(PATSHOME)/bin/patscc
PATSCC2=\
$(PATSCC) -DATS_MEMALLOC_LIBC
#
export PATSHOMELOCS=./node_modules:./../../node_modules
#
######

all::

######
#
npm-install:: ; \
$(NPM) i effectivats-divideconquer
#
######

all:: \
intrep_sol
intrep_sol: \
intrep_sol.dats; \
$(PATSCC2) -DATS_MEMALLOC_LIBC -o $@ $<

######

all:: \
choose_int_sol
choose_int_sol: \
choose_int_sol.dats; \
$(PATSCC2) -DATS_MEMALLOC_LIBC -o $@ $<

######

all:: \
choose_list_sol
choose_list_sol: \
choose_list_sol.dats; \
$(PATSCC2) -DATS_MEMALLOC_LIBC -o $@ $<

######

regress:: \
intrep_sol; ./$<
regress:: \
choose_int_sol; ./$<
regress:: \
choose_list_sol; ./$<

######

testall:: all
testall:: regress
testall:: cleanall

######

clean:: ; rm -f *~
clean:: ; rm -f *_?ats.c

######

cleanall:: clean
cleanall:: ; rm -f intrep_sol
cleanall:: ; rm -f choose_int_sol
cleanall:: ; rm -f choose_list_sol
cleanall:: ; rm -rf node_modules

###### end of [Makefile] ######

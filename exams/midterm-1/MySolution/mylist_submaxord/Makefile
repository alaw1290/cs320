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
mylist_submaxord
mylist_submaxord: \
mylist_submaxord.dats; \
$(PATSCC2) -DATS_MEMALLOC_LIBC -o $@ $<

######

regress:: \
mylist_submaxord; ./$<

######

testall:: all
testall:: regress
testall:: cleanall

######

clean:: ; rm -f *~
clean:: ; rm -f *_?ats.c

######

cleanall:: clean
cleanall:: ; rm -f mylist_submaxord
cleanall:: ; rm -rf node_modules

###### end of [Makefile] ######

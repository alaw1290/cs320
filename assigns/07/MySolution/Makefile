#
# A simple Makefile
#
include $(PATSHOME)/share/atsmake-pre.mk
#
include $(PATSHOME)/share/atsmake-post.mk
#
all:: \
assign07_sol
assign07_sol: \
assign07_sol.dats ; \
$(PATSCC2) -DATS_MEMALLOC_LIBC -o $@ $<
cleanall:: ; $(RMF) assign07_sol
#
regress:: assign07_sol; ./$<
#
testall:: all
testall:: regress
testall:: cleanall
#
CMKBLD:: ; (cd CMKBLD; cmake ./..)
CMKBLD:: ; (make -C CMKBLD -f Makefile)
CMKBLD_test:: ; (cd CMKBLD; ctest -V)
#
PATS2XHTML=$(PATSHOME)/bin/pats2xhtml
%_dats.html: %.dats ; $(PATS2XHTML) -o $@ -d $<
#
cleanall:: ; rm -rf *_?ats.c CMKBLD/*
#
###### end of [Makefile] ######

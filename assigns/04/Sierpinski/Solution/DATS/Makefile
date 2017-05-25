#
# A simple Makefile
#

######

PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt
ATSCC2JS=$(PATSHOME)/bin/atscc2js

######

all::

######

all:: \
Sierpinski_carpet_dats.js
Sierpinski_carpet_dats.js: \
Sierpinski_carpet.dats; $(PATSCC) -ccats $<; $(ATSCC2JS) -o $@ -i Sierpinski_carpet_dats.c

######

clean:: ; rm -f *~
clean:: ; rm -f *_?ats.c

######

cleanall:: clean
cleanall:: ; rm -f Sierpinski_carpet_dats.js

###### end of [Makefile] ######

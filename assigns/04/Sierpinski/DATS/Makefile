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
Sierpinski_3angle_dats.js
Sierpinski_3angle_dats.js: \
Sierpinski_3angle.dats; $(PATSCC) -ccats $<; $(ATSCC2JS) -o $@ -i Sierpinski_3angle_dats.c

######

all:: \
theCounter3_baconjs_dats.js
theCounter3_baconjs_dats.js: \
theCounter3_baconjs.dats; $(PATSCC) -ccats $<; $(ATSCC2JS) -o $@ -i theCounter3_baconjs_dats.c

######

clean:: ; rm -f *~
clean:: ; rm -f *_?ats.c

######

cleanall:: clean
cleanall:: ; rm -f *_?ats.js

###### end of [Makefile] ######

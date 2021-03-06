/*
**
** The C code is generated by [ATS/Postiats-0-3-5]
** The starting compilation time is: 2017-5-1:  2h: 6m
**
*/

/*
** include runtime header files
*/
#ifndef _ATS_CCOMP_HEADER_NONE_
#include "pats_ccomp_config.h"
#include "pats_ccomp_basics.h"
#include "pats_ccomp_typedefs.h"
#include "pats_ccomp_instrset.h"
#include "pats_ccomp_memalloc.h"
#ifndef _ATS_CCOMP_EXCEPTION_NONE_
#include "pats_ccomp_memalloca.h"
#include "pats_ccomp_exception.h"
#endif // end of [_ATS_CCOMP_EXCEPTION_NONE_]
#endif /* _ATS_CCOMP_HEADER_NONE_ */


/*
** include prelude cats files
*/
#ifndef _ATS_CCOMP_PRELUDE_NONE_
//
#include "prelude/CATS/basics.cats"
#include "prelude/CATS/integer.cats"
#include "prelude/CATS/pointer.cats"
#include "prelude/CATS/integer_long.cats"
#include "prelude/CATS/integer_size.cats"
#include "prelude/CATS/integer_short.cats"
#include "prelude/CATS/bool.cats"
#include "prelude/CATS/char.cats"
#include "prelude/CATS/float.cats"
#include "prelude/CATS/integer_ptr.cats"
#include "prelude/CATS/integer_fixed.cats"
#include "prelude/CATS/memory.cats"
#include "prelude/CATS/string.cats"
#include "prelude/CATS/strptr.cats"
//
#include "prelude/CATS/fprintf.cats"
//
#include "prelude/CATS/filebas.cats"
//
#include "prelude/CATS/list.cats"
#include "prelude/CATS/option.cats"
#include "prelude/CATS/array.cats"
#include "prelude/CATS/arrayptr.cats"
#include "prelude/CATS/arrayref.cats"
#include "prelude/CATS/matrix.cats"
#include "prelude/CATS/matrixptr.cats"
//
#endif /* _ATS_CCOMP_PRELUDE_NONE_ */
/*
** for user-supplied prelude
*/
#ifdef _ATS_CCOMP_PRELUDE_USER_
//
#include _ATS_CCOMP_PRELUDE_USER_
//
#endif /* _ATS_CCOMP_PRELUDE_USER_ */
/*
** for user2-supplied prelude
*/
#ifdef _ATS_CCOMP_PRELUDE_USER2_
//
#include _ATS_CCOMP_PRELUDE_USER2_
//
#endif /* _ATS_CCOMP_PRELUDE_USER2_ */

/*
staload-prologues(beg)
*/
/*
/root/ATS-Postiats/prelude/DATS/basics.dats: 1636(line=50, offs=1) -- 1675(line=50, offs=40)
*/
/*
/root/ATS-Postiats/prelude/DATS/integer.dats: 1596(line=49, offs=1) -- 1635(line=49, offs=40)
*/
/*
/root/ATS-Postiats/prelude/DATS/pointer.dats: 1533(line=44, offs=1) -- 1572(line=44, offs=40)
*/
/*
/root/ATS-Postiats/prelude/DATS/integer_long.dats: 1602(line=49, offs=1) -- 1641(line=49, offs=40)
*/
/*
/root/ATS-Postiats/prelude/DATS/integer_size.dats: 1597(line=49, offs=1) -- 1636(line=49, offs=40)
*/
/*
/root/ATS-Postiats/prelude/DATS/integer_short.dats: 1603(line=49, offs=1) -- 1642(line=49, offs=40)
*/
/*
/root/ATS-Postiats/prelude/DATS/char.dats: 1610(line=48, offs=1) -- 1649(line=48, offs=40)
*/
/*
/root/ATS-Postiats/prelude/DATS/float.dats: 1636(line=50, offs=1) -- 1675(line=50, offs=40)
*/
/*
/root/ATS-Postiats/prelude/DATS/string.dats: 1631(line=50, offs=1) -- 1670(line=50, offs=40)
*/
/*
/root/ATS-Postiats/prelude/DATS/strptr.dats: 1629(line=50, offs=1) -- 1668(line=50, offs=40)
*/
/*
/root/ATS-Postiats/prelude/DATS/strptr.dats: 1691(line=54, offs=1) -- 1738(line=54, offs=48)
*/
/*
/root/ATS-Postiats/prelude/DATS/integer.dats: 1596(line=49, offs=1) -- 1635(line=49, offs=40)
*/
/*
/root/ATS-Postiats/prelude/DATS/integer_ptr.dats: 1601(line=49, offs=1) -- 1640(line=49, offs=40)
*/
/*
/root/ATS-Postiats/prelude/DATS/integer_fixed.dats: 1603(line=49, offs=1) -- 1642(line=49, offs=40)
*/
/*
/root/ATS-Postiats/prelude/DATS/memory.dats: 1410(line=38, offs=1) -- 1449(line=39, offs=32)
*/
/*
/root/ATS-Postiats/prelude/DATS/filebas.dats: 1613(line=49, offs=1) -- 1652(line=50, offs=32)
*/
/*
/root/ATS-Postiats/prelude/DATS/filebas.dats: 1675(line=54, offs=1) -- 1721(line=55, offs=39)
*/
/*
/root/ATS-Postiats/prelude/DATS/integer.dats: 1596(line=49, offs=1) -- 1635(line=49, offs=40)
*/
/*
/root/ATS-Postiats/prelude/DATS/filebas.dats: 1744(line=59, offs=1) -- 1789(line=60, offs=38)
*/
/*
/root/ATS-Postiats/libats/libc/SATS/stdio.sats: 1390(line=36, offs=1) -- 1437(line=39, offs=3)
*/

#include \
"libats/libc/CATS/stdio.cats"
/*
/root/ATS-Postiats/libats/libc/SATS/stdio.sats: 1950(line=69, offs=1) -- 1999(line=71, offs=34)
*/
/*
/root/ATS-Postiats/libats/libc/SATS/sys/types.sats: 1390(line=36, offs=1) -- 1441(line=39, offs=3)
*/

#include \
"libats/libc/CATS/sys/types.cats"
/*
/root/ATS-Postiats/prelude/DATS/filebas.dats: 1871(line=66, offs=1) -- 1918(line=66, offs=48)
*/
/*
/root/ATS-Postiats/libats/libc/SATS/sys/stat.sats: 1390(line=36, offs=1) -- 1440(line=39, offs=3)
*/

#include \
"libats/libc/CATS/sys/stat.cats"
/*
/root/ATS-Postiats/libats/libc/SATS/sys/stat.sats: 1756(line=58, offs=1) -- 1805(line=60, offs=34)
*/
/*
/root/ATS-Postiats/libats/libc/SATS/sys/types.sats: 1390(line=36, offs=1) -- 1441(line=39, offs=3)
*/

#include \
"libats/libc/CATS/sys/types.cats"
/*
/root/ATS-Postiats/prelude/DATS/filebas.dats: 15552(line=879, offs=1) -- 15589(line=880, offs=30)
*/
/*
/root/ATS-Postiats/libats/libc/SATS/stdio.sats: 1390(line=36, offs=1) -- 1437(line=39, offs=3)
*/

#include \
"libats/libc/CATS/stdio.cats"
/*
/root/ATS-Postiats/libats/libc/SATS/stdio.sats: 1950(line=69, offs=1) -- 1999(line=71, offs=34)
*/
/*
/root/ATS-Postiats/libats/libc/SATS/sys/types.sats: 1390(line=36, offs=1) -- 1441(line=39, offs=3)
*/

#include \
"libats/libc/CATS/sys/types.cats"
/*
/root/ATS-Postiats/prelude/DATS/list.dats: 1529(line=44, offs=1) -- 1568(line=45, offs=32)
*/
/*
/root/ATS-Postiats/prelude/DATS/list.dats: 1569(line=46, offs=1) -- 1615(line=47, offs=39)
*/
/*
/root/ATS-Postiats/prelude/DATS/unsafe.dats: 1532(line=44, offs=1) -- 1566(line=44, offs=35)
*/
/*
/root/ATS-Postiats/prelude/DATS/list_vt.dats: 1538(line=44, offs=1) -- 1577(line=45, offs=32)
*/
/*
/root/ATS-Postiats/prelude/DATS/list_vt.dats: 1578(line=46, offs=1) -- 1624(line=47, offs=39)
*/
/*
/root/ATS-Postiats/prelude/DATS/unsafe.dats: 1532(line=44, offs=1) -- 1566(line=44, offs=35)
*/
/*
/root/ATS-Postiats/prelude/DATS/SHARE/list_vt_mergesort.dats: 1546(line=44, offs=1) -- 1585(line=44, offs=40)
*/
/*
/root/ATS-Postiats/prelude/DATS/SHARE/list_vt_quicksort.dats: 1546(line=44, offs=1) -- 1585(line=44, offs=40)
*/
/*
/root/ATS-Postiats/prelude/DATS/array.dats: 1534(line=44, offs=1) -- 1573(line=44, offs=40)
*/
/*
/root/ATS-Postiats/prelude/DATS/array.dats: 1574(line=45, offs=1) -- 1616(line=45, offs=43)
*/
/*
/root/ATS-Postiats/prelude/DATS/SHARE/array_bsearch.dats: 1531(line=44, offs=1) -- 1570(line=44, offs=40)
*/
/*
/root/ATS-Postiats/prelude/DATS/SHARE/array_quicksort.dats: 1531(line=44, offs=1) -- 1570(line=44, offs=40)
*/
/*
/root/ATS-Postiats/prelude/DATS/arrayptr.dats: 1532(line=44, offs=1) -- 1571(line=44, offs=40)
*/
/*
/root/ATS-Postiats/prelude/DATS/arrayref.dats: 1532(line=44, offs=1) -- 1571(line=44, offs=40)
*/
/*
/root/ATS-Postiats/prelude/DATS/matrix.dats: 1535(line=44, offs=1) -- 1574(line=44, offs=40)
*/
/*
/root/ATS-Postiats/prelude/DATS/matrixptr.dats: 1538(line=44, offs=1) -- 1577(line=44, offs=40)
*/
/*
/root/ATS-Postiats/prelude/DATS/matrixref.dats: 1538(line=44, offs=1) -- 1577(line=44, offs=40)
*/
/*
/root/ATS-Postiats/prelude/DATS/stream.dats: 1523(line=44, offs=1) -- 1562(line=44, offs=40)
*/
/*
/root/ATS-Postiats/prelude/DATS/stream_vt.dats: 1523(line=44, offs=1) -- 1562(line=44, offs=40)
*/
/*
/root/ATS-Postiats/prelude/DATS/tostring.dats: 1528(line=44, offs=1) -- 1567(line=45, offs=32)
*/
/*
/root/ATS-Postiats/prelude/DATS/unsafe.dats: 1532(line=44, offs=1) -- 1566(line=44, offs=35)
*/
/*
/root/ATS-Postiats/prelude/DATS/checkast.dats: 1531(line=44, offs=1) -- 1570(line=45, offs=32)
*/
/*
/tmp/assigns/10/Enigma/Enigma.sats: 241(line=20, offs=1) -- 277(line=21, offs=28)
*/
/*
staload-prologues(end)
*/
/*
typedefs-for-tyrecs-and-tysums(beg)
*/
/*
typedefs-for-tyrecs-and-tysums(end)
*/
/*
dynconlst-declaration(beg)
*/
/*
dynconlst-declaration(end)
*/
/*
dyncstlst-declaration(beg)
*/
ATSdyncst_mac(the_atsptr_null)
/*
dyncstlst-declaration(end)
*/
/*
dynvalist-implementation(beg)
*/
/*
dynvalist-implementation(end)
*/
/*
exnconlst-declaration(beg)
*/
#ifndef _ATS_CCOMP_EXCEPTION_NONE_
ATSextern()
atsvoid_t0ype
the_atsexncon_initize
(
  atstype_exnconptr d2c, atstype_string exnmsg
) ;
#endif // end of [_ATS_CCOMP_EXCEPTION_NONE_]
/*
exnconlst-declaration(end)
*/
/*
assumelst-declaration(beg)
*/
#ifndef _ATS_CCOMP_ASSUME_CHECK_NONE_
#endif // #ifndef(_ATS_CCOMP_ASSUME_CHECK_NONE_)
/*
assumelst-declaration(end)
*/
/*
extypelst-declaration(beg)
*/
/*
extypelst-declaration(end)
*/
#if(0)
ATSextern()
atstkind_type(atstype_ptrk)
Enigma__Enigma_create() ;
#endif // end of [QUALIFIED]

#if(0)
ATSextern()
atstkind_t0ype(atstype_int)
Enigma__Enigma_encode(atstkind_type(atstype_ptrk), atstkind_t0ype(atstype_int)) ;
#endif // end of [QUALIFIED]

/*
/tmp/assigns/10/Enigma/Enigma.dats: 310(line=26, offs=14) -- 346(line=27, offs=32)
*/
/*
local: 
global: Enigma_create$0$0(level=0)
local: 
global: 
*/
ATSextern()
atstkind_type(atstype_ptrk)
Enigma__Enigma_create()
{
/* tmpvardeclst(beg) */
ATStmpdec(tmpret0, atstkind_type(atstype_ptrk)) ;
/* tmpvardeclst(end) */
ATSfunbody_beg()
/*
emit_instr: loc0 = /tmp/assigns/10/Enigma/Enigma.dats: 297(line=26, offs=1) -- 347(line=27, offs=33)
*/
ATSINSflab(__patsflab_Enigma_create):
/*
emit_instr: loc0 = /tmp/assigns/10/Enigma/Enigma.dats: 317(line=27, offs=3) -- 346(line=27, offs=32)
*/
ATSINSmove(tmpret0, ATSPMVcastfn(cast, atstkind_type(atstype_ptrk), the_atsptr_null)) ;
ATSfunbody_end()
ATSreturn(tmpret0) ;
} /* end of [Enigma__Enigma_create] */

/*
/tmp/assigns/10/Enigma/Enigma.dats: 420(line=34, offs=15) -- 440(line=34, offs=35)
*/
/*
local: 
global: Enigma_encode$1$0(level=0)
local: 
global: 
*/
ATSextern()
atstkind_t0ype(atstype_int)
Enigma__Enigma_encode(atstkind_type(atstype_ptrk) arg0, atstkind_t0ype(atstype_int) arg1)
{
/* tmpvardeclst(beg) */
ATStmpdec(tmpret1, atstkind_t0ype(atstype_int)) ;
/* tmpvardeclst(end) */
ATSfunbody_beg()
/*
emit_instr: loc0 = /tmp/assigns/10/Enigma/Enigma.dats: 406(line=34, offs=1) -- 440(line=34, offs=35)
*/
ATSINSflab(__patsflab_Enigma_encode):
/*
emit_instr: loc0 = /tmp/assigns/10/Enigma/Enigma.dats: 434(line=34, offs=29) -- 440(line=34, offs=35)
*/
ATSINSmove(tmpret1, arg1) ;
ATSfunbody_end()
ATSreturn(tmpret1) ;
} /* end of [Enigma__Enigma_encode] */

/*
** for initialization(dynloading)
*/
ATSextern()
atsvoid_t0ype
_057_tmp_057_assigns_057_10_057_Enigma_057_Enigma_056_dats__dynload()
{
ATSfunbody_beg()
ATSdynload(/*void*/)
ATSdynloadflag_ext(
_057_tmp_057_assigns_057_10_057_Enigma_057_Enigma_056_dats__dynloadflag
) ;
ATSif(
ATSCKiseqz(
_057_tmp_057_assigns_057_10_057_Enigma_057_Enigma_056_dats__dynloadflag
)
) ATSthen() {
ATSdynloadset(_057_tmp_057_assigns_057_10_057_Enigma_057_Enigma_056_dats__dynloadflag) ;
/*
dynexnlst-initize(beg)
*/
/*
dynexnlst-initize(end)
*/
} /* ATSendif */
ATSfunbody_end()
ATSreturn_void(tmpret_void) ;
} /* end of [*_dynload] */

/* ****** ****** */

/* end-of-compilation-unit */

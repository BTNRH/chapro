# makefile for CHAPRO under Linux with profiling

LIBS=-lsigpro -lm -lz -pg
CC=gcc 
AR=ar
LIBDIR=/usr/local/lib
INCDIR=/usr/local/include
BINDIR=/usr/local/bin

CFLAGS=-Wall -Wno-unknown-pragmas -I$(INCDIR) -fPIC -pg
LFLAGS=-L$(LIBDIR)
CHAPRO=cha_core.o cha_scale.o db.o fft.o rfft.o \
	agc_prepare.o agc_process.o \
	cfirfb_prepare.o cfirfb_process.o \
	firfb_prepare.o firfb_process.o \
	iirfb_design.o iirfb_prepare.o iirfb_process.o \
	ciirfb_design.o ciirfb_prepare.o ciirfb_process.o \
	afc_prepare.o afc_process.o \
	icmp_prepare.o icmp_process.o
PGMS=tst_bbb

profile : $(PGMS)
	# profiling...
	./tst_bbb
	gprof tst_bbb > gprof.txt
	head gprof.txt

tst_bbb : tst_bbb.o  libchapro.a
	$(CC) $(LFLAGS) -o $@ $^ $(LIBS) $(SCLIB)

libchapro.a: $(CHAPRO)
	$(AR) rs libchapro.a $(CHAPRO)

install: libchapro.a
	cp -f libchapro.a $(LIBDIR)
	cp -f chapro.h $(INCDIR)

zipsrc:
	zip chaprosc *.mgw *.lnx *.mac
	zip chaprosc *.h *.c *.m *.def
	zip chaprosc VS9/*.sln VS9/*.vcproj test/cat.wav
	zip chaprosc configure configure.bat 
	zip chaprosc compress.bat suppress.bat shacmp.bat

dist: zipsrc 
	cp -f chapr*.zip ../dist
	rm -f *.zip

clean:
	rm -f *.o *.obj *.bak *.a *.exe $(PGMS) 
	rm -f out*.mat out*.wav *.cfg *~

clean_test:
	rm -f test/*.mat test/tst_*.wav

# dependencies
afc_prepare.o: afc_prepare.c cha_ff.h chapro.h ite_fb.h 
afc_process.o: afc_process.c cha_ff.h chapro.h 
agc_prepare.o: agc_prepare.c cha_ff.h chapro.h 
agc_process.o: agc_process.c cha_ff.h chapro.h
cfirfb_prepare.o: cfirfb_prepare.c cha_cf.h chapro.h 
cfirfb_process.o: cfirfb_process.c cha_ff.h chapro.h 
cha_core.o: cha_core.c chapro.h
cha_scale.o: cha_scale.c chapro.h
chapro.o: chapro.c 
ciirfb_design.o: ciirfb_design.c cha_gf.h chapro.h 
ciirfb_prepare.o: ciirfb_prepare.c cha_gf.h chapro.h 
ciirfb_process.o: ciirfb_process.c cha_gf.h chapro.h 
db.o: db.c chapro.h 
dciirfb_prepare.o: dciirfb_prepare.c cha_gf.h chapro.h 
dciirfb_process.o: dciirfb_process.c cha_gf.h chapro.h 
fft.o: fft.c cha_cf.h chapro.h 
firfb_prepare.o: firfb_prepare.c cha_ff.h chapro.h 
firfb_process.o: firfb_process.c cha_ff.h chapro.h 
gha_demo.o: gha_demo.c cha_ff.h chapro.h 
icmp_prepare.o: icmp_prepare.c cha_gf.h chapro.h 
icmp_process.o: icmp_process.c cha_gf.h chapro.h 
iirfb.o: iirfb.c 
iirfb_design.o: iirfb_design.c chapro.h 
iirfb_prepare.o: iirfb_prepare.c cha_if.h chapro.h 
iirfb_process.o: iirfb_process.c cha_if.h chapro.h 
rfft.o: rfft.c cha_ff.h chapro.h 
tst_bbb.o: tst_bbb.c cha_if.h chapro.h 
tst_cffa.o: tst_cffa.c cha_cf.h chapro.h 
tst_cffio.o: tst_cffio.c cha_cf.h cha_cf_data.h chapro.h 
tst_cffsc.o: tst_cffsc.c cha_cf.h cha_cf_data.h chapro.h 
tst_cifa.o: tst_cifa.c cha_gf.h chapro.h 
tst_cifio.o: tst_cifio.c cha_gf.h cha_gf_data.h chapro.h 
tst_cifsc.o: tst_cifsc.c cha_gf.h cha_gf_data.h chapro.h 
tst_ffa.o: tst_ffa.c cha_ff.h chapro.h 
tst_ffio.o: tst_ffio.c cha_ff.h cha_ff_data.h chapro.h 
tst_ffsc.o: tst_ffsc.c cha_ff.h cha_ff_data.h chapro.h 
tst_fm.o: tst_fm.c chapro.h 
tst_gha.o: tst_gha.c cha_gha_data.h cha_if.h chapro.h 
tst_ifa.o: tst_ifa.c cha_if.h chapro.h 
tst_iffb.o: tst_iffb.c cha_if.h chapro.h 
tst_ifio.o: tst_ifio.c cha_if.h cha_if_data.h chapro.h 
tst_ifsc.o: tst_ifsc.c cha_if.h cha_if_data.h chapro.h 

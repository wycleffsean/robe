
SHELL = /bin/sh

# V=0 quiet, V=1 verbose.  other values don't work.
V = 0
Q1 = $(V:1=)
Q = $(Q1:0=@)
ECHO1 = $(V:1=@:)
ECHO = $(ECHO1:0=@echo)

#### Start of system configuration section. ####

srcdir = ext/robe
topdir = /Users/sean/.rubies/rbx-3.5.0/vm/include/capi
hdrdir = $(topdir)
arch_hdrdir = /Users/sean/.rubies/rbx-3.5.0/vm/include/capi
PATH_SEPARATOR = :
VPATH = $(srcdir):$(arch_hdrdir)/ruby:$(hdrdir)/ruby
prefix = /Users/sean/.rubies/rbx-3.5.0
install_prefix = 
exec_prefix = $(prefix)
bindir = /Users/sean/.rubies/rbx-3.5.0/bin
sbindir = $(exec_prefix)/sbin
libexecdir = $(exec_prefix)/libexec
datarootdir = $(prefix)/share
datadir = $(datarootdir)
sysconfdir = $(prefix)/etc
sharedstatedir = $(prefix)/com
localstatedir = $(prefix)/var
includedir = $(prefix)/include
oldincludedir = /usr/include
docdir = $(datarootdir)/doc/$(PACKAGE)
infodir = $(datarootdir)/info
htmldir = $(docdir)
dvidir = $(docdir)
pdfdir = $(docdir)
psdir = $(docdir)
libdir = $(exec_prefix)/lib
localedir = $(datarootdir)/locale
mandir = $(datarootdir)/man
rubyhdrdir = /Users/sean/.rubies/rbx-3.5.0/vm/include/capi
sitedir = /Users/sean/.rubies/rbx-3.5.0/site
sitelibdir = /Users/sean/.rubies/rbx-3.5.0/site
rubylibdir = /Users/sean/.rubies/rbx-3.5.0/site
archdir = /Users/sean/.rubies/rbx-3.5.0/site/x86_64-darwin15.0.0
sitearchdir = /Users/sean/.rubies/rbx-3.5.0/site/x86_64-darwin15.0.0
rubyarchhdrdir = /Users/sean/.rubies/rbx-3.5.0/vm/include/capi


CC = gcc
CXX = g++
LIBRUBY = $(LIBRUBY_SO)
LIBRUBY_A = 
LIBRUBYARG_SHARED = 
LIBRUBYARG_STATIC = 
empty =
OUTFLAG = -o $(empty)
COUTFLAG = -o $(empty)

RUBY_EXTCONF_H = 
cflags   = 
optflags = 
debugflags = 
warnflags = 
CCDLFLAGS =  -fPIC
CFLAGS   = $(CCDLFLAGS) -g -O2 -I/usr/local/opt/openssl/include -fPIC -D_DARWIN_USE_64_BIT_INODE $(ARCH_FLAG)
INCFLAGS = -I. -I$(arch_hdrdir) -I$(hdrdir)/ruby/backward -I$(hdrdir) -I$(srcdir)
DEFS     = 
CPPFLAGS =  -I/Users/sean/code/gems/robe/ext/robe/include/node/public  -I/Users/sean/.rubies/rbx-3.5.0/include 
CXXFLAGS = $(CCDLFLAGS) -g -O2 $(ARCH_FLAG)
ldflags  =  -L/usr/local/opt/openssl/lib  -L/Users/sean/.rubies/rbx-3.5.0/lib 
dldflags =  
ARCH_FLAG = 
DLDFLAGS = $(ldflags) $(dldflags) $(ARCH_FLAG)
LDSHARED = $(CXX) -lstdc++ -fPIC -bundle -flat_namespace
LDSHAREDXX = g++ -bundle -flat_namespace
AR = ar
EXEEXT = 

RUBY_INSTALL_NAME = rbx
RUBY_SO_NAME = rubinius-3.5
RUBYW_INSTALL_NAME = 

arch = x86_64-darwin15.0.0
sitearch = x86_64-darwin15.0.0
ruby_version = 2.2
ruby = $(bindir)/rbx
RUBY = $(ruby)
ruby_headers = $(hdrdir)/ruby.h $(hdrdir)/ruby/defines.h $(arch_hdrdir)/ruby/config.h

RM = rm -f
RM_RF = $(RUBY) -run -e rm -- -rf
RMDIRS = $(RUBY) -run -e rmdir -- -p
MAKEDIRS = mkdir -p
INSTALL = install -c
INSTALL_PROG = $(INSTALL) -m 0755
INSTALL_DATA = $(INSTALL) -m 644
COPY = cp
TOUCH = exit >

#### End of system configuration section. ####

preload = 

libpath = . $(libdir) /Users/sean/.rubies/rbx-3.5.0/lib /Users/sean/code/gems/robe/ext/robe/bin
LIBPATH =  -L. -L$(libdir) -L/Users/sean/.rubies/rbx-3.5.0/lib -L/Users/sean/code/gems/robe/ext/robe/bin
DEFFILE = 

CLEANFILES = mkmf.log
DISTCLEANFILES = 
DISTCLEANDIRS = 

extout = 
extout_prefix = 
target_prefix = 
LOCAL_LIBS = -lcares -lchrome_zlib -lhttp_parser -ljx -lopenssl -lsqlite3 -luv -lv8_base -lv8_nosnapshot -lstdc++ 
LIBS = $(LIBRUBYARG_STATIC)   
ORIG_SRCS = robe.c
SRCS = $(ORIG_SRCS) 
OBJS = robe.o
HDRS = 
TARGET = robe
TARGET_NAME = robe
TARGET_ENTRY = Init_$(TARGET_NAME)
DLLIB = $(TARGET).bundle
EXTSTATIC = 
STATIC_LIB = 

BINDIR        = $(DESTDIR)$(bindir)
RUBYCOMMONDIR = $(DESTDIR)$(sitedir)$(target_prefix)
RUBYLIBDIR    = $(DESTDIR)$(sitelibdir)$(target_prefix)
RUBYARCHDIR   = $(DESTDIR)$(sitearchdir)$(target_prefix)
HDRDIR        = $(DESTDIR)$(rubyhdrdir)/ruby$(target_prefix)
ARCHHDRDIR    = $(DESTDIR)$(rubyhdrdir)/$(arch)/ruby$(target_prefix)

TARGET_SO     = $(DLLIB)
CLEANLIBS     = $(TARGET).bundle 
CLEANOBJS     = *.o  *.bak

all:    $(DLLIB)
static: $(STATIC_LIB)
.PHONY: all install static install-so install-rb
.PHONY: clean clean-so clean-static clean-rb

clean-static::
clean-rb-default::
clean-rb::
clean-so::
clean: clean-so clean-static clean-rb-default clean-rb
		-$(Q)$(RM) $(CLEANLIBS) $(CLEANOBJS) $(CLEANFILES) .*.time

distclean-rb-default::
distclean-rb::
distclean-so::
distclean-static::
distclean: clean distclean-so distclean-static distclean-rb-default distclean-rb
		-$(Q)$(RM) Makefile $(RUBY_EXTCONF_H) conftest.* mkmf.log
		-$(Q)$(RM) core ruby$(EXEEXT) *~ $(DISTCLEANFILES)
		-$(Q)$(RMDIRS) $(DISTCLEANDIRS) 2> /dev/null || true

realclean: distclean
install: install-so install-rb

install-so: $(DLLIB) ./.RUBYARCHDIR.time
	$(INSTALL_PROG) $(DLLIB) $(RUBYARCHDIR)
clean-static::
	-$(Q)$(RM) $(STATIC_LIB)
install-rb: pre-install-rb install-rb-default
install-rb-default: pre-install-rb-default
pre-install-rb: Makefile
pre-install-rb-default: Makefile
pre-install-rb-default:
	$(ECHO) installing default robe libraries
./.RUBYARCHDIR.time:
	$(Q) $(MAKEDIRS) $(RUBYARCHDIR)
	$(Q) $(TOUCH) $@

site-install: site-install-so site-install-rb
site-install-so: install-so
site-install-rb: install-rb

.SUFFIXES: .c .m .cc .mm .cxx .cpp .C .o

.cc.o:
	$(ECHO) compiling $(<)
	$(Q) $(CXX) $(INCFLAGS) $(CPPFLAGS) $(CXXFLAGS) $(COUTFLAG)$@ -c $<

.mm.o:
	$(ECHO) compiling $(<)
	$(Q) $(CXX) $(INCFLAGS) $(CPPFLAGS) $(CXXFLAGS) $(COUTFLAG)$@ -c $<

.cxx.o:
	$(ECHO) compiling $(<)
	$(Q) $(CXX) $(INCFLAGS) $(CPPFLAGS) $(CXXFLAGS) $(COUTFLAG)$@ -c $<

.cpp.o:
	$(ECHO) compiling $(<)
	$(Q) $(CXX) $(INCFLAGS) $(CPPFLAGS) $(CXXFLAGS) $(COUTFLAG)$@ -c $<

.C.o:
	$(ECHO) compiling $(<)
	$(Q) $(CXX) $(INCFLAGS) $(CPPFLAGS) $(CXXFLAGS) $(COUTFLAG)$@ -c $<

.c.o:
	$(ECHO) compiling $(<)
	$(Q) $(CC) $(INCFLAGS) $(CPPFLAGS) $(CFLAGS) $(COUTFLAG)$@ -c $<

.m.o:
	$(ECHO) compiling $(<)
	$(Q) $(CC) $(INCFLAGS) $(CPPFLAGS) $(CFLAGS) $(COUTFLAG)$@ -c $<

$(DLLIB): $(OBJS) Makefile
	$(ECHO) linking shared-object $(DLLIB)
	-$(Q)$(RM) $(@)
	$(Q) $(LDSHARED) -o $@ $(OBJS) $(LIBPATH) $(DLDFLAGS) $(LOCAL_LIBS) $(LIBS)



$(OBJS): $(HDRS) $(ruby_headers)

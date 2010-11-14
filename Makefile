#############################################################################
# Makefile for building: Points
# Generated by qmake (2.01a) (Qt 4.7.0) on: ?? ????. 13 00:24:04 2010
# Project:  Points.pro
# Template: app
# Command: /usr/bin/qmake -o Makefile Points.pro
#############################################################################

####### Compiler, tools and options

CC            = gcc
CXX           = g++
DEFINES       = -DQT_NO_DEBUG -DQT_DECLARATIVE_LIB -DQT_SCRIPT_LIB -DQT_GUI_LIB -DQT_CORE_LIB -DQT_SHARED
CFLAGS        = -pipe -O2 -Wall -W -D_REENTRANT $(DEFINES)
CXXFLAGS      = -pipe -O2 -Wall -W -D_REENTRANT $(DEFINES)
INCPATH       = -I/usr/share/qt4/mkspecs/linux-g++ -I. -I/usr/include/qt4/QtCore -I/usr/include/qt4/QtGui -I/usr/include/qt4/QtScript -I/usr/include/qt4/QtDeclarative -I/usr/include/qt4 -I.
LINK          = g++
LFLAGS        = -Wl,-O1
LIBS          = $(SUBLIBS)  -L/usr/lib -lQtDeclarative -lQtScript -lQtGui -lQtCore -lpthread 
AR            = ar cqs
RANLIB        = 
QMAKE         = /usr/bin/qmake
TAR           = tar -cf
COMPRESS      = gzip -9f
COPY          = cp -f
SED           = sed
COPY_FILE     = $(COPY)
COPY_DIR      = $(COPY) -r
STRIP         = strip
INSTALL_FILE  = install -m 644 -p
INSTALL_DIR   = $(COPY_DIR)
INSTALL_PROGRAM = install -m 755 -p
DEL_FILE      = rm -f
SYMLINK       = ln -f -s
DEL_DIR       = rmdir
MOVE          = mv -f
CHK_DIR_EXISTS= test -d
MKDIR         = mkdir -p

####### Output directory

OBJECTS_DIR   = ./

####### Files

SOURCES       = main.cpp \
		mainwidget.cpp \
		gamedata.cpp moc_mainwidget.cpp \
		moc_gamedata.cpp \
		moc_point.cpp \
		moc_line.cpp
OBJECTS       = main.o \
		mainwidget.o \
		gamedata.o \
		moc_mainwidget.o \
		moc_gamedata.o \
		moc_point.o \
		moc_line.o
DIST          = /usr/share/qt4/mkspecs/common/g++.conf \
		/usr/share/qt4/mkspecs/common/unix.conf \
		/usr/share/qt4/mkspecs/common/linux.conf \
		/usr/share/qt4/mkspecs/qconfig.pri \
		/usr/share/qt4/mkspecs/modules/qt_webkit_version.pri \
		/usr/share/qt4/mkspecs/features/qt_functions.prf \
		/usr/share/qt4/mkspecs/features/qt_config.prf \
		/usr/share/qt4/mkspecs/features/exclusive_builds.prf \
		/usr/share/qt4/mkspecs/features/default_pre.prf \
		/usr/share/qt4/mkspecs/features/release.prf \
		/usr/share/qt4/mkspecs/features/default_post.prf \
		/usr/share/qt4/mkspecs/features/warn_on.prf \
		/usr/share/qt4/mkspecs/features/qt.prf \
		/usr/share/qt4/mkspecs/features/unix/thread.prf \
		/usr/share/qt4/mkspecs/features/moc.prf \
		/usr/share/qt4/mkspecs/features/resources.prf \
		/usr/share/qt4/mkspecs/features/uic.prf \
		/usr/share/qt4/mkspecs/features/yacc.prf \
		/usr/share/qt4/mkspecs/features/lex.prf \
		/usr/share/qt4/mkspecs/features/include_source_dir.prf \
		Points.pro
QMAKE_TARGET  = Points
DESTDIR       = 
TARGET        = Points

first: all
####### Implicit rules

.SUFFIXES: .o .c .cpp .cc .cxx .C

.cpp.o:
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o "$@" "$<"

.cc.o:
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o "$@" "$<"

.cxx.o:
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o "$@" "$<"

.C.o:
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o "$@" "$<"

.c.o:
	$(CC) -c $(CFLAGS) $(INCPATH) -o "$@" "$<"

####### Build rules

all: Makefile $(TARGET)

$(TARGET):  $(OBJECTS)  
	$(LINK) $(LFLAGS) -o $(TARGET) $(OBJECTS) $(OBJCOMP) $(LIBS)

Makefile: Points.pro  /usr/share/qt4/mkspecs/linux-g++/qmake.conf /usr/share/qt4/mkspecs/common/g++.conf \
		/usr/share/qt4/mkspecs/common/unix.conf \
		/usr/share/qt4/mkspecs/common/linux.conf \
		/usr/share/qt4/mkspecs/qconfig.pri \
		/usr/share/qt4/mkspecs/modules/qt_webkit_version.pri \
		/usr/share/qt4/mkspecs/features/qt_functions.prf \
		/usr/share/qt4/mkspecs/features/qt_config.prf \
		/usr/share/qt4/mkspecs/features/exclusive_builds.prf \
		/usr/share/qt4/mkspecs/features/default_pre.prf \
		/usr/share/qt4/mkspecs/features/release.prf \
		/usr/share/qt4/mkspecs/features/default_post.prf \
		/usr/share/qt4/mkspecs/features/warn_on.prf \
		/usr/share/qt4/mkspecs/features/qt.prf \
		/usr/share/qt4/mkspecs/features/unix/thread.prf \
		/usr/share/qt4/mkspecs/features/moc.prf \
		/usr/share/qt4/mkspecs/features/resources.prf \
		/usr/share/qt4/mkspecs/features/uic.prf \
		/usr/share/qt4/mkspecs/features/yacc.prf \
		/usr/share/qt4/mkspecs/features/lex.prf \
		/usr/share/qt4/mkspecs/features/include_source_dir.prf \
		/usr/lib/libQtDeclarative.prl \
		/usr/lib/libQtScript.prl \
		/usr/lib/libQtGui.prl \
		/usr/lib/libQtCore.prl
	$(QMAKE) -o Makefile Points.pro
/usr/share/qt4/mkspecs/common/g++.conf:
/usr/share/qt4/mkspecs/common/unix.conf:
/usr/share/qt4/mkspecs/common/linux.conf:
/usr/share/qt4/mkspecs/qconfig.pri:
/usr/share/qt4/mkspecs/modules/qt_webkit_version.pri:
/usr/share/qt4/mkspecs/features/qt_functions.prf:
/usr/share/qt4/mkspecs/features/qt_config.prf:
/usr/share/qt4/mkspecs/features/exclusive_builds.prf:
/usr/share/qt4/mkspecs/features/default_pre.prf:
/usr/share/qt4/mkspecs/features/release.prf:
/usr/share/qt4/mkspecs/features/default_post.prf:
/usr/share/qt4/mkspecs/features/warn_on.prf:
/usr/share/qt4/mkspecs/features/qt.prf:
/usr/share/qt4/mkspecs/features/unix/thread.prf:
/usr/share/qt4/mkspecs/features/moc.prf:
/usr/share/qt4/mkspecs/features/resources.prf:
/usr/share/qt4/mkspecs/features/uic.prf:
/usr/share/qt4/mkspecs/features/yacc.prf:
/usr/share/qt4/mkspecs/features/lex.prf:
/usr/share/qt4/mkspecs/features/include_source_dir.prf:
/usr/lib/libQtDeclarative.prl:
/usr/lib/libQtScript.prl:
/usr/lib/libQtGui.prl:
/usr/lib/libQtCore.prl:
qmake:  FORCE
	@$(QMAKE) -o Makefile Points.pro

dist: 
	@$(CHK_DIR_EXISTS) .tmp/Points1.0.0 || $(MKDIR) .tmp/Points1.0.0 
	$(COPY_FILE) --parents $(SOURCES) $(DIST) .tmp/Points1.0.0/ && $(COPY_FILE) --parents mainwidget.h gamedata.h point.h line.h .tmp/Points1.0.0/ && $(COPY_FILE) --parents main.cpp mainwidget.cpp gamedata.cpp .tmp/Points1.0.0/ && (cd `dirname .tmp/Points1.0.0` && $(TAR) Points1.0.0.tar Points1.0.0 && $(COMPRESS) Points1.0.0.tar) && $(MOVE) `dirname .tmp/Points1.0.0`/Points1.0.0.tar.gz . && $(DEL_FILE) -r .tmp/Points1.0.0


clean:compiler_clean 
	-$(DEL_FILE) $(OBJECTS)
	-$(DEL_FILE) *~ core *.core


####### Sub-libraries

distclean: clean
	-$(DEL_FILE) $(TARGET) 
	-$(DEL_FILE) Makefile


check: first

mocclean: compiler_moc_header_clean compiler_moc_source_clean

mocables: compiler_moc_header_make_all compiler_moc_source_make_all

compiler_moc_header_make_all: moc_mainwidget.cpp moc_gamedata.cpp moc_point.cpp moc_line.cpp
compiler_moc_header_clean:
	-$(DEL_FILE) moc_mainwidget.cpp moc_gamedata.cpp moc_point.cpp moc_line.cpp
moc_mainwidget.cpp: gamedata.h \
		point.h \
		line.h \
		mainwidget.h
	/usr/bin/moc-qt4 $(DEFINES) $(INCPATH) mainwidget.h -o moc_mainwidget.cpp

moc_gamedata.cpp: point.h \
		line.h \
		gamedata.h
	/usr/bin/moc-qt4 $(DEFINES) $(INCPATH) gamedata.h -o moc_gamedata.cpp

moc_point.cpp: point.h
	/usr/bin/moc-qt4 $(DEFINES) $(INCPATH) point.h -o moc_point.cpp

moc_line.cpp: line.h
	/usr/bin/moc-qt4 $(DEFINES) $(INCPATH) line.h -o moc_line.cpp

compiler_rcc_make_all:
compiler_rcc_clean:
compiler_image_collection_make_all: qmake_image_collection.cpp
compiler_image_collection_clean:
	-$(DEL_FILE) qmake_image_collection.cpp
compiler_moc_source_make_all:
compiler_moc_source_clean:
compiler_uic_make_all:
compiler_uic_clean:
compiler_yacc_decl_make_all:
compiler_yacc_decl_clean:
compiler_yacc_impl_make_all:
compiler_yacc_impl_clean:
compiler_lex_make_all:
compiler_lex_clean:
compiler_clean: compiler_moc_header_clean 

####### Compile

main.o: main.cpp mainwidget.h \
		gamedata.h \
		point.h \
		line.h
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o main.o main.cpp

mainwidget.o: mainwidget.cpp mainwidget.h \
		gamedata.h \
		point.h \
		line.h
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o mainwidget.o mainwidget.cpp

gamedata.o: gamedata.cpp gamedata.h \
		point.h \
		line.h
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o gamedata.o gamedata.cpp

moc_mainwidget.o: moc_mainwidget.cpp 
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o moc_mainwidget.o moc_mainwidget.cpp

moc_gamedata.o: moc_gamedata.cpp 
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o moc_gamedata.o moc_gamedata.cpp

moc_point.o: moc_point.cpp 
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o moc_point.o moc_point.cpp

moc_line.o: moc_line.cpp 
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o moc_line.o moc_line.cpp

####### Install

install:   FORCE

uninstall:   FORCE

FORCE:

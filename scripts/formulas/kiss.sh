#! /bin/bash
#
# "Keep It Simple, Stupid" Fast Fourier Transform
# http://sourceforge.net/projects/kissfft/

VER=130
VER_UNDERSCORE=1_3_0

# download the source code and unpack it into LIB_NAME
function download() {
	curl -LO http://downloads.sourceforge.net/project/kissfft/kissfft/v$VER_UNDERSCORE/kiss_fft$VER.tar.gz
	tar -xf kiss_fft$VER.tar.gz
	mv kiss_fft$VER kiss
}

# executed inside the build dir
function build() {

	if [ "$TYPE" == "linux" ] ; then
		echo "custom gcc stuff here probably"
	
	elif [ "$TYPE" == "linux64" ] ; then
		echo "custom gcc stuff here probably"
	
	else
		echo "build not needed for $TYPE"
	fi
}

# executed inside the lib src dir, first arg $1 is the dest libs dir root
function copy() {

	# headers
	mkdir -p $1/include
	cp -v kiss_fft.h $1/include
	cp -v tools/kiss_fftr.h $1/include

	# source
	mkdir -p $1/src
	cp -v kiss_fft.c $1/src
	cp -v tools/kiss_fftr.c $1/src
	cp -v _kiss_fft_guts.h $1/src

	# libs
	if [ "$TYPE" == "linux" ] ; then
		mkdir -p $1/lib/linux
		cp -v libkiss.a $1/lib/linux/libkiss.a

	elif [ "$TYPE" == "linux64" ] ; then
		mkdir -p $1/lib/linux64
		cp -v libkiss.a $1/lib/linux64/libkiss.a
	fi
}
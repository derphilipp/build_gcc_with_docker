#!/bin/bash

BOOST_MAJ_VERSION=5
BOOST_MIN_VERSION=2
BOOST_REL_VERSION=0

configure_options=""
configure_options+=" --prefix=/usr/local"
configure_options+=" --program-suffix=-5.2.0"
configure_options+=" --enable-languages=c,c++"
configure_options+=" --disable-multilib"


make_options=""
make_options+=" -j8"

install_options="install"
install_options+=" "





# Build Download URL
ftp_url="ftp://ftp.fu-berlin.de/unix/languages/gcc/releases/"
file_name="gcc-${BOOST_MAJ_VERSION}.${BOOST_MIN_VERSION}.${BOOST_REL_VERSION}.tar.bz2"
dl_url="${ftp_url}gcc-${BOOST_MAJ_VERSION}.${BOOST_MIN_VERSION}.${BOOST_REL_VERSION}/${file_name}"
echo $dl_url
# Build temporary dir, where the sources are extracted
tmp_dir="/tmp/build/gcc-${BOOST_MAJ_VERSION}.${BOOST_MIN_VERSION}.${BOOST_REL_VERSION}/"


rm /tmp/build/stdout.log 2>/dev/null
rm /tmp/build/stderr.log 2>/dev/null

cd /tmp/build                           >/tmp/build/stdout.log  2>/tmp/build/stderr.log && \
echo "Starting Download"                                                                && \
wget -c $dl_url                        >>/tmp/build/stdout.log 2>>/tmp/build/stderr.log && \
echo "Starting Extracting"                                                              && \
tar -xvjf ${file_name}                 >>/tmp/build/stdout.log 2>>/tmp/build/stderr.log && \
cd $tmp_dir                            >>/tmp/build/stdout.log 2>>/tmp/build/stderr.log && \
echo "Starting Configure"                                                               && \
./configure $configure_options         >>/tmp/build/stdout.log 2>>/tmp/build/stderr.log && \
echo "Starting Compilation"                                                             && \
make ${make_options}                   >>/tmp/build/stdout.log 2>>/tmp/build/stderr.log && \
echo "Starting Installation"                                                            && \
make ${install_options}                >>/tmp/build/stdout.log 2>>/tmp/build/stderr.log && \
echo "All done"                        >>/tmp/build/stdout.log 2>>/tmp/build/stderr.log


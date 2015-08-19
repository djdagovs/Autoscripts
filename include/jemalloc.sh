#!/bin/bash
# Author:Tyson
# E-mail:admin#svipc.com
# Website:http://www.svipc.com
# Version:1.0.0  Aug-16-2015-12:28:58
# Notes:Autoscripts for CentOS/RadHat 5+ Debian 6+ and Ubuntu 12+

Install_jemalloc()
{
cd $Autoscripts_dir/src
src_url=http://www.canonware.com/download/jemalloc/jemalloc-$jemalloc_version.tar.bz2 && Download_src

tar xjf jemalloc-$jemalloc_version.tar.bz2
cd jemalloc-$jemalloc_version
./configure
make && make install
if [ -f "/usr/local/lib/libjemalloc.so" ];then
    echo '/usr/local/lib' > /etc/ld.so.conf.d/local.conf
    ldconfig
    echo "${CSUCCESS}jemalloc module install successfully! ${CEND}"
    cd ..
    rm -rf jemalloc-$jemalloc_version
else
    echo "${CFAILURE}jemalloc install failed, Please contact the author! ${CEND}"
    kill -9 $$
fi
cd ..
}

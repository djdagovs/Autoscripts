#!/bin/bash
# Author:Tyson
# E-mail:admin#svipc.com
# Website:http://www.svipc.com
# Version:1.0.0  Aug-16-2015-12:28:58
# Notes:Autoscripts for CentOS/RadHat 5+ Debian 6+ and Ubuntu 12+

Install_tcmalloc()
{
cd $Autoscripts_dir/src
src_url=https://googledrive.com/host/0B6NtGsLhIcf7MWxMMF9JdTN3UVk/gperftools-$tcmalloc_version.tar.gz && Download_src

tar xzf gperftools-$tcmalloc_version.tar.gz 
cd gperftools-$tcmalloc_version
./configure --enable-frame-pointers
make && make install

if [ -f "/usr/local/lib/libtcmalloc.so" ];then
    echo '/usr/local/lib' > /etc/ld.so.conf.d/local.conf
    ldconfig
    echo "${CSUCCESS}tcmalloc module install successfully! ${CEND}"
    cd ..
    rm -rf gperftools-$tcmalloc_version
else
    echo "${CFAILURE}tcmalloc module install failed, Please contact the author! ${CEND}"
    kill -9 $$
fi
cd ..
}

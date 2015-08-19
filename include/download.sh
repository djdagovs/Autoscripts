#!/bin/bash
# Author:Tyson
# E-mail:admin#svipc.com
# Website:http://www.svipc.com
# Version:1.0.0  Aug-16-2015-12:28:58
# Notes:Autoscripts for CentOS/RadHat 5+ Debian 6+ and Ubuntu 12+

Download_src() {
    [ -s "${src_url##*/}" ] && echo "[${CMSG}${src_url##*/}${CEND}] found" || wget -c --no-check-certificate $src_url
    if [ ! -e "${src_url##*/}" ];then
        echo "${CFAILURE}${src_url##*/} download failed, Please contact the author! ${CEND}"
        kill -9 $$
    fi
}

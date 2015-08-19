#!/bin/bash
# Author:Tyson
# E-mail:admin#svipc.com
# Website:http://www.svipc.com
# Version:1.0.0  Aug-16-2015-12:28:58
# Notes:Autoscripts for CentOS/RadHat 5+ Debian 6+ and Ubuntu 12+

[ -e "$nginx_install_dir/sbin/nginx" ] && web_install_dir=$nginx_install_dir
[ -e "$tengine_install_dir/sbin/nginx" ] && web_install_dir=$tengine_install_dir

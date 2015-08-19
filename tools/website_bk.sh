#!/bin/bash
# Author:Tyson
# E-mail:admin#svipc.com
# Website:http://www.svipc.com
# Version:1.0.0  Aug-16-2015-12:28:58
# Notes:Autoscripts for CentOS/RadHat 5+ Debian 6+ and Ubuntu 12+

. ../options.conf

WebSite=$1
LogFile=$backup_dir/website.log
[ ! -e "$wwwroot_dir/$WebSite" ] && { echo "[$wwwroot_dir/$WebSite] not exist" >> $LogFile ;  exit 1 ; }

[ ! -e "$backup_dir" ] && mkdir -p $backup_dir

rsync -crazP --delete $wwwroot_dir/$WebSite $backup_dir

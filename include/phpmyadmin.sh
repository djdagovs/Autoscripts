#!/bin/bash
# Author:Tyson
# E-mail:admin#svipc.com
# Website:http://www.svipc.com
# Version:1.0.0  Aug-16-2015-12:28:58
# Notes:Autoscripts for CentOS/RadHat 5+ Debian 6+ and Ubuntu 12+

Install_phpMyAdmin()
{
cd $Autoscripts_dir/src
src_url=https://files.phpmyadmin.net/phpMyAdmin/${phpMyAdmin_version}/phpMyAdmin-${phpMyAdmin_version}-all-languages.tar.gz && Download_src

tar xzf phpMyAdmin-${phpMyAdmin_version}-all-languages.tar.gz
/bin/mv phpMyAdmin-${phpMyAdmin_version}-all-languages $wwwroot_dir/default/phpMyAdmin
/bin/cp $wwwroot_dir/default/phpMyAdmin/{config.sample.inc.php,config.inc.php}
mkdir $wwwroot_dir/default/phpMyAdmin/{upload,save}
sed -i "s@UploadDir.*@UploadDir'\] = 'upload';@" $wwwroot_dir/default/phpMyAdmin/config.inc.php
sed -i "s@SaveDir.*@SaveDir'\] = 'save';@" $wwwroot_dir/default/phpMyAdmin/config.inc.php
chown -R ${run_user}.$run_user $wwwroot_dir/default/phpMyAdmin
cd ..
}

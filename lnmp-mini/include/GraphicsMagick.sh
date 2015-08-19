#!/bin/bash
# Author:Tyson
# E-mail:admin#svipc.com
# Website:http://www.svipc.com
# Version:1.0.0  Aug-16-2015-12:28:58
# Notes:Autoscripts for CentOS/RadHat 5+ Debian 6+ and Ubuntu 12+

Install_GraphicsMagick()
{
cd $Autoscripts_dir/src
src_url=http://downloads.sourceforge.net/project/graphicsmagick/graphicsmagick/$GraphicsMagick_version/GraphicsMagick-$GraphicsMagick_version.tar.gz && Download_src

tar xzf GraphicsMagick-$GraphicsMagick_version.tar.gz 
cd GraphicsMagick-$GraphicsMagick_version
./configure --enable-shared --prefix=/usr/local/graphicsmagick
make && make install
cd ..
rm -rf GraphicsMagick-$GraphicsMagick_version

if [ -e "$php_install_dir/bin/phpize" ];then
    src_url=http://pecl.php.net/get/gmagick-$gmagick_version.tgz && Download_src
    tar xzf gmagick-$gmagick_version.tgz 
    cd gmagick-$gmagick_version
    make clean
    export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig
    $php_install_dir/bin/phpize
    ./configure --with-php-config=$php_install_dir/bin/php-config --with-gmagick=/usr/local/graphicsmagick
    make && make install
    cd ..
    rm -rf gmagick-$gmagick_version

    if [ -f "$php_install_dir/lib/php/extensions/`ls $php_install_dir/lib/php/extensions | grep zts`/gmagick.so" ];then
        [ -z "`cat $php_install_dir/etc/php.ini | grep '^extension_dir'`" ] && sed -i "s@extension_dir = \"ext\"@extension_dir = \"ext\"\nextension_dir = \"$php_install_dir/lib/php/extensions/`ls $php_install_dir/lib/php/extensions | grep zts`\"@" $php_install_dir/etc/php.ini
        sed -i 's@^extension_dir\(.*\)@extension_dir\1\nextension = "gmagick.so"@' $php_install_dir/etc/php.ini
        [ "$Apache_version" != '1' -a "$Apache_version" != '2' ] && service php-fpm restart || service httpd restart
    else
        echo "${CFAILURE}PHP Gmagick module install failed, Please contact the author! ${CEND}"
    fi
fi
cd ..
}

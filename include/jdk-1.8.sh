#!/bin/bash
# Author:Tyson
# E-mail:admin#svipc.com
# Website:http://www.svipc.com
# Version:1.0.0  Aug-16-2015-12:28:58
# Notes:Autoscripts for CentOS/RadHat 5+ Debian 6+ and Ubuntu 12+

Install-JDK-1-8(){
cd $Autoscripts_dir/src

JDK_FILE="jdk-`echo $jdk_8_version | awk -F. '{print $2}'`u`echo $jdk_8_version | awk -F_ '{print $NF}'`-linux-$SYS_BIG_FLAG.tar.gz"
JAVA_dir=/usr/java
JDK_NAME="jdk$jdk_8_version"
JDK_PATH=$JAVA_dir/$JDK_NAME
src_url=http://mirrors.svipc.com/JDK/$JDK_FILE && Download_src

OS_CentOS='[ -n "`rpm -qa | grep jdk`" ] && rpm -e `rpm -qa | grep jdk`'
OS_command

tar xzf $JDK_FILE

if [ -d "$JDK_NAME" ];then
    rm -rf $JAVA_dir; mkdir -p $JAVA_dir
    mv $JDK_NAME $JAVA_dir
    [ -z "`grep ^'export JAVA_HOME=' /etc/profile`" ] && { [ -z "`grep ^'export PATH=' /etc/profile`" ] && echo  "export JAVA_HOME=$JDK_PATH" >> /etc/profile || sed -i "s@^export PATH=@export JAVA_HOME=$JDK_PATH\nexport PATH=@" /etc/profile; } || sed -i "s@^export JAVA_HOME=.*@export JAVA_HOME=$JDK_PATH@" /etc/profile
    [ -z "`grep ^'export CLASSPATH=' /etc/profile`" ] && sed -i "s@export JAVA_HOME=\(.*\)@export JAVA_HOME=\1\nexport CLASSPATH=\$JAVA_HOME/lib/tools.jar:\$JAVA_HOME/lib/dt.jar:\$JAVA_HOME/lib@" /etc/profile
    [ -n "`grep ^'export PATH=' /etc/profile`" -a -z "`grep '$JAVA_HOME/bin' /etc/profile`" ] && sed -i "s@^export PATH=\(.*\)@export PATH=\$JAVA_HOME/bin:\1@" /etc/profile
    [ -z "`grep ^'export PATH=' /etc/profile | grep '$JAVA_HOME/bin'`" ] && echo 'export PATH=$JAVA_HOME/bin:$PATH' >> /etc/profile
    . /etc/profile
    echo "${CSUCCESS}$JDK_NAME install successfully! ${CEND}"
else
    rm -rf $JAVA_dir
    echo "${CFAILURE}JDK install failed, Please contact the author! ${CEND}"
    kill -9 $$
fi
cd ..
}

#!/usr/bin/python
# Author:Tyson
# E-mail:admin#svipc.com
# Website:http://www.svipc.com
# Version:1.0.0  Aug-16-2015-12:28:58
# Notes:Autoscripts for CentOS/RadHat 5+ Debian 6+ and Ubuntu 12+

import socket,sys
sk = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
sk.settimeout(1)
try:
    sk.connect((sys.argv[1],int(sys.argv[2])))
    print 'ok' 
except Exception:
    print 'no' 
sk.close()

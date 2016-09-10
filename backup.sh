#!/bin/bash
#-----------------------------------------------------------------------#
# Copyright 2006-2016 by Kevin Bühl <kevin@buehl.biz>                   #
#-----------------------------------------------------------------------#
#  __          __    _____________    __          __    ______________  #
# |  |  2006  |  |  |   _______   \  |  |        |  |  |___________   | #
# |  |  2016  |  |  |  |       \  |  |  |        |  |              |  | #
# |  |___ ____|  |  |  |_______/  /  |  |___ ____|  |   ___________|  | #
# |______ ____   |  |   _______  |   |______ ____   |  |   ___________| #
#  by         |  |  |  |       \  \     Server   |  |  |  |             #
#    Kevin    |  |  |  |_______/  |   Management |  |  |  |___________  #
#      Bühl   |__|  |_____________/     System   |__|  |______________| #
#                                                                       #
# No part of this website or any of its contents may be reproduced,     #
# copied, modified or adapted, without the prior written consent of     #
# the author, unless otherwise indicated for stand-alone materials.     #
# For more Information visit www.4b42.com.                              #
# This notice must be untouched at all times.                           #
#-----------------------------------------------------------------------#

#-----------------------------------------------------------------------#
# 2016-09-10    Kevin Bühl      created
#-----------------------------------------------------------------------#
DIR_SRC="/volume1/Backup/server/daily"
DIR_DST="/volumeUSB1/usbshare"

# get all full backups
for i in $(ls -t ${DIR_SRC}|grep full|head -n2); do
    echo "--> $i";
done;

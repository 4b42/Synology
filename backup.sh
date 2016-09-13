#!/bin/bash
#-----------------------------------------------------------------------#
# Copyright 2006-2016 by Kevin Buehl <kevin@buehl.biz>                  #
#-----------------------------------------------------------------------#
#  __          __    _____________    __          __    ______________  #
# |  |  2006  |  |  |   _______   \  |  |        |  |  |___________   | #
# |  |  2016  |  |  |  |       \  |  |  |        |  |              |  | #
# |  |___ ____|  |  |  |_______/  /  |  |___ ____|  |   ___________|  | #
# |______ ____   |  |   _______  |   |______ ____   |  |   ___________| #
#  by         |  |  |  |       \  \     Server   |  |  |  |             #
#    Kevin    |  |  |  |_______/  |   Management |  |  |  |___________  #
#      Buehl  |__|  |_____________/     System   |__|  |______________| #
#                                                                       #
# No part of this website or any of its contents may be reproduced,     #
# copied, modified or adapted, without the prior written consent of     #
# the author, unless otherwise indicated for stand-alone materials.     #
# For more Information visit www.4b42.com.                              #
# This notice must be untouched at all times.                           #
#-----------------------------------------------------------------------#

#-----------------------------------------------------------------------#
# 2016-09-10	Kevin Buehl		created
# 2016-09-13	Kevin Buehl		add email notify
#-----------------------------------------------------------------------#
DIR_SRC="/volume1/Backup/server/daily"
DIR_DST="/volumeUSB1/usbshare"
MAIL_FROM="noreply@4b42.com"
MAIL_TO="backup@4b42.com"

# verify usb device is connected
mount|grep '/volumeUSB1/usbshare' > /dev/null|| exit "No usb device connected!";
# remove all existing backups
rm -rf ${DIR_DST}/*.tib
# get all full backups
for a in $(ls -t ${DIR_SRC}|grep full|cut -d '_' -f3|head -n1); do 
    for b in $(ls ${DIR_SRC}|grep "_${a}_"); do 
        echo "copy $b to ${DIR_DST}";
		cp ${DIR_SRC}/${b} ${DIR_DST}/;
    done;
done;

echo "From: ${MAIL_FROM}" >> /tmp/mail
echo "To: ${MAIL_TO}" >> /tmp/mail
echo "Subject: Backupjob NAS" >> /tmp/mail
echo "" >> /tmp/mailtest
echo "files in ${DIR_DST}:" >> /tmp/mail
ls -lah ${DIR_DST} >> /tmp/mail
cat /tmp/mail | /usr/sbin/sendmail -t ${MAIL_TO}
rm -rf /tmp/mail
#!/bin/sh

# Create directory for FTP root
mkdir -p /var/www/html

mkdir -p /var/run/vsftpd
chown -R ftp:ftp /var/run/vsftpd
chmod 755 /var/run/vsftpd

# Create an FTP user and set his password
adduser $FTP_USER --disabled-password
echo "$FTP_USER:$FTP_PASSWORD" | /usr/sbin/chpasswd &> /dev/null

# set ownership of FTP root directory
chown -R $FTP_USER:$FTP_USER /var/www/html

# Append FTP user to userlist
echo $FTP_USER | tee -a /etc/vsftpd.userlist &> /dev/null

# Start vsftpd service with the new configuration
echo "starting ftp server..."
/usr/sbin/vsftpd /etc/vsftpd.conf

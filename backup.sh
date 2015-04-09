#!/bin/bash
HN=`hostname | awk -F. '{print $1}'`
 
# Set variables
DB_BACKUP="~/Dropbox/mysql/$HN-`date +%d-%m-%Y_%H-%M`"
DB_USER="root"
DB_PASSWD="root"
 
# Create the backup directory
mkdir -p $DB_BACKUP
 
# Run through each database
for db in $(/Applications/MAMP/Library/bin/mysql --user=$DB_USER --password=$DB_PASSWD -e 'show databases' -s --skip-column-names|grep -vi information_schema);
do
 
# Check to make sure performance_schema is missed out
if [ $db != "performance_schema" ]
then
 
# Then export
echo "Exporting $db"
/Applications/MAMP/Library/bin/mysqldump --user=$DB_USER --password=$DB_PASSWD --opt $db | gzip > "$DB_BACKUP/mysqldump-$HN-$db-$(date +%Y-%m-%d).gz";
fi;
 
done
echo "Export complete"
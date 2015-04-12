# Dropbox backup

Create cron to specific user:
crontab -u www-data -e

Run every hour at half past.
30 * * * * ~/bin/backupSQL.sh

0 * * * * ~/dropbox-database-backup/backup.sh &> /dev/null

##What does this project actually do?
* It will loop through all databases that are available to a particular user.
* Export these these databases to a folder (by default this is inside the project)
* Upload to a folder you specify inside your dropbox account. With this folder all exports will reside in a timestamped folder.

##Setup

Coming soon :)

# Thanks

One of the key features of this project is the [Dropbox Uploader](https://github.com/andreafabrizi/Dropbox-Uploader) by Andrea Fabrizi. Without this script, this project would not exist. Please Donate directly to him if you would like to support his work.




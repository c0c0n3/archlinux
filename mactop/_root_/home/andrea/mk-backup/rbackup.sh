#!/bin/sh
# modified rsync backup script, see:
#   http://wiki.archlinux.org/index.php/Full_System_Backup_with_rsync


BKDIR=/media/backup
LOGFILE=~/mk-backup/log

sudo sh -c "
    rsync -a --delete-excluded --exclude-from=backup.lst    \\
          --progress --stats --human-readable               \\
          / $BKDIR > $LOGFILE 2>&1;
    touch $BKDIR/BACKUP
"

#sudo sh -c "
#    rsync -a --delete-excluded --exclude-from=backup.lst    \\
#          --progress --stats --human-readable               \\
#          --dry-run --itemize-changes                       \\
#          /home/andrea/Desktop/easy8583/ $BKDIR/home/andrea/Desktop/easy8583;
#"

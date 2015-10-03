#!/bin/sh

#
# NB run this script as sudo if you want to back up all files in /etc.
# (/etc/suoders can only be accessed by root.)
#

BKDIR=/home/andrea/github/archlinux/vm/backup
LOGFILE=/home/andrea/mk-backup/log

#
# rsync options:
#
# -v, --verbose           increase verbosity
# -r, --recursive         recurse into directories
# -p, --perms             preserve permissions
# -E, --executability     preserve executability
# -A, --acls              preserve ACLs (implies -p)
# -X, --xattrs            preserve extended attributes
# -o, --owner             preserve owner (super-user only)
# -g, --group             preserve group
# -t, --times             preserve modification times
# -h, --human-readable    output numbers in a human-readable format
# --progress              show progress during transfer
# --delete-excluded       also delete excluded files from dest dirs
# --force                 force deletion of dirs even if not empty
# --stats                 give some file-transfer stats
#
# NB don't use -a as it implies -l which copies symlinks; we have to leave them out 
# because some of them (e.g. in /etc) point to files we're not backing up (and so
# can't be recreated) while some others would give you an infinite loop (~/projects).
#
backup="rsync -vrpEAXogth --progress --delete-excluded --force --stats" 
              # --dry-run --itemize-changes"

rm -f $LOGFILE
$backup /boot $BKDIR --exclude-from=exclude.lst >> $LOGFILE 2>&1;
$backup /etc $BKDIR --exclude-from=exclude.lst >> $LOGFILE 2>&1;
$backup /home $BKDIR --exclude-from=exclude.lst >> $LOGFILE 2>&1;


Backups
=======
Log in as `andrea`.  Install [rsync][rsync] and copy backup scripts:

        sudo pacman -S rsync
        ~/mk-backup

The idea is to keep all the work in `data/{github, projects, playground}` (on the Mac and
sym-linked in the VM) which are pushed to GitHub and Dropbox.  Also note:

  * `data/VMs/dropbox` is only meant to be used as a quick way to exchange/download files; 
     never store anything you care about in there as it's not backed up to Dropbox;
  * the VM itself is not backed up to Dropbox either.

So the VM will only contain configuration files and scripts; these will change overtime
and should be backed up regularly using the backup script, which backs up `/boot`, `/etc`,
and `/home` (symlinks excluded) to `data/projects/archlinux/vm/backup`.  This directory
is in the git repository so we can also track changes (remember to commit after backing
up).




[rsync]: https://wiki.archlinux.org/index.php/Rsync
	 "Rsync"

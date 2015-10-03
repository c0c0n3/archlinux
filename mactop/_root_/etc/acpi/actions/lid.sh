#!/bin/bash

#
# DESCRIPTION
# -----------
# Actions to take when the laptop lid is closed/opened.
# We suspend to RAM when the lid is closed and we put the network to sleep; when the lid
# is open we wake the network up. <TODO network>
#
# NOTE
# This script will do nothing if the GNOME Power Manager is running.  In other words, we
# do *not* interfere with it.
#
# DEPENDENCIES
# ------------
# * Packages: pm-utils, <TODO network>
# * This script must be triggered by ACPI events via acpid.
#


#
# Bail out if a DE's power manager is running --- those usually control what happens when
# you close the lid, so we don't interfere.
# NB Right now we only care about GNOME, but, in principle, we could add power managers 
# for other DE's if we wanted the script to be more generic.
# 
DE_POW_MANAGERS="gnome-power-manager"
(pidof $DE_POW_MANAGERS > /dev/null) && exit 0

PM_SUSPEND=${PM_SUSPEND:-/usr/sbin/pm-suspend}


lid_open()
{
    true
}

lid_closed()
{
    $PM_SUSPEND
}

logger "ACPI button/lid event: $*"
case "$4" in
    *1|*3|*5|*7|*9|*b|*d|*f) 
	logger "ACPI button/lid -> action: closing lid"
	lid_closed 
	;;
    *) 
	logger "ACPI button/lid -> action: opening lid"
	lid_open 
	;;
esac
#
# NB on this machine lid events have the format: LID0 00000080 n
# where n is an hex number (e.g. 00000001, 0000000a, 00000010) generated each
# time the lid is closed/opened.  The numbers are in sequence starting from 1:
# 
#    00000001:  CLOSED 
#    00000002:  OPENED
#    00000003:  CLOSED 
#    00000004:  OPENED
#      ...
#    0000000f:  CLOSED 
#    00000010:  OPENED
#      ...
#
# So odd numbers are generated in correspondence of closing the lid.
#
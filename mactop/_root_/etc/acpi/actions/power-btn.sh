#!/bin/bash

#
# DESCRIPTION
# -----------
# Power off the machine.  No arguments required.
#
# NOTE
# Gnome Power Manager (GPM).  If it is running, this script will do nothing.  
# In other words, this script will *not* interfere with GPM.
#
# DEPENDENCIES
# ------------
# None.
#


#
# Bail out if a DE's power manager is running --- those usually control what happens when
# you press the power button, so we don't interfere.
# NB Right now we only care about GNOME, but, in principle, we could add power managers 
# for other DE's if we wanted the script to be more generic.
# 
DE_POW_MANAGERS="gnome-power-manager"
(pidof $DE_POW_MANAGERS > /dev/null) && exit 0

/sbin/poweroff

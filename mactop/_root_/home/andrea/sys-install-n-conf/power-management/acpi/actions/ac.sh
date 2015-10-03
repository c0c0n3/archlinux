#!/bin/bash

#
# DESCRIPTION
# -----------
# Activate (deactivate) power-saving if the AC adapter is disconnected (connected).
# No arguments required.
#
# Currently we rely on pm-utils to manage power-saving; in addition, we set frequency
# scaling and backlights (LCD and keyboard) as this is not done by pm-utils.
#
# Frequency-scaling setting is controlled by the GOVERNOR_AC and GOVERNOR_BAT variables:
# the first is the value of the governor to use when on AC (defaults to performance), the
# latter specifies the governor to use when on battery (defaults to ondemand).  Note that
# the corresponding kernel modules will have to be loaded --- e.g. add cpufreq_performance,
# and cpufreq_ondemand to the MODULES array in /etc/rc.conf.
#
# LCD (keyboard) backlight setting follows the same convention, i.e. it is controlled by 
# the LCD_BL_AC and LCD_BL_BAT variables (KBD_BL_AC and KBD_BL_BAT).  You can specify a
# percentage (integer) value between 0 and 100. 
#
# NOTE
# Gnome Power Manager (GPM).  If it is running, this script will *only* set CPU scaling
# and keyboard backlight (both of which are not handled by GPM) and let GPM call pm-utils.
# In other words, this script will *not* interfere with GPM.
#
# DEPENDENCIES
# ------------
# * Packages: pm-utils, cpufrequtils.
# * Configuration: GOVERNOR_AC/GOVERNOR_BAT governors kernel modules must be loaded.
# * Custom Scripts: lcd-bl, kbd-bl
# 

GOVERNOR_AC=${GOVERNOR_AC:-performance}
GOVERNOR_BAT=${GOVERNOR_BAT:-ondemand}
PM_POWERSAVE=${PM_POWERSAVE:-/usr/sbin/pm-powersave}

LCD_BL_AC=${LCD_BL_AC:-100}
LCD_BL_BAT=${LCD_BL_BAT:-50}
LCD_BL=${LCD_BL:-/usr/sbin/lcd-bl}

KBD_BL_AC=${KBD_BL_AC:-0}
KBD_BL_BAT=${KBD_BL_BAT:-0}
KBD_BL=${KBD_BL:-/usr/sbin/kbd-bl}

DE_POW_MANAGERS="gnome-power-manager"
# NB we could add power managers for other DE's if we wanted the script to be more generic.
# However, we'd first have to check that other power managers do not set scaling and do
# perform all things that pm-utils does.


#
# Helper function to set CPU scaling: set_scaling <governor>
#
# We set the given governor for *each* CPU we've got.
# (NB just setting it for cpu0 will *not* work: the other CPU's will keep the previous
# governor.  BTW this is the reason why I'm not using cpufreq-set: it only sets the
# governor for cpu0!)
# We do *not* set the CPU speed as writing to
#
#    /sys/devices/system/cpu/cpu*/cpufreq/scaling_setspeed
#
# doesn't work; e.g. we could define
#
#  minspeed=`cat /sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_min_freq`
#  maxspeed=`cat /sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_max_freq`
#  setspeed="/sys/devices/system/cpu/cpu0/cpufreq/scaling_setspeed"
# 
# and then run
#
#  echo -n $minspeed > $setspeed  (echo -n $maxspeed > $setspeed)
#
# when switching to battery (AC).
# In any case, this is kinda pointless as the governor (at least the performance/ondemand
# governors) seems to adjust the speed automatically; if you run
#
#  cpufreq-info | egrep 'CPU freq|governor "'
#
# you'll see that when switching to battery, the ondemand governor starts using the
# min speed; likewise, when going back to AC, the performance governor uses immediately
# the max speed.
#
set_scaling()
{
    for gov in /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor; 
    do echo $1 > $gov;
    done;
}

#
# Wraps the call to pm-powersave so that we do nothing if gnome-power-manager is running.
# (In fact, gnome-power-manager calls pm-powersave, so we let him decide what to do.) 
#
pm_powersave()
{
    (pidof $DE_POW_MANAGERS > /dev/null) && return 0
    $PM_POWERSAVE $1
}

#
# Wraps the call to lcd-bl so that we do nothing if gnome-power-manager is running.
# (In fact, gnome-power-manager manages the LCD backlight, so we let him decide what to
# do.) 
#
lcd_bl()
{
    (pidof $DE_POW_MANAGERS > /dev/null) && return 0
    $LCD_BL $1
}

#
# Wraps the call to kbd-bl.
#
kbd_bl()
{
    $KBD_BL $1
}

ac_mode()
{
    set_scaling $GOVERNOR_AC
    lcd_bl $LCD_BL_AC 
    kbd_bl $KBD_BL_AC
    pm_powersave false
}

battery_mode()
{
    pm_powersave true
    set_scaling $GOVERNOR_BAT
    lcd_bl $LCD_BL_BAT
    kbd_bl $KBD_BL_BAT
}

#
# Detect whether or not we're on AC and act accordingly.
#
if /usr/bin/on_ac_power
then
    logger "Switching to AC mode"
    ac_mode
else
    logger "Switching to battery mode"
    battery_mode
fi

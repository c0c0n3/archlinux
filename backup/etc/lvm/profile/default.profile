# This is a default profile for the LVM2 system.
# It contains all configuration settings that are customizable by profiles.
#
# To create a new profile, select the settings you want to customize
# and put them in a new file named <profile_name>.profile. Then put this
# file in a directory as defined by config/profile_dir setting found in
# /etc/lvm/lvm.conf file.
#
# Refer to 'man lvm.conf' for further information about profiles and file layout.

allocation {
	thin_pool_chunk_size = 64
	thin_pool_discards = "passdown"
	thin_pool_zero = 1
}

activation {
	thin_pool_autoextend_threshold = 100
	thin_pool_autoextend_percent = 20
}

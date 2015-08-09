Creating the Virtual Machine
============================

1. Create VM
------------
Create a VM in Virtual Box by clicking on the New button, then enter the following values
in the wizard screens.  (Note: the VM directory will be created under the "Default Machine
Folder"; this can be changed to e.g. '/Volumes/data/VMs' in Virtual Box -> Preferences -> 
General.)

*Name and operating system*

  + Name: madematix
  + Type: Linux
  + Version: Arch Linux (64 bit) 

*Memory size*

  + Memory size: 4096 (1/2 of physical RAM)

*Hard drive*

  + Create a virtual hard drive now
  + VDI
  + Dynamically allocated
  + madematix.hd (make sure it goes in the VM's new folder created above)
  + 20GB

2. Edit configuration
---------------------
Edit the virtual machine configuration in VBox.

*General*

  + Shared Clipboard: Bidirectional
  + Drag 'n Drop: Bidirectional

*System*

  + Motherboard:
    + Boot Order: HD; deselect all others
    + Enable EFI
  + Processor:
    + Processors: 4 (1/2 of host cores)
    + Enable PAE/NX

*Display*
  
  + Video:
    + Video Memory: 128MB

*Audio*

  + Disable audio

*Shared Folders* (No auto-mount)

  + /Volumes/data/VMs/dropbox
  + /Volumes/data/github
  + /Volume/data/playground
  + /Volumes/data/projects
  

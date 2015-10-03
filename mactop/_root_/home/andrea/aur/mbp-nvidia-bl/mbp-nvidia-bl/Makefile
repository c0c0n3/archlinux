NAME=mbp-nvidia-bl
MODULE_NAME=mbp_nvidia_bl
VERSION=0.25.4

obj-m    := $(MODULE_NAME).o

KDIR    := /lib/modules/$(shell uname -r)/build
PWD    := $(shell pwd)

default:
	$(MAKE) -C $(KDIR) SUBDIRS=$(PWD) modules


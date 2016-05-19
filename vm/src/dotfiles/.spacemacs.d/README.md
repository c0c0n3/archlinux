My Spacemacs
============

This directory contains my Spacemacs configuration. All you need to know about
it is in the below sections.


Why?
----
Why using Spacemacs instead of Emacs? My reasons:

* It's just an Emacs streamlined configuration. That's it. No separate program,
just install Emacs and make it use Spacemacs config. (Or I could even switch
back to my old Emacs config if I really wanted to!)
* Curated, tuned packages nicely organised in config layers. Just include the
layer you want to use (e.g. `haskell`, `markdown`) and it mostly works out of
the box. Avoids me having to do the configuration myself, i.e. write code I'll
then have to *maintain*.
* Managed updates. Manages its own updates and also lets you update installed
packages.
* Streamlined, discoverable key bindings. Just hit `M-m` to find stuff. Much
better than the window's menu bar.


Installation
------------
Install Emacs first. Then:

    mv ~/.emacs.d ~/.emacs.d.bak
    mv ~/.emacs ~/.emacs.bak
    git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
    cp -r /path/to/this/.spacemacs.d ~/

Note that you can't use any existing Emacs config. But you can restore it later
if you want to switch back to it.

###### Default Font
Spacemacs uses "Source Code Pro" as default font. I use that too in my config,
so install it with

    pacman -S adobe-source-code-pro-fonts


Configuration Organisation
--------------------------
Keep everything in `.spacemacs.d` and use an `init.el` within it instead of a
`~/.spacemacs` file. I initially generated `init.el` by launching Spacemacs
with no config and selecting the Holy mode option (Emacs editing style) when
prompted. Then

    mkdir ~/.spacemacs.d
    mv  ~/.spacemacs ~/.spacemacs.d/.spacemacs.original
    cp ~/.spacemacs.d/.spacemacs.original ~/.spacemacs.d/init.el

I then arranged most of the settings in configuration groups (frame, editing,
etc.) and moved each group out of `init.el` into its own file. Each of these
files provides suitable `init`, `user-config`, etc. functions I call from the
Spacemacs hooks in `init.el`. This way I can organise my config options better
as I can modularise the settings.

I'm keeping `.spacemacs.original` exactly as Spacemacs spit it out for future
reference, should the Spacemacs config options change.

In the `terminal` directory I've got a derivative of my main config meant to
provide a Spacemacs-based terminal emulator. To launch it, you need to set
`SPACEMACSDIR` with the path to the `terminal` directory so that Spacemacs
will use `terminal/init.el` as config file. A typical invocation looks like
this

    SPACEMACSDIR=/home/andrea/.spacemacs.d/terminal emacs

This is also the command line I use to launch the terminal from Xmonad.

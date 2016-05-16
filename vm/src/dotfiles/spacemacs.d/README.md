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
    mv  ~/.spacemacs ~/.spacemacs.d/init.el

Finally I added a configuration hook for each function provided by Spacemacs.
The idea is to keep the Spacemacs defaults in `init.el` as they were generated
by Spacemacs and override only what I need to in my configuration hooks. This
way I can organise my config options better as I can modularise the settings.
Also, when the time comes to regenerate the initial Spacemacs config file I
can just override my old `init.el` and then easily plonk my hooks in again.
In fact, they consist of five lines in total, the first one being

    (load "~/.spacemacs.d/spacemacs-hooks.el" nil t)

at the top of `init.el` to import the hooks and then the code to call each
hook as the last statement of each Spacemacs-provided config function:

    (defun dotspacemacs/layers ()
    ...
    (layers-hook)
    )

    (defun dotspacemacs/init ()
    ...
    (init-hook)
    )
    
    (defun dotspacemacs/user-init ()
    ...
    (user-init-hook)
    )

    (defun dotspacemacs/user-config ()
    ...
    (user-config-hook)
    )

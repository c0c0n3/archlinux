;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

;; SPACEMACSDIR=~/.spacemacs.d/terminal emacs

(load "~/.spacemacs.d/terminal/frame.el" nil t)
(load "~/.spacemacs.d/edit.el" nil t)
(load "~/.spacemacs.d/theme.el" nil t)

(defun dotspacemacs/layers ()
  (setq-default
   dotspacemacs-configuration-layers '((shell :variables
                                              shell-default-shell 'multi-term))
   dotspacemacs-excluded-packages '(vi-tilde-fringe)
   ;; Do *not* delete any orphan packages as they're needed by
   ;; '~/.spacemacs.d/init.el'.
   dotspacemacs-delete-orphan-packages nil)
  )

(defun dotspacemacs/init ()
  (frame/init)
  (edit/init)
  (theme/init)
  )

(defun dotspacemacs/user-init ()
  )

(defun dotspacemacs/user-config ()
  (frame/user-config)
  (edit/user-config)
  (multi-term)
  )
;; NOTES
;; 1. CUA. Enabled in 'edit/user-config'. It doesn't seem to interfere with
;; shell control (except for Ctrl+z not working) but doesn't work in terminal
;; line mode anyway---you have to use M-w (copy), C-y (paste) instead.
;; However the benefit is that in char mode Ctrl-v pastes from the clipboard
;; and if you have to edit something in a text mode buffer, then CUA is there.


;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.

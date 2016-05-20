;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

;; Spacemacs-based terminal emulator.
;; Start it with the following command line:
;;
;;     SPACEMACSDIR=~/.spacemacs.d/terminal emacs


(load "~/.spacemacs.d/terminal/frame.el" nil t)
(load "~/.spacemacs.d/terminal/term.el" nil t)
(load "~/.spacemacs.d/edit.el" nil t)
(load "~/.spacemacs.d/theme.el" nil t)

(defun dotspacemacs/layers ()
  (setq-default
   dotspacemacs-configuration-layers '()
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
  (term/user-config)
  )
;; NOTES
;; 1. Do *not* enable CUA. (Enabled in 'edit/user-config'.). As noted in the
;; AnsiTerm docs, CUA keybindings interfere with the term keybindings and,
;; in fact, AnsiTerm disables CUA. However, 'term/user-config' remedies this
;; partially so we can still use Ctrl+v to paste from the clipboard when in
;; char mode. For line mode, you'll have to use Emacs bindings:  M-w (copy),
;; C-y (paste), etc.


;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.

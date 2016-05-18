;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  (setq-default
   dotspacemacs-configuration-layers
   '((shell :variables
            shell-default-shell 'multi-term))
   dotspacemacs-excluded-packages '(vi-tilde-fringe)
   ;; Do *not* delete any orphan packages as they're needed by
   ;; '~/.spacemacs.d/init.el'.
   dotspacemacs-delete-orphan-packages nil)
  )


(defun dotspacemacs/init ()
  (setq-default
   dotspacemacs-check-for-update nil
   dotspacemacs-editing-style 'emacs
   dotspacemacs-startup-banner nil
   dotspacemacs-startup-lists nil
   dotspacemacs-themes '(solarized-dark zenburn)
   dotspacemacs-default-font '("Source Code Pro"
                               :size 17
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   dotspacemacs-auto-save-file-location nil
   dotspacemacs-loading-progress-bar nil
   dotspacemacs-maximized-at-startup t

   ;; frame transparency settings not working!
   ;;dotspacemacs-active-transparency 85
   ;;dotspacemacs-inactive-transparency 85
   )
  )

(defun dotspacemacs/user-init ()
  )

(defun dotspacemacs/user-config ()
  ;; How to get rid of the 'spacemacs' startup buffer?
  ;; The following kills it, but then it is re-opened and I get an error
  ;; message.
  ;;(dolist (buffer (buffer-list))
  ;;  (kill-buffer buffer))

  (multi-term)

  ;; frame settings
  ;; ----------------------------------------------------
  ;; no need to display scroll bar on the right as spacemacs smooth scrolling works well.
  ;; disable menu and toolbar (spacemacs does that already)

  ;; make the frame transparent
  ;;(set-frame-parameter (selected-frame) 'alpha '(<active> [<inactive>]))
  (set-frame-parameter (selected-frame) 'alpha '(85 85))
  (add-to-list 'default-frame-alist '(alpha 85 85))

  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.

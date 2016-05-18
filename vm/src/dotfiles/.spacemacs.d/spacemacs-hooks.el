;; Configuration layers hook. Called at the very end of dotspacemacs/layers.
;; You should not put any user code in this function besides overriding the
;; Spacemacs variables you want to change from their defaults.
(defun layers-hook ()
  (setq-default
    dotspacemacs-configuration-layers '(
      auto-completion
      better-defaults
      emacs-lisp
      git
      markdown
      (shell :variables
             shell-default-shell 'multi-term
             shell-default-height 30
             shell-default-position 'bottom)
      (spell-checking :variables
                      ispell-dictionary "en_GB")
      syntax-checking
      version-control)
    dotspacemacs-excluded-packages '(
      ;; get rid of tildes on empty lines.
      vi-tilde-fringe)
    )
  )

;; Initialization function hook. Called at the very end of dotspacemacs/init.
;; You should not put any user code in this function besides overriding the
;; Spacemacs variables you want to change from their defaults.
(defun init-hook ()
  (setq-default

    ;; Start off with Solarized dark. Hit 'M-m T n' to cycle to next theme.
    dotspacemacs-themes '(
      solarized-dark
      zenburn)
    ;; Default font. Tweak powerline-scale if separators don't look good.
    dotspacemacs-default-font '("Source Code Pro"
                                :size 17
                                :weight normal
                                :width normal
                                :powerline-scale 1.1)

    ;; Maximised frame when Emacs starts up. 
    ;; 'dotspacemacs-fullscreen-at-startup' must be nil for this to work.
    dotspacemacs-maximized-at-startup t
    ;; Active and inactive frame transparency percentage (100 = opaque).
    dotspacemacs-active-transparency 100
    dotspacemacs-inactive-transparency 70
    ;; Show line numbers when in 'prog-mode' or 'text-mode'.
    dotspacemacs-line-numbers t

    ;; Delete white space on changed lines when saving the buffer.
    dotspacemacs-whitespace-cleanup 'changed
    ;; Disable auto-saving.
    dotspacemacs-auto-save-file-location nil
    )
  )

;; User code init hook. Called at the very end of dotspacemacs/user-init.
;; dotspacemacs/user-init is called after dotspacemacs/init, but before layer
;; configuration.
;; This hook is only useful for variables that need to be set before packages
;; are loaded. Normally you should use the user-config-hook.
(defun user-init-hook ()
  )

;; User code hook. Called at the very end of dotspacemacs/user-config.
;; Most of your config should go in here. 
(defun user-config-hook ()
  (load "~/.spacemacs.d/edit.el" nil t)
  ;;(load "~/.spacemacs.d/shell.el" nil t)
  (load "~/.spacemacs.d/speedbar.el" nil t)
  )

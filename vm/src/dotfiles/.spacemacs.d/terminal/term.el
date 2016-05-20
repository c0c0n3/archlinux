(defun term/user-config ()
  (ansi-term "/bin/bash")
  )

;; Ctr+v to paste into terminal when in char mode.
(defun term-paste-hook ()
  (define-key term-raw-map (kbd "C-v") 'term-paste)
  )
(add-hook 'term-mode-hook 'term-paste-hook)

;; Quit emacs when the shell exits.
;; This is similar to what 'multi-term.el' does but we quit emacs instead of
;; just killing the term buffer.
;; See:
;; - https://www.emacswiki.org/emacs/multi-term.el
;; - https://www.gnu.org/software/emacs/manual/html_node/elisp/Sentinels.html
;;
(defun quit-term-sentinel (process event)
  (when (string-match "\\(finished\\|exited\\)" event)
    (save-buffers-kill-emacs))
  )
(defun sentinel-hook ()
  (set-process-sentinel (get-buffer-process "*ansi-term*") 'quit-term-sentinel)
  )
(add-hook 'emacs-startup-hook 'sentinel-hook)

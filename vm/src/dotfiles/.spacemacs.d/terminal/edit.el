(defun term-edit/user-config ()
  (add-hook 'term-mode-hook 'term-paste-hook)
  )

;; Ctr+v to paste into terminal when in char mode.
(defun term-paste-hook ()
  (define-key term-raw-map (kbd "C-v") 'term-paste)
  )

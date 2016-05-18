;; Enable AnsiColor for the normal shell --- i.e. M-x shell
(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
;; the above never really worked in: M-x shell
;; (even in my old config)

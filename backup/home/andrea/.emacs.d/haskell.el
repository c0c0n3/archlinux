;; Haskell mode settings

(load "/usr/share/emacs/site-lisp/haskell-mode/haskell-site-file")

(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-font-lock)
(setq haskell-font-lock-symbols 'unicode)

;; see http://mult.ifario.us/p/emacs-haskell-mode-unicode-cuteness
;;      http://sequence.complete.org/node/365

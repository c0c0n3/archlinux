
;; Enable Printing package
(require 'printing)
(pr-update-menus t)

;; M-x print-to-pdf: print the current buffer to a pdf file in the same directory.
;; Alternatively, you can do this manually with C-u M-x ps-spool-buffer-with-faces
;; to print to PostScript (you'll be prompted for a file name) and then use ps2pdf
;; to turn it into a PDF.
;; (Note that M-x ps-spool-buffer-with-faces generates the PostScript in a new
;; buffer.)
(defun print-to-pdf ()
  (interactive)
  (ps-spool-buffer-with-faces)
  (switch-to-buffer "*PostScript*")
  (write-file "/tmp/tmp.ps")
  (kill-buffer "tmp.ps")
  (setq cmd (concat "ps2pdf /tmp/tmp.ps " (buffer-name) ".pdf"))
  (shell-command cmd)
  (shell-command "rm /tmp/tmp.ps")
  (message (concat "Saved to:  " (buffer-name) ".pdf"))
)


;; Make emacs use the clipboard
(setq x-select-enable-clipboard t)
(setq interprogram-paste-function 'x-cut-buffer-or-selection-value)


;; Enable AnsiColor for the normal shell --- i.e. M-x shell
(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)


;; Ispell default dictionary
(setq ispell-dictionary "en_GB")


;; Haskell mode settings

(load "/usr/share/emacs/site-lisp/haskell-mode/haskell-site-file")

(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-font-lock)
(setq haskell-font-lock-symbols 'unicode)

;; see http://mult.ifario.us/p/emacs-haskell-mode-unicode-cuteness
;;      http://sequence.complete.org/node/365


;; show line number the cursor is on, in status bar (the mode line) 
(line-number-mode 1)
;; display line numbers in margin (fringe). Emacs 23 only.
(global-linum-mode 1) ; always show line numbers


;; disable backup (filename~ file) and autosave (#filename# file)
(setq backup-inhibited t)
(setq auto-save-default nil)


;; Auctex
(load "auctex.el" nil t t)
(setq TeX-auto-save t)
(setq TeX-parse-self t)

(setq-default TeX-master nil) ; Query for master file.
(setq TeX-PDF-mode t)  ;; set pdflatex default, not latex


;;(set-default-font "Monospace-10")
;;(set-default-font "Monaco")


(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(cua-mode t nil (cua-base))
 '(inhibit-startup-screen t)
 '(scroll-bar-mode (quote right))
 '(show-paren-mode t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "white" :foreground "black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 117 :width normal :foundry "unknown" :family "Monaco"))))
 '(font-lock-comment-face ((((class color) (min-colors 88) (background light)) (:foreground "Gray68"))))
 '(font-lock-constant-face ((((class color) (min-colors 88) (background light)) (:foreground "#FCA434" :weight bold))))
 '(font-lock-doc-face ((t (:inherit font-lock-string-face :foreground "Gray68"))))
 '(font-lock-function-name-face ((((class color) (min-colors 88) (background light)) (:foreground "#6EAAF3" :weight bold))))
 '(font-lock-keyword-face ((((class color) (min-colors 88) (background light)) (:foreground "#6EAAF3" :weight bold))))
 '(font-lock-string-face ((((class color) (min-colors 88) (background light)) (:foreground "RosyBrown"))))
 '(font-lock-variable-name-face ((t (:foreground "#FCA434" :weight normal :family "Monospace")))))

(put 'dired-find-alternate-file 'disabled nil)


;; NOTE: to figure out which font-lock vars to set, you can postion the cursor on 
;; some text and then 'M-x describe-face'.  For complete color themes see:
;;  * http://emacs-fu.blogspot.com/2009/03/color-theming.html

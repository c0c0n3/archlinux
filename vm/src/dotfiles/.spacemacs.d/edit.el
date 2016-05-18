;; set default major mode to be text instead of fundamental
;; 'M-x fundamental-mode' takes you back to fundamental mode
(setq-default major-mode 'text-mode)


;; Make emacs use the clipboard
;;(setq x-select-enable-clipboard t)
;;(setq interprogram-paste-function 'x-cut-buffer-or-selection-value)
;; spacemacs does that already

;; enable CUA mode (‘C-v’ to paste, ‘C-c’ to copy, ‘C-x’ to cut, ‘C-z’ to undo, etc.)
(cua-mode t)


;; disable backup (filename~ file) and autosave (#filename# file)
;;(setq backup-inhibited t)
;;(setq auto-save-default nil)
;;(setq make-backup-files nil)
;; spacemacs does that already

;; use spaces for indentation everywhere, with tab width = 4 spaces:
;;(setq-default indent-tabs-mode nil)
;;(setq tab-stop-list (number-sequence 4 200 4))
;; spacemacs does that already, see:
;; https://github.com/syl20bnr/spacemacs/issues/3037
;; https://github.com/syl20bnr/spacemacs/issues/3037#issuecomment-140473245


;; see matching pairs of parentheses and other characters. 
;; When point is on one of the paired characters, the other is highlighted. 
;;(show-paren-mode 1)
;;(setq show-paren-delay 0) ;; get rid of delay before showing match
;; spacemacs does that already

;; Spacemacs variables configuration.
;; You should not put any user code in this function besides overriding the
;; Spacemacs variables you want to change from their defaults.
(defun theme/init ()
  (setq-default

   ;; Start off with Solarized dark. Hit 'M-m T n' to cycle to next theme.
   dotspacemacs-themes '(solarized-dark
                         zenburn)

   ;; Default font. Tweak powerline-scale if separators don't look good.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 17
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   )
  )

(defun theme/user-config ()
  ;; Fill column indicator style.
  (setq fci-rule-width 1)
  (setq fci-rule-color "#073642")  ;; Solarized Base02
  )
;; NOTE
;; 1. Hard-coded fill column indicator colour.
;; Any way I can avoid hard-coding it? Ideally it should be some constant
;; that is defined in both themes I'm using so that when switching themes
;; the colour is switched too.

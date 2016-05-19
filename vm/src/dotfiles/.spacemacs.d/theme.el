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
                               :size 20 ;; use 17 on my mactop
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   )
  )

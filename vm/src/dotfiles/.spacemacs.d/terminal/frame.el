(defun frame/init ()
  (setq-default
   ;; Maximise frame when Emacs starts up.
   ;; 'dotspacemacs-fullscreen-at-startup' must be nil for this to work.
   dotspacemacs-fullscreen-at-startup nil
   dotspacemacs-maximized-at-startup t

   ;; Enable smooth scrolling (native-scrolling). This overrides Emacs default
   ;; behavior which recenters the point when it reaches the top or bottom of
   ;; the screen.
   dotspacemacs-smooth-scrolling t

   ;; Show line numbers when in 'prog-mode' or 'text-mode'.
   dotspacemacs-line-numbers t

   ;; Get rid of (most of) Spacemacs start up buffer and speedup loading time.
   dotspacemacs-startup-banner nil
   dotspacemacs-startup-lists nil
   dotspacemacs-loading-progress-bar nil
   dotspacemacs-check-for-update nil
   )
  )

(defun frame/user-config ()
  ;; Make the frame transparent.
  ;;(set-frame-parameter (selected-frame) 'alpha '(<active> [<inactive>]))
  (set-frame-parameter (selected-frame) 'alpha '(85 85))
  (add-to-list 'default-frame-alist '(alpha 85 85))

  ;; Get rid of initial Spacemacs buffer. It will be recreated later but
  ;; basically empty.
  (kill-buffer (get-buffer spacemacs-buffer-name))
  )

;; quit emacs when the shell exits
;;(advice-add 'multi-term-handle-close :after #'save-buffers-kill-emacs)

;;(advice-add 'kill-buffer :after #'term-test)
(defvar test-cnt 0)
(defun term-test (&optional buffer)
  (interactive)
  (message "Killed buffer: %S" (buffer-name buffer))
  (when (equal major-mode 'term-mode)
    (setq test-cnt (+ test-cnt 1))
    (message "[%i] Was a term buffer: %S" test-cnt (buffer-name buffer))
    )
  )

(defun msg-me (process event)
  (princ
   (format "Process: %s had the event `%s'" process event)))
;;(set-process-sentinel (get-process "shell") 'msg-me)
;;(let (proc (ansi-term "/bin/bash"))
;;     (set-process-sentinel proc 'msg-me))

;;(defun my-sentinel ()
;;  (set-process-sentinel (get-process "ansi-term")
;;                        (lambda (proc change)
;;                          (when (string-match "\\(finished\\|exited\\)" change)
;;                            (message "SENTINEL => buffer"))))
;;  )




;;(defadvice term-sentinel (around my-advice-term-sentinel (proc msg))
;;  (if (memq (process-status proc) '(signal exit))
;;      (let ((buffer (process-buffer proc)))
;;        ad-do-it
;;        (save-buffers-kill-terminal))  ; save-buffers-kill-emacs
;;    ad-do-it))
;;(ad-activate 'term-sentinel)


;; NOTES
;; 1. Think Spacemacs hides the initial splash screen with
;;     (setq inhibit-startup-screen t)
;; but replaces it with its own buffer ("spacemacs"). I managed to kill this
;; buffer (see frame/user-config) but then I get an annoying message in the
;; status bar ("spacemacs buffer error: ... No buttons or fields found...")
;; and the buffer is eventually re-opened with just one line ("[ ...packages
;; loaded in ...]). There must be a better way of doing this?
;;
;; 2. Could display a scroll bar on the right with
;;     (scroll-bar-mode (quote right))
;; but smooth scrolling works quite well, so I don't think I'll ever need a
;; scroll bar again!
;;
;; 3. Active and inactive frame transparency seem to have no effect; I
;; always get fully opaque frames:
;;     dotspacemacs-active-transparency 85
;;     dotspacemacs-inactive-transparency 85
;; so am forcing this setting in 'frame/user-config'.
;;
;; 4. There's no need to disable menu and toolbar:
;;     (tool-bar-mode -1)
;;     (menu-bar-mode -1)
;; as Spacemacs does that already.

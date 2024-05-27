(use-package diminish
  :ensure t)

(use-package ef-themes
  :ensure t
  :config
  (setq ef-themes-headings
	'((1 . (1.5))
          (2 . (1.3))
          (agenda-date . (1.3))
          (agenda-structure . (1.8))
          (t . (1.1)))))

(use-package emacs
  :ensure nil
  :preface
  (defvar rc/light-theme 'modus-operandi-tinted)
  (defvar rc/dark-theme 'ef-dream)
  (defun rc/theme-change (theme-condition)
    (if theme-condition
	(progn (disable-theme rc/dark-theme)
	       (load-theme rc/light-theme t))
      (progn (disable-theme rc/light-theme)
	     (load-theme rc/dark-theme t))))
  
  (defun rc/theme-toggle-light-dark ()
    (interactive)
    (rc/theme-change rc/theme-is-dark)
    (toggle-p rc/theme-is-dark))

  (defun rc/theme-check-time ()
    (let ((is-day (rc/time-is-day)))
      (rc/theme-change is-day)
      (setq rc/theme-is-dark (not is-day))))
  
  (defvar after-enable-theme-hook nil)
  (defun run-after-enable-theme-hook (&rest _args)
    (run-hooks 'after-enable-theme-hook))
  (advice-add 'enable-theme :after #'run-after-enable-theme-hook)
  
  :hook
  (before-make-frame . rc/theme-check-time)
  :init
  (set-face-attribute 'default nil
		      :family default-font
		      :height 110)
  (set-face-attribute 'italic nil
		      :family default-font)
  (defvar rc/theme-is-dark (not (rc/time-is-day)))
  (rc/theme-check-time)
  :custom
  (modus-themes-italic-constructs t))


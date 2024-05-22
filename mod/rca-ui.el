(use-package diminish
  :ensure t)

(use-package emacs
  :ensure nil
  :preface
  (defvar rc/light-theme 'modus-operandi-tinted)
  (defvar rc/dark-theme 'modus-vivendi-tinted)
  (defun rc/toggle-theme-light-dark ()
    (interactive)
    (if rc/current-theme-dark-p
	(progn (load-theme rc/light-theme)
	       (setq rc/current-theme-dark-p nil))
      (load-theme rc/dark-theme)
      (setq rc/current-theme-dark-p t)))
  (defun rc/theme-check-time ()
    (if (rc/time-is-day)
	(progn (load-theme rc/light-theme)
	       (setq rc/current-theme-dark-p nil))
      (load-theme rc/dark-theme)
      (setq rc/current-theme-dark-p t)))
  :hook
  (before-make-frame . rc/theme-check-time)
  :init
  (set-face-attribute 'default nil
		      :family default-font
		      :height 110)
  (set-face-attribute 'italic nil
		      :family default-font
		      :height 110)
  (defvar rc/current-theme-dark-p (not (rc/time-is-day)))
  (rc/theme-check-time)
  :custom
  (modus-themes-italic-constructs t))

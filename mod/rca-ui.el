(use-package diminish
  :ensure t)

(use-package emacs
  :ensure nil
  :preface
  (defvar rc/current-theme-dark-p nil)
  (defvar rc/ligth-theme 'modus-operandi-tinted)
  (defvar rc/dark-theme 'modus-vivendi-tinted)
  (defun rc/toggle-theme-light-dark ()
    (interactive)
    (if rc/current-theme-dark-p
	(progn (load-theme rc/ligth-theme)
	       (setq rc/current-theme-dark-p nil))
      (load-theme rc/dark-theme)
      (setq rc/current-theme-dark-p t))))

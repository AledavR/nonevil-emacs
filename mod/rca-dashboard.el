(use-package dashboard
  :ensure t
  :preface
  (defun protect-dashboard ()
    (define-key
     dashboard-mode-map (kbd "q") 'dashboard-refresh-buffer))
  ()
  :hook
  (dashboard-mode . protect-dashboard)
  (elpaca-after-init . dashboard-insert-startupify-lists)
  (elpaca-after-init . dashboard-initialize)
  (dashboard-after-initialize . dashboard-refresh-buffer)
  (server-after-make-frame . dashboard-refresh-buffer)
  :custom
  (dashboard-center-content t)
  (dashboard-items nil)
  ;; (dashboard-startup-banner `(,(init-dir "img/remilia.png"))) 
  ;; (dashboard-startup-banner `(,(rc/list-select-random banner-images)))
  (dashboard-startup-banner banner-images)
  ;; (dashboard-image-banner-max-height 520)
  (dashboard-image-banner-max-height 550)
  (dashboard-banner-logo-title nil)
  (dashboard-set-footer nil)
  (dashboard-footer-messages (list nil))
  :init
  (dashboard-setup-startup-hook)
  (setq initial-buffer-choice (lambda ()
				(get-buffer-create "*dashboard*"))))

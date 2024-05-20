(use-package emacs
  :ensure nil

  :bind (("C-x j" . rc/file-find-config)
	 ("C-x R" . consult-recent-file)
	 ("C-x C-k C-x C-k" . kill-emacs)
	 ("C-x B" . buffer-menu)
	 ("M-z" . zap-up-to-char)
	 ("C-z" . nil)
	 ("C-x C-z" . nil)
	 ("C-x C-c" . nil)
	 ("C-h h" . nil)
	 ("M-`" . nil)
	 ("<insert>" . nil)
	 ("<menu>" . nil))

  :custom
  ;; (initial-buffer-choice t)
  (recentf-save-file recentf-directory)
  (initial-scratch-message nil)
  (auto-save-list-file-prefix nil)
  (inhibit-initial-startup-message t)
  (ring-bell-function 'ignore)
  (column-number-mode t)
  (use-dialog-box nil)
  (auto-save-default nil)
  (auto-save-interval 200)
  (auto-save-timeout 20)
  (backup-directory-alist `(("." . ,backup-directory)))
  (recentf-exclude history-excluded-filetypes)
  (frame-resize-pixelwise t)
  (x-select-enable-clipboard t)

  :config
  (scroll-bar-mode -1)
  (tool-bar-mode -1)
  (menu-bar-mode -1)
  (recentf-mode 1)
  (defalias 'yes-or-no-p 'y-or-n-p)
  (global-set-key (kbd "C-c C-p") 'find-file-at-point)
  (add-hook 'prog-mode-hook 'display-line-numbers-mode)
  (setq-default fill-column 80)
  ;; (setq-default display-line-numbers-type 'visual)
  (setq-default display-line-numbers-width 3)
  (setq-default display-line-numbers-grow-only t)
  ;; (load-theme 'modus-operandi-tinted t)
  (add-to-list 'default-frame-alist `(font . ,default-font))
  (add-to-list 'default-frame-alist '(fullscreen . maximized)))

(use-package server
  :ensure nil
  :config
  (unless (server-running-p)
    (server-start)))

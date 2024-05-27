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
  (read-file-name-completion-ignore-case t)

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
  (setq-default custom-file
		(expand-file-name "custom.el" user-emacs-directory))
  (when (file-exists-p custom-file)
    (load custom-file))
  (add-to-list 'default-frame-alist '(fullscreen . maximized)))

(use-package server
  :ensure nil
  :config
  (unless (server-running-p)
    (server-start)))

(use-package mhtml-mode
  :ensure nil
  :defer t
  :preface
  (defun sgml-delete-tagged-text ()
  "Delete text between the tags that contain the current point"
  (interactive)
  (let ((b (point)))
    (sgml-skip-tag-backward 1)
    (when (not (eq b (point)))
      ;; moved somewhere, should be at front of a tag now
      (save-excursion 
        (forward-sexp 1)
        (setq b (point)))
      (sgml-skip-tag-forward 1)
      (backward-sexp 1)
      (delete-region b (point))
      (meow-insert))))
  :config
  (define-key mhtml-mode-map (kbd "C-c C-i") 'sgml-delete-tagged-text))

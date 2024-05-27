(use-package yasnippet
  :ensure t
  :diminish yas-minor-mode
  :custom
  (yas-snippet-dirs `(,(init-dir "snippets")))
  :config
  (yas-global-mode 1))

(use-package corfu
  :ensure t
  :bind
  (:map corfu-map ("S-SPC" . corfu-insert-separator))
  :init
  (global-corfu-mode)
  :custom
  (corfu-min-width 50)
  (corfu-max-width 50)
  (corfu-on-exact-match nil)
  (corfu-auto-prefix 4)
  (corfu-separator ?\s)
  (corfu-auto t)
  (corfu-cycle t)
  (corfu-quit-no-match 'separator))

(use-package kind-icon
  :ensure t
  :after corfu
  :custom
  (kind-icon-blend-background t)
  (kind-icon-default-face 'corfu-default) ; only needed with blend-background
  :config
  (add-hook 'after-enable-theme-hook  #'kind-icon-reset-cache)
  (add-to-list 'corfu-margin-formatters #'kind-icon-margin-formatter))

(use-package emacs
  :init
  (setq tab-always-indent 'complete)
  (setq text-mode-ispell-word-completion nil))

(use-package cape
  :ensure t
  :init
  ;; (add-to-list 'completion-at-point-functions #'cape-dabbrev)
  (add-to-list 'completion-at-point-functions #'cape-file)
  (add-to-list 'completion-at-point-functions #'cape-elisp-block))

;; (use-package yasnippet-capf
;;   :after cape
;;   :ensure t
;;   :config
;;   (add-to-list 'completion-at-point-functions #'yasnippet-capf))

(use-package dabbrev
  ;; Swap M-/ and C-M-/
  :bind (("M-/" . dabbrev-completion)
         ("C-M-/" . dabbrev-expand))
  :config
  (add-to-list 'dabbrev-ignored-buffer-regexps "\\` ")
  ;; Since 29.1, use `dabbrev-ignored-buffer-regexps' on older.
  (add-to-list 'dabbrev-ignored-buffer-modes 'doc-view-mode)
  (add-to-list 'dabbrev-ignored-buffer-modes 'pdf-view-mode)
  (add-to-list 'dabbrev-ignored-buffer-modes 'tags-table-mode))

(use-package smartparens
  :ensure t)


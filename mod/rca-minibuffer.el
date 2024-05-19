(use-package vertico
  :ensure (vertico :type git
		   :host github
		   :repo "minad/vertico"
		   :files (:defaults "extensions/*"))
  :init
  (vertico-mode)
  :custom
  (vertico-cicle t)
  (vertico-count 12))

(use-package vertico-directory
  :ensure nil
  :after vertico
  :bind (:map vertico-map
	      ("RET" . vertico-directory-enter)
	      ("DEL" . vertico-directory-delete-char)
	      ("M-DEL" . vertico-directory-delete-word))
  :hook (rfn-eshadow-update-overlay . vertico-directory-tidy))

(use-package orderless
  :ensure t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles
					  basic
					  partial-completion)))))

(use-package marginalia
  :ensure t
  :config
  (marginalia-mode))

(use-package consult
  :ensure t
  :bind (("C-x b" . consult-buffer)
	 ("C-x r b" . consult-bookmark)))

;;  :bind (:map global-map
;;	      ("C-x j" . 'consult-init)))

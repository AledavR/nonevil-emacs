;; Temporal during testing
(setq user-emacs-directory "~/.emacs-no-key/")

(defmacro load-el (el-file)
  `(load (concat user-emacs-directory ,el-file)))

;; External libraries
(load-el "ext/elpaca.el")

;; Personal libraries
(load-el "lib/rca-macros.el")
(load-el "lib/rca-file-defuns.el")
(load-el "lib/rca-list-defuns.el")
(load-el "lib/rca-misc-defuns.el")
(load-el "lib/rca-variables.el")

;; Modules
(load-el "mod/rca-emacs.el")
(load-el "mod/rca-ui.el")
(load-el "mod/rca-dashboard.el")
(load-el "mod/rca-org.el")
(load-el "mod/rca-completion.el")
(load-el "mod/rca-minibuffer.el")
(load-el "mod/rca-hydra.el")
(load-el "mod/rca-magit.el")
(load-el "mod/rca-test.el")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-safe-remote-resources
   '("\\`https://fniessen\\.github\\.io/org-html-themes/org/theme-readtheorg\\.setup\\'")))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

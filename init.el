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

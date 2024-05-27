(use-package hydra
  :ensure t)

(use-package major-mode-hydra
  :ensure t
  :after (hydra)
  :bind
  ("M-SPC" . major-mode-hydra)
  :init
  (major-mode-hydra-define emacs-lisp-mode
    (:color blue :quit-key "q" :title "Emacs Lisp")
    ("Eval"
     (("b" eval-buffer "buffer")
      ("e" eval-defun "defun")
      ("r" eval-region "region"))
     "REPL"
     (("I" ielm "ielm"))
     "Test"
     (("t" ert "prompt")
      ("T" (ert t) "all")
      ("F" (ert :failed) "failed"))
     "Doc"
     (("d" describe-foo-at-point "thing-at-pt")
      ("f" describe-function "function")
      ("v" describe-variable "variable")
      ("i" info-lookup-symbol "info lookup"))))

  (major-mode-hydra-define Buffer-menu-mode
    (:color pink :title "Buffer Menu" :quit-key "q")
    ("Mark"
     (("m" Buffer-menu-mark "mark")
      ("d" Buffer-menu-delete "delete")
      ("D" Buffer-menu-delete-backwards "delete up")
      ("s" Buffer-menu-save "save")
      ("~" Buffer-menu-not-modified "modified"))
     "Unmark"
     (("u" Buffer-menu-unmark "unmark")
      ("U" Buffer-menu-backup-unmark "unmark up"))
     "Actions"
     (("x" Buffer-menu-execute "execute")
      ("b" Buffer-menu-bury "bury")
      ("g" revert-buffer "refresh")
      ("v" Buffer-menu-select "select" :color blue)
      ("o" Buffer-menu-other-window "other-window" :color blue)
      ("T" Buffer-menu-toggle-files-only "files only"
       :toggle Buffer-menu-files-only))
     "Search"
     (("O" Buffer-menu-multi-occur "multi-occur" :color blue)
      ("I" Buffer-menu-isearch-buffers "isearch" :color blue)
      ("R" Buffer-menu-isearch-buffers-regexp "re-isearch" :color blue))))

  (pretty-hydra-define rc/toggles
    (:color amaranth :quit-key "q" :title "Toggles")
    ("Basic"
     (("n" display-line-numbers-mode "line number" :toggle t)
      ("w" whitespace-mode "whitespace" :toggle t)
      ("c" display-fill-column-indicator-mode "column limit" :toggle t)
      ("t" tab-bar-mode :toggle t)
      ;; ("W" whitespace-cleanup-mode "whitespace cleanup" :toggle t)
      ;; ("r" rainbow-mode "rainbow" :toggle t)
      ;; ("L" page-break-lines-mode "page break lines" :toggle t))
      )
     "Highlight"
     (
      ;; ("s" symbol-overlay-mode "symbol" :toggle t)
      ("l" hl-line-mode "line" :toggle t)
      ;; ("x" highlight-sexp-mode "sexp" :toggle t)
      ;; ("t" hl-todo-mode "todo" :toggle t))
      )
     "UI"
     (("d" rc/theme-toggle-light-dark "dark theme"
       :toggle rc/theme-is-dark))
     "Coding"
     (("p" smartparens-mode "smartparens" :toggle t)
      ("P" smartparens-strict-mode "smartparens strict" :toggle t)
      ("S" show-smartparens-mode "show smartparens" :toggle t)
      ("f" flycheck-mode "flycheck" :toggle t))
     "Emacs"
     (("D" toggle-debug-on-error "debug on error"
       :toggle (default-value 'debug-on-error))
      ("X" toggle-debug-on-quit "debug on quit"
       :toggle (default-value 'debug-on-quit)))))

  (global-set-key (kbd "C-z C-t") 'rc/toggles/body)

  (pretty-hydra-define rc/zoom
    (global-map "<f2>" :title nil)
    ("Zoom"
    (("g" text-scale-increase "+")
     ("l" text-scale-decrease "-"))))

  )

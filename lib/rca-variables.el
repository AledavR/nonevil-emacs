(setq default-font "mononoki Nerd Font")

(setq history-excluded-filetypes '(".*gz"
				   ".*pdf"
				   "bookmarks"
				   "recentf"
				   "init.el"
				   ".*gitignore"
				   "early-init.el"
				   ".*log"
				   ".*png"
				   ".*jpg"
				   ".*gif"
				   ".*agenda.org"
				   ".*ideas.org"
				   ".*mod/.*"
				   ".*lib/.*"
				   ".*ext/.*"
				   ".*_db"))

(setq temporal-directory
      (concat user-emacs-directory "temporal/"))

(setq backup-directory
      (concat temporal-directory "saves"))

(setq undo-history-directory
      (concat temporal-directory "undohist"))

(setq recentf-directory
      (concat temporal-directory "recentf"))

(setq config-files-dirs '("" "mod/" "ext/" "lib/"))

(setq banner-images
      (directory-files (concat user-emacs-directory "img/") t ".*g$"))

(setq config-files
      (rc/list-merge-sublists
       (mapcar (lambda (dir)
		 (rc/list-append-str
		  dir (rc/file-get-el
		       (concat user-emacs-directory dir))))
	       config-files-dirs)))

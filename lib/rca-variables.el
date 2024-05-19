(setq default-font "mononoki Nerd Font Mono:style=Regular")
(setq history-excluded-filetypes '(".*gz"
				   ".*pdf"
				   "bookmarks"
				   ".*log"
				   ".*png"
				   ".*jpg"
				   ".*gif"
				   ".*_db"))
(setq temporal-directory
      (concat user-emacs-directory "temporal/"))
(setq backup-directory
      (concat temporal-directory "saves"))
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

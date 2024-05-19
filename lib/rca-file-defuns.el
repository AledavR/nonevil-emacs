(defun config-visit ()
  "Find config file interactively"
  (interactive)
  (message "%s" config-files)
  (find-file (init-dir
	      (completing-read "Select config file: " config-files))))

(defun get-el-files (dir)
  "Get all elisp files from a directory"
  (directory-files dir nil "^[^.].*el$"))


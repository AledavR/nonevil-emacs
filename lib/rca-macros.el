(defmacro init-dir (file)
  `(concat user-emacs-directory ,file))

(defmacro toggle-p (var)
  "Toggles a boolean variable"
  `(if (booleanp ,var) 
       (setq ,var (not ,var))))

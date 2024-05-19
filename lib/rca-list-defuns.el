(defun append-str-to-list (string list &optional position)
  "Appends a string to each element of a list.
If POSITION is nil appends to the beginning of each element."
  (mapcar (lambda (element)
	    (if position
		(concat element string)
	      (concat string element)))
	  list))

(defun merge-sublists (list)
  "Merge all the sublists in a list"
  (let (value)
    (dolist (elt list value)
      (setq value (append value elt)))))


(defun select-random-from-list (items)
  "Selects a random element from a list"
  (let* ((size (length items))
	 (index (random size)))
    (nth index items)))



(defun rc/list-append-str (string list &optional position)
  "Appends a string to each element of a list.
If POSITION is nil appends to the beginning of each element."
  (mapcar (lambda (element)
	    (if position
		(concat element string)
	      (concat string element)))
	  list))

(defun rc/list-merge-sublists (list)
  "Merge all the sublists in a list"
  (let (value)
    (dolist (elt list value)
      (setq value (append value elt)))))

(defun rc/list-select-random (items)
  "Selects a random element from a list"
  (let* ((size (length items))
	 (index (random size)))
    (nth index items)))



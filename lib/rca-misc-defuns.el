(defun rc/time-is-day ()
  (if (< (nth 2 (decode-time (current-time))) 18)
      t nil))

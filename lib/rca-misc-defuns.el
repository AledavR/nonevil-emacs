(defun rc/number-between (number bot top)
  "Determines if a number is within a range"
  (if (< number top)
      (if (> number bot)
	  t nil)
    nil))

(defun rc/time-is-day ()
  "Determines if the current time is considered day"
  (if (rc/number-between
       (nth 2 (decode-time (current-time)))
       8 18)
      t nil))

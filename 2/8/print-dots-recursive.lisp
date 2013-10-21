(defun print-dots-recursive (n)
  (if (> n 0)
      (progn (format t ".")
             (print-dots-recursive (- n 1)))))
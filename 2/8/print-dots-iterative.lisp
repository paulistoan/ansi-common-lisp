(defun print-dots-iterative (n)
  (do ((i 0 (+ i 1)))
      ((>= i n) nil)
    (format t ".")))
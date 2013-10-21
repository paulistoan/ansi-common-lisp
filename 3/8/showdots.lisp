(defun showdots (lst)
  (if (null lst)
      (format t "NIL")
      (progn
        (format t "(~A . " (car lst))
        (showdots (cdr lst))
        (format t ")"))))
(defun my-uncompress (lst)
  (if (null lst)
      nil
      (let ((cur (car lst))
            (next (uncompress (cdr lst))))
        (if (consp cur)
            (append (apply #'my-list-of cur)
                    next)
            (cons cur next)))))

(defun my-list-of (n elt)
  (if (eql n 0)
      nil
      (cons elt (my-list-of (- n 1) elt))))
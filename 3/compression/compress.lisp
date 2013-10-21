(defun my-compress (lst)
  (if (consp lst)
      (my-compr (car lst) 1 (cdr lst))
      lst))

(defun my-compr (elt n lst)
  (if (null lst)
		  (list (my-n-elts elt n))
		  (let ((next (car lst)))
		    (if (eql elt next)
            (my-compr elt (+ 1 n) (cdr lst))
            (cons (my-n-elts elt n)
                  (my-compr next 1 (cdr lst)))))))

(defun my-n-elts (elt n)
  (if (eql n 1)
      elt
      (list n elt)))
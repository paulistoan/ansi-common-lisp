(defun contains-list (lst)
  (if (null lst)
      nil
      (or (listp (car lst))
          (contains-list (cdr lst)))))
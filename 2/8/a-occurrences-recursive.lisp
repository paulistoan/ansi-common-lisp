(defun a-occurrences-recursive (lst)
  (if (null lst)
      0
      (+ (if (eql 'a (car lst))
             1
             0)
         (a-occurrences-recursive (cdr lst)))))
(defun summit-a (lst)
  (apply #'+ (remove nil lst)))

(defun summit-b (lst)
  (if (null lst)
      0
      (let ((x (car lst)))
        (if (null x)
            (summit-b (cdr lst))
            (+ x (summit-b (cdr lst)))))))
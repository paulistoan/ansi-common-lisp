(defun pos-with-recursion-index (index lst)
  (and (consp lst)
       (cons (+ (car lst) index)
             (pos-with-recursion-index
              (+ index 1)
              (cdr lst)))))

(defun pos-with-recursion (lst)
  (pos-with-recursion-index 0 lst))
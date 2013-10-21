(defun diffs-recursive (lst)
  (cond ((null lst) nil)
        ((null (cdr lst)) nil)
        (t (and 
            (eql (- (cadr lst) (car lst)) 1)
            (or
             (null (cddr lst))
             (diffs-recursive (cdr lst)))))))
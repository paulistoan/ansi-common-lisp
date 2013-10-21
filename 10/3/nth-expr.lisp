(defmacro nth-expr (n &rest exprs)
  `(case ,n
     ,@(let ((key 0))
         (mapcar #'(lambda (expr)
                     `(,(incf key) ,expr))
                 exprs))))
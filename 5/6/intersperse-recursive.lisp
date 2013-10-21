(defun intersperse-recursive (obj lst)
           (cond
             ((null lst) nil)
             ((null (cdr lst)) lst)
             (t (cons (car lst)
                      (cons obj
                            (intersperse-recursive obj (cdr lst)))))))
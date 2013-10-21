(defmacro n-of (n expr)
  (let ((x (gensym)))
    `(labels ((repeat (,x)
                (if (zerop ,x)
                    nil
                    (cons ,expr
                          (repeat (- ,x 1))))))
       (repeat ,n))))
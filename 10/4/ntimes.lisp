(defmacro ntimes (n &rest body)
  (let ((x (gensym)))
    `(labels
         ((repeat (,x)
            (when (> ,x 0)
              ,@body
              (repeat (- ,x 1)))))
       (repeat ,n))))
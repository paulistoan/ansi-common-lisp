(defun min-max (lst)
  (let ((l (length lst)))
    (if (zerop l)
        nil
        (let ((v (aref lst 0)))
          (if (eql l 1)
              (values v v)
              (multiple-value-bind (n x)
                  (min-max (subseq lst 1))
                (values
                 (if (< v n) v n)
                 (if (> v x) v x))))))))
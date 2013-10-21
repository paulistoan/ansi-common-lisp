(defun mystery-old (x y)
  (if (null y)
      nil
      (if (eql (car y) x)
          0
          (let ((z (mystery-old x (cdr y))))
            (and z (+ z 1))))))

(defun mystery-new (x y)
  (cond ((null y) nil)
        ((eql (car y) x) 0)
        (t (let ((z (mystery-new x (cdr y))))
             (and z (+ z 1))))))
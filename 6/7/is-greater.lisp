(let (l)
  (defun is-greater (x)
    (let ((res (and (not (null l))
                    (> x l))))
      (setf l x)
      res)))
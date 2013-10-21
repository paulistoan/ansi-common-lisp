(defun new-union (a b)
  (if (null b)
      a
      (let ((cur (car b))
            (rest (cdr b)))
        (if (member cur a)
            (new-union a rest)
            (new-union
             (append a (list cur))
             rest)))))
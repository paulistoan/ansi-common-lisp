(defun precedes-recursive (obj vec)
  (if (< (length vec) 2)
      nil
      (let ((rest (precedes-recursive obj (subseq vec 1)))
            (left (aref vec 0))
            (right (aref vec 1)))
        (if (and 
             (eql right obj) 
             (not (member left rest)))
            (cons left rest)
            rest))))
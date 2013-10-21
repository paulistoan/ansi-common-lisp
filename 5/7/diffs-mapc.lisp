(defun diffs-mapc (lst)
  (let ((l (length lst)))
    (and (> l 1)
           (block b
             (mapc #'(lambda (x y)
                       (if (not (eql (- x y) 1))
                             (return-from b nil)))
                   (subseq lst 1)
                   (subseq lst 0 (- l 1)))
             t))))
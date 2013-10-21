(defun copy-list-with-reduce (lst)
  (reduce #'(lambda (item accum)
              (cons item accum))
          lst
          :initial-value nil
          :from-end t))
(defun reverse-with-reduce (lst)
  (reduce #'(lambda (accum item)
              (cons item accum))
          lst
          :initial-value nil))
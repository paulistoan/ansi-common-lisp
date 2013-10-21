(defun diffs-do (lst)
  (let ((l (length lst)))
    (and (> l 1)
         (do ((i (- l 2) (- i 1))
              (res t))
             ((or (< i 0) (not res)) res)
           (setf res 
                 (and res 
                      (eql (- (nth (+ i 1) lst) 
                              (nth i lst)) 1)))))))
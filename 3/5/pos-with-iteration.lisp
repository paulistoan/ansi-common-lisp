(defun pos-with-iteration (lst)
  (let ((len (length lst)) 
        (result nil))
    (do ((i (- len 1) (- i 1)))
        ((< i 0) result)
      (setf result
            (cons (+ (nth i lst) i)
                  result)))))
(defun make-range (len)
  (let ((result nil))
    (do ((i (- len 1) (- i 1)))
        ((< i 0) result)
      (setf result (cons i result)))))

(defun pos-with-mapcar (lst)
  (mapcar #'+
          lst
          (make-range (length lst))))
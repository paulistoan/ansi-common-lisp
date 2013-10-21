(let ((tbl (make-hash-table)))
  (defun expensive (i)
    (progn (format t "expensive called with ~A~%" i)
           (+ i 10)))
  (defun frugal (i)
    (multiple-value-bind (tv fnd) (gethash i tbl)
      (if fnd
          tv
          (setf (gethash i tbl) (expensive i))))))
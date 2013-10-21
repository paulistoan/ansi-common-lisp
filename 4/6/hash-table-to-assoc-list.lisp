(defun hash-table-to-assoc-list (tbl)
  (let ((lst nil))
    (maphash #'(lambda (k v)
                 (setf lst (cons
                            (cons k v)
                            lst)))
             tbl)
    lst))

;; test
(let ((tbl (make-hash-table)))
  (setf (gethash 'a tbl) 'b)
  (setf (gethash 'c tbl) 'd)
  (setf (gethash 'e tbl) 'f)
  (setf (gethash 'g tbl) 'h)
  (hash-table-to-assoc-list tbl))
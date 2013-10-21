(defun assoc-list-to-hash-table (lst)
  (let ((tbl (make-hash-table)))
    (dolist (entry lst tbl)
      (setf (gethash (car entry) tbl) (cdr entry)))))

;; test
(let ((lst '((a . b) (c . d) (e . f) (g . h))))
           (let ((tbl (assoc-list-to-hash-table lst)))
             (list 
              (gethash 'a tbl)
              (gethash 'c tbl)
              (gethash 'e tbl)
              (gethash 'g tbl)
              (gethash 'b tbl))))
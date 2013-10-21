(defun print-array (arr)
           (destructuring-bind (rows cols) (array-dimensions arr)
             (dotimes (row rows)
               (dotimes (col cols)
                 (format t "~10,2F" (aref arr row col)))
               (terpri))))

; (print-array #2a((2.34 4.56 5.67) (6.789 7.89 8.901) (9.912 3.342 7.31) (4.19 3.142 94.2239)))
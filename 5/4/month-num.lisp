(defconstant month
  #(0 31 59 90 120 151 181 212 243 273 304 334 365))

(defun leap? (y)
  (and (zerop (mod y 4))
       (or (zerop (mod y 400))
           (not (zerop (mod y 100))))))

(defun month-num-old (m y)
  (+ (svref month (- m 1))
     (if (and (> m 2) (leap? y)) 1 0)))

(defun month-num-new (m y)
  (+ (if (and (> m 2) (leap? y)) 1 0)
     (case m
       (1 0) (2 31) (3 59) (4 90)
       (5 120) (6 151) (7 181) (8 212)
       (9 243) (10 273) (11 304) (12 334))))

;; test
(dolist (y (list 1997 1998 1999 2000 2001 2002 2003 2004 2005 2006))
  (dolist (m (list 1 2 3 4 5 6 7 8 9 10 11 12))
    (if (not (eql (month-num-old m y) (month-num-new m y)))
        (format t "m: ~A, y: ~A~%" m y))))

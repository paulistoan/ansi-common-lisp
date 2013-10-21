(defun cons-g (a b)
  (cons b a))

(defun list-g (lst)
  (if (null lst)
      nil
      (cons-g (car lst) (list-g (cdr lst)))))

(defun length-g (lst)
  (if (null lst)
      0
      (+ (length-g (car lst)) 1)))

(defun member-g (elt lst)
  (if (null lst)
      nil
      (if (eql elt (cdr lst))
          lst
          (member-g elt (car lst)))))
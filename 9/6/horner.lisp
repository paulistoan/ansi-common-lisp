(defun horner-iterative (x &rest coeffs)
  (let ((sum 0))
    (dolist (c coeffs sum)
      (setf sum (+ (* x sum) c)))))

(defun calculate (x coeffs)
  ;;; helper function for horner-recursive
  (if (null coeffs)
      0
      (+ (car coeffs) (* x (calculate x (cdr coeffs))))))

(defun horner-recursive (x &rest coeffs)
  (calculate x (reverse coeffs)))
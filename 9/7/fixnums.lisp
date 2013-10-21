(defun bits-for-fixnum ()
  (log (+ (- most-positive-fixnum most-negative-fixnum) 1) 2))
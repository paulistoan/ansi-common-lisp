(defun our-apply (fn lst)
  (let ((*print-base* 8))
    (apply fn lst)))
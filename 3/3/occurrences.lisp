(defun get-totals-count (key totals)
  (let ((entry (assoc key totals)))
    (if (null entry)
        0
        (cdr entry))))

(defun summarize (totals lst)
  (if (null lst)
      totals
      (let ((cur (car lst)))
        (summarize
         (cons 
          (cons cur 
                (+ (get-totals-count cur totals) 1))
          (remove cur totals :key #'car))
         (cdr lst)))))

(defun occurrences (lst)
  (sort (summarize nil lst)
        #'>
        :key #'cdr))
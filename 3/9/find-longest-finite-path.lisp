(defun find-longest-finite-path (net)
  (reverse
   (select-longest
    (mapcar #'(lambda (start)
                (do-search (list start) net))
            (mapcar #'car net)))))

(defun do-search (path net)
  (let ((node (car path)))
    (let ((next-nodes (get-next-nodes node path net)))
      (if (null next-nodes)
          path
          (select-longest (mapcar
                           #'(lambda (next-node) 
                               (do-search (cons next-node path) net))
                           next-nodes))))))

(defun select-longest (paths)
  (let ((match-length 0) (match nil))
    (dolist (path paths match)
      (let ((path-length (length path)))
        (if (> path-length match-length)
            (progn
              (setf match path)
              (setf match-length path-length)))))))

(defun get-next-nodes (start path net)
  (let ((next-nodes (cdr (assoc start net))))
    (dolist (visited path next-nodes)
      (setf next-nodes (remove visited next-nodes)))))

(let ((net '((a b c) (b c) (c d))))
  (find-longest-finite-path net))

(let ((net '((a b c) (b c) (c d e) (e f))))
  (find-longest-finite-path net))

(let ((net '((a b c) (b c) (c d e) (e f g) (g c h) (h i))))
  (find-longest-finite-path net))
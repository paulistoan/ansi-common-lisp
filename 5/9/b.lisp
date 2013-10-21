(defun new-paths (path node end net)
  (let ((new-paths nil) (target nil)
        (next-nodes (cdr (assoc node net))))
    (do ((lst next-nodes (cdr lst)))
        ((or (null lst) target) (values new-paths target))
      (let ((cur (car lst)))
        (if (eql cur end)
            (setf target (reverse (cons cur path)))
            (setf new-paths (cons
                             (cons cur path)
                             new-paths)))))))

(defun bfs (end queue net)
  (if (null queue)
      nil
      (let ((path (car queue)))
        (let ((node (car path)))
          (if (eql node end)
              (reverse path)
              (multiple-value-bind (np target)
                  (new-paths path node end net)
                (or target
                    (bfs end (append (cdr queue) np) net))))))))

(defun shortest-path (start end net)
  (bfs end (list (list start)) net))
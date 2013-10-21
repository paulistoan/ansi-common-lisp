(defun new-paths (path node end net)
  (mapcar #'(lambda (n)
              (let ((res (cons n path)))
                (if (eql n end)
                    (throw 'target (reverse res)))
                res))
          (cdr (assoc node net))))

(defun bfs (end queue net)
  (if (null queue)
      nil
      (let ((path (car queue)))
        (let ((node (car path)))
          (if (eql node end)
              (reverse path)
              (catch 'target
                (bfs end
                     (append (cdr queue)
                             (new-paths path node end net))
                     net)))))))

(defun shortest-path (start end net)
  (bfs end (list (list start)) net))
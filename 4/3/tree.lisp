(defstruct (our-node (:print-function
                      (lambda (n s d)
                        (format s "#<~A>" (our-node-elt n)))))
  elt
  (l nil)
  (c nil)
  (r nil))

(defun our-copy-tree (tree)
  (if (null tree)
      nil
      (make-our-node
       :elt (our-node-elt tree)
       :l (our-copy-tree (our-node-l tree))
       :c (our-copy-tree (our-node-c tree))
       :r (our-copy-tree (our-node-r tree)))))

(let ((tree (make-our-node
             :elt 'a
             :l (make-our-node
                 :elt 'c)
             :c (make-our-node
                 :elt 'b
                 :l (make-our-node
                     :elt 'e)
                 :c (make-our-node
                     :elt 'f)
                 :r (make-our-node
                     :elt 'g))
             :r (make-our-node
                 :elt 'd
                 :r (make-our-node
                     :elt 'h)))))
  (our-copy-tree tree))

(defun our-tree-contains (obj tree)
  (if (null tree)
      nil
      (or
       (eql obj (our-node-elt tree))
       (our-tree-contains obj (our-node-l tree))
       (our-tree-contains obj (our-node-c tree))
       (our-tree-contains obj (our-node-r tree)))))
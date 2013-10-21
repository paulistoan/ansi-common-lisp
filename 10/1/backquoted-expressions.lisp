;;; a)
(let ((x 'a) (y 'b) (z '(c d)))
  `(,z ,x z))

;;; b)
(let ((x 'a) (y 'b) (z '(c d)))
  `(x ,y ,@z))

;;; c)
(let ((x 'a) (y 'b) (z '(c d)))
  `((,@z ,x) z))
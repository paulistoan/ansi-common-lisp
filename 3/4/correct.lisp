(member '(a) '((a) (b)) :key #'car :test #'(lambda (x y) (eql (car x) y)))
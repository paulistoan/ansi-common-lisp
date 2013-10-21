(defmacro our-push (obj lst)
  `(setf ,lst (cons ,obj ,lst)))

;; example seems to only work with clisp
(let ((lst '(a b c)))
  (our-push 'y (and (our-push 'x lst) lst))
  lst)

(let ((lst '(a b c)))
  (push 'y (and (push 'x lst) lst))
  lst)
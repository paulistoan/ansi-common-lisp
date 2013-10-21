(defmacro mapcah (fn lst)
  (let ((gfn (gensym))
        (glst (gensym))
        (i (gensym))
        (l (gensym))
        (res (gensym)))
    `(let* ((,gfn ,fn)
            (,glst ,lst)
            (,l (length ,glst))
            (,res nil))
       (do ((,i 0 (+ ,i 1)))
           ((>= ,i ,l) (nreverse ,res))
         (push (funcall ,gfn (nth ,i ,glst)) ,res)))))
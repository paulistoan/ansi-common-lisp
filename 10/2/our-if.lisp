(defmacro our-if (test then &optional else)
  `(cond (,test ,then)
         (t ,else)))
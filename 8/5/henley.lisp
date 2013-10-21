(defparameter *words* (make-hash-table :size 10000))

(defconstant maxword 100)

(defun is-punc (c)
  (or (char= c #\.) (char= c #\,)
      (char= c #\;) (char= c #\!)
      (char= c #\?)))

(let ((prev '|.|))
  (defun see (symb)
    (let ((pair (assoc symb (gethash prev *words*))))
      (if (null pair)
          (push (cons symb 1) (gethash prev *words*))
          (incf (cdr pair))))
    (setf prev symb)))

(defun visit-words (s visitor)
  (let ((buffer (make-string maxword))
        (pos 0))
    (do ((c (read-char s nil :eof)
            (read-char s nil :eof)))
        ((eql c :eof))
      (if (or (alpha-char-p c) (char= c #\'))
          (progn
            (setf (aref buffer pos) c)
            (incf pos))
          (progn
            (unless (zerop pos)
              (funcall visitor (string-downcase
                                (subseq buffer 0 pos)))
              (setf pos 0))
            (when (is-punc c)
              (funcall visitor (string c))))))
    (unless (zerop pos)
      (funcall visitor (string-downcase
                        (subseq buffer 0 pos)))))
  nil)

(defun read-text (pathname)
  (with-open-file (s pathname :direction :input)
    (visit-words s #'(lambda (x)
                       (see (intern x))))))

(defun random-next (prev)
  (let* ((choices (gethash prev *words*))
         (i (random (reduce #'+ choices
                            :key #'cdr))))
    (dolist (pair choices)
      (if (minusp (decf i (cdr pair)))
          (return (car pair))))))

(defun generate-text (n &optional (prev '|.|))
  (if (zerop n)
      (terpri)
      (let ((next (random-next prev)))
        (format t "~A " next)
        (generate-text (- n 1) next))))

(defun is-valid-word-sequence (s)
  (let ((cur (car s))
        (next (cdr s)))
    (if (null next)
        t
        (multiple-value-bind (words-following found)
            (gethash cur *words*)
          (if (not found)
              nil
              (let ((pair (assoc (car next) words-following)))
                (if (not pair)
                    nil
                    (is-valid-word-sequence next))))))))

(defun is-referenced-as-word-following (w)
  (let ((found nil))
    (maphash #'(lambda (k v)
                 (unless found
                   (setf found (not (null (assoc w v))))))
             *words*)
    found))

(defun is-quote (q)
  (let ((s (make-string-input-stream q))
        (words nil))
    (visit-words s #'(lambda (w)
                       (push (intern w) words)))
    (setf words (nreverse words))
    (let ((l (length words)))
      (case l
        (0 nil)
        (1         (is-referenced-as-word-following (car words)))
        (otherwise (is-valid-word-sequence words))))))

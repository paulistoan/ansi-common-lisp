(defparameter *next-words* (make-hash-table :size 10000))
(defparameter *prev-words* (make-hash-table :size 10000))

(defconstant maxword 100)

(defun punc (c)
  (case c
    (#\. '|.|) (#\, '|,|) (#\; '|;|)
    (#\! '|!|) (#\? '|?|) ))

(let ((prev '|.|))
  (defun see (next)
    (let ((pair (assoc next (gethash prev *next-words*))))
      (if (null pair)
          (push (cons next 1) (gethash prev *next-words*))
          (incf (cdr pair))))
    (let ((pair (assoc prev (gethash next *prev-words*))))
      (if (null pair)
          (push (cons prev 1) (gethash next *prev-words*))
          (incf (cdr pair))))
    (setf prev next)))

(defun read-text (pathname)
  (with-open-file (s pathname :direction :input)
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
                (see (intern (string-downcase
                              (subseq buffer 0 pos))))
                (setf pos 0))
              (let ((p (punc c)))
                (if p (see p))))))
      (unless (zerop pos)
        (see (intern (string-downcase
                      (subseq buffer 0 pos)))))))
  nil)

(defun random-word (ref src)
  (let* ((choices (gethash ref src))
         (i (random (reduce #'+ choices
                            :key #'cdr))))
    (dolist (pair choices)
      (if (minusp (decf i (cdr pair)))
          (return (car pair))))))

(defun random-words (n ref src)
  (if (zerop n)
      nil
      (let ((w (random-word ref src)))
        (cons w (random-words (- n 1) w src)))))

(defun print-word (w)
  (format t "~A " w))

(defun generate-sentence (n src)
  (if (> n 0)
      (let* ((words (- n 1))
             (right-words (floor (/ words 2)))
             (left-words (- words right-words)))
        (mapcar #'print-word
                (nreverse
                 (random-words left-words src *prev-words*)))
        (print-word src)
        (mapcar #'print-word
                (random-words right-words src *next-words*))))
  (terpri))
(defun file-subst (pattern new file1 file2)
  (with-open-file (in file1 :direction :input)
    (with-open-file (out file2 :direction :output
                         :if-exists :supersede)
      (stream-subst pattern new in out))))

(defun stream-subst (pattern new in out)
  (let* ((pos 0)
         (len (length pattern))
         (buf (new-buf len))
         (from-buf nil))
    (do ((c (read-char in nil :eof)
            (or (setf from-buf (buf-next buf))
                (read-char in nil :eof))))
        ((eql c :eof))
      (cond ((funcall (nth pos pattern) c)
             (incf pos)
             (cond ((= pos len)						; 3
                    (princ new out)
                    (setf pos 0)
                    (buf-clear buf))
                   ((not from-buf)				; 2
                    (buf-insert c buf))))
            ((zerop pos)									; 1
             (princ c out)
             (when from-buf
               (buf-pop buf)
               (buf-reset buf)))
            (t														; 4
             (unless from-buf
               (buf-insert c buf))
             (princ (buf-pop buf) out)
             (buf-reset buf)
             (setf pos 0))))
    (buf-flush buf out)))

(defun make-digit-char-matcher ()
  #'(lambda (x) (digit-char-p x)))

(defun make-alphanumeric-char-matcher ()
  #'(lambda (x) (alpha-char-p x)))

(defun make-any-char-matcher ()
  #'(lambda (x) t))

(defun make-specific-char-matcher (c)
  #'(lambda (x) (char= x c)))
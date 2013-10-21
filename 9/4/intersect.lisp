;;; With reference to:
;;; http://geomalgorithms.com/a05-_intersect-1.html

(defstruct (point (:conc-name nil))
  x y)

(defun print-point (p stream depth)
  (format stream "#<~A, ~A>" (x p) (y p)))

(defun subtract (a b)
  (make-point :x (- (x a) (x b))
              :y (- (y a) (y b))))

(defun calculate (pt dv p)
  (make-point :x (+ (x pt) (* p (x dv)))
              :y (+ (y pt) (* p (y dv)))))

(defun intersect (x1 y1 x2 y2 x3 y3 x4 y4)
  (let* ((p0 (make-point :x x1 :y y1))
         (p1 (make-point :x x2 :y y2))
         (q0 (make-point :x x3 :y y3))
         (q1 (make-point :x x4 :y y4))
         (u (subtract p1 p0))
         (v (subtract q1 q0)))
    (unless (zerop (- (* (x u) (y v)) (* (y u) (x v))))
      (let* ((w (subtract p0 q0))
             (si (/ (- (* (y v) (x w)) (* (x v) (y w)))
                    (- (* (x v) (y u)) (* (y v) (x u)))))
             (r (calculate p0 u si)))
        (values (x r) (y r))))))
;;;; ml1-project.lisp

(in-package #:ml1-project)

;;;; Welcome to Portacle, the Portable Common Lisp Environment.
;; For information on Portacle and how to use it, please read
;;   https://portacle.github.io or *portacle-help*
;; To report problems and to get help with issues,  please visit
;;   https://github.com/portacle/portacle/issues
;; Portacle is currently running SLIME , but you can
;;   Switch to SLY
;; You should also configure Portacle with the
;;   First-time setup
;; 
;; You can use this buffer for notes and tinkering with code.
;;
;; https://www.frank-zalkow.de/cl-mlep/usage_examples.html
;; (ql:quickload :mlep)
;;(require 'cl)

;;(require 'mlep ) 
(defun roda ()

  (defun two-dimensional-rand-point (x y deviation)
    (list (mlep:random-from-to (- x deviation) (+ x deviation))
          (mlep:random-from-to (- y deviation) (+ y deviation))))

  (defvar data1 (loop repeat 5 collect (two-dimensional-rand-point 0.0 0.0 0.5)))


  (defvar data2 (loop repeat 5 collect (two-dimensional-rand-point 1.0 1.0 0.5)))


  (defvar class1 (loop repeat 5 collect 0))


  (defvar class2 (loop repeat 5 collect 1))

  (defvar  data (append data1 data2))


  (defvar classes (append class1 class2))

  (defvar unknown (list (two-dimensional-rand-point 0.0 0.0 0.5)
                        (two-dimensional-rand-point 1.0 1.0 0.5)))
  (defvar my-k-nearest (make-instance 'mlep:k-nearest-neighbors :k 2 :data-set data :set-labels classes :test-set unknown))

  (mlep:run my-k-nearest)

  (defvar points nil)

  (loop repeat 3 do (push (two-dimensional-rand-point 0.0 0.0 0.3) points))
  (loop repeat 4 do (push (two-dimensional-rand-point -1.0 -1.0 0.3) points))
  (loop repeat 5 do (push (two-dimensional-rand-point 1.0 1.0 0.3) points))
  points
  (mlep:plot-points points)

  (defvar my-k-means (make-instance 'mlep:k-means :k 3 :data-set points))
  (mlep:run my-k-means :epochs 100)
  (mlep:classify my-k-means)

  )





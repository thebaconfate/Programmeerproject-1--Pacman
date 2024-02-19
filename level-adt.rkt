#lang r5rs

(#%require "constants.rkt" "grid-adt.rkt" "pacman-adt.rkt")
(#%provide make-level-adt)

(define (make-level-adt width height level)
  (let* ((static-grid (make-grid-adt height width))
         (pacman (make-pacman-adt 5 5)))

    (define (draw-pacman! draw-adt)
      ((pacman 'draw!) draw-adt))

    (define (move-pacman! direction)
      ((pacman 'move-with-direction!) direction))

    (define (draw-all! draw-adt)
      (draw-pacman! draw-adt))


    (define (direction? value)
      (or (eq? value 'up)
          (eq? value 'down)
          (eq? value 'left)
          (eq? value 'right)))

    ;; key! :: any -> /
    (define (key! key)
      (cond
        ((direction? key )(move-pacman! key))
        (else (display key))))

    (define (draw! draw-adt)
      (draw-pacman! draw-adt))

    (define (update! delta-time)
      (display "updateing!"))

    (define level-dispatch
      (lambda (message)
        (cond
          ((eq? message 'update!)update!)
          ((eq? message 'draw)draw!)
          ((eq? message 'draw-all!) draw!)
          ((eq? message 'key!) key!))))
    level-dispatch))
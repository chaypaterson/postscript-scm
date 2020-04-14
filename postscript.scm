;;; testing out a Scheme wrapper for PS

(define (space out)
    (display " " out)) ; it's just convenient

(define (move-to posn out)
    (map (lambda (x) (display x out) (space out))
        (reverse (cons "moveto" (reverse posn)))) ; put reverse before posn
    (newline out))

;; draw geometrical shapes:
(define (line start end out)
    (move-to start out)
    (map (lambda (x) (display x out) (space out)) end)
    (map (lambda (x) (display x out) (newline out))
        (list "lineto" "2 setlinewidth" "stroke")))

(define (show-page out)
    (display "showpage" out))

(define (size-page w h out)
    (display "<< /PageSize [" out)
    (display w out) (space out) (display h out)
    (display "] >> setpagedevice" out) (newline out))

; some matrix operations (realised as list operations)

(define (left vect)
    ; rotate a vector +90 deg
    (reverse (map *
        (list 1 -1) vect)))

(define (right vect)
    ;rotate a vector -90 deg
    (reverse (map *
        (list -1 1) vect)))

;; test program:

;(define (test-thunk)
;    (set-font "Courier" 20) ; undefined
;    (move-to (list 72 500))
;    (text "Hello world!") ; undefined
;    (show-page))


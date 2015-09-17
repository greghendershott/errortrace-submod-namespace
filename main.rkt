#lang racket/base

(require syntax/location)

(define (enter mod-path)
  (dynamic-require mod-path #f)
  (module->namespace mod-path))

(module sub/module racket/base
  (define x 42))
(eval 'x (enter (quote-module-path sub/module)))
; => 42

(module* sub/module*/racket/base racket/base
  (define x 42))
(eval 'x (enter (quote-module-path sub/module*/racket/base)))

(module* sub/module*/#f #f
  (define x 42))
(eval 'x (enter (quote-module-path sub/module*/#f)))

;; Equivalently
(module* sub/module+ #f
  (define x 42))
(eval 'x (enter (quote-module-path sub/module+)))

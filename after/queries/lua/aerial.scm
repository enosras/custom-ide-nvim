
; extends

; Captures regular function parameters
(parameters
  (identifier) @name @type
  (#set! "kind" "Parameter"))

; Captures method parameters (including the hidden "self" if you want it)
(method_definition
  (parameters
    (identifier) @name @type
    (#set! "kind" "Parameter")))

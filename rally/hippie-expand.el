;; Hippie expand: I don't really know how hippie-expand works, but I have always
;; been pretty happy with the completion when using ESK, so I have just copied
;; from there for now.
(dolist (f '(try-expand-line try-expand-list try-complete-file-name-partially))
  (delete f hippie-expand-try-functions-list))

(add-to-list 'hippie-expand-try-functions-list 'try-complete-file-name-partially t)

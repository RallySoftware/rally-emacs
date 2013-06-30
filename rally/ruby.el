;; Ruby
(dolist (f '("Gemfile$" "buildfile" "Rakefile$"))
  (add-to-list 'auto-mode-alist `(,f . ruby-mode)))

;; Rails
(when (file-exists-p "~/src/rinari")
  (add-to-list 'load-path "~/src/rinari")
  (require 'rinari))

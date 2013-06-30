;; Clojure
(add-hook 'clojure-mode-hook
          '(lambda ()
             (require 'align-cljlet)
             (define-key clojure-mode-map (kbd "C-M-q") 'align-cljlet)))

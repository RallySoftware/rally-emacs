;; ibuffer mode sets C-x C-f to something less cool than ido
(eval-after-load 'ibuffer
  '(define-key ibuffer-mode-map (kbd "C-x C-f") nil))

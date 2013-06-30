;; Set up paredit keybindings that work in terminal
(eval-after-load 'paredit
  '(progn
     (define-key paredit-mode-map (kbd "C-<up>") 'paredit-splice-sexp-killing-backward)))


;; Set up paredit keybindings that work in terminal
(eval-after-load 'paredit
  '(progn
     (define-key paredit-mode-map (kbd "C-<up>") 'paredit-splice-sexp-killing-backward)))

(defun turn-on-paredit ()
  (paredit-mode t))

(defun esk-paredit-nonlisp ()
  "Turn on paredit mode for non-lisps."
  (interactive)
  (set (make-local-variable 'paredit-space-for-delimiter-predicates)
       '((lambda (endp delimiter) nil)))
  (paredit-mode 1))

(add-hook 'emacs-lisp-mode-hook 'turn-on-paredit)
(add-hook 'clojure-mode-hook    'turn-on-paredit)

(add-hook 'ruby-mode-hook       'esk-paredit-nonlisp)
(add-hook 'espresso-mode-hook   'esk-paredit-nonlisp)
(add-hook 'js-mode-hook         'esk-paredit-nonlisp)



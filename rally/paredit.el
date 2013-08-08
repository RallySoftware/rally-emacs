(defun turn-on-paredit ()
  (paredit-mode t))

(defun esk-paredit-nonlisp ()
  "Turn on paredit mode for non-lisps."
  (interactive)
  (set (make-local-variable 'paredit-space-for-delimiter-predicates)
       '((lambda (endp delimiter) nil)))
  (paredit-mode 1))

;;
;; From http://whattheemacsd.com/setup-paredit.el-02.html
;;
;; Works in all these cases:
;; |(my sexp) ;; in front
;;  (my| sexp) ;; inside
;;  (my sexp)| ;; at the end
(defun paredit--is-at-start-of-sexp ()
  (and (looking-at "(\\|\\[")
       (not (nth 3 (syntax-ppss))) ;; inside string
       (not (nth 4 (syntax-ppss))))) ;; inside comment

(defun paredit-duplicate-closest-sexp ()
  (interactive)
  ;; skips to start of current sexp
  (while (not (paredit--is-at-start-of-sexp))
    (paredit-backward))
  (set-mark-command nil)
  ;; while we find sexps we move forward on the line
  (while (and (bounds-of-thing-at-point 'sexp)
              (<= (point) (car (bounds-of-thing-at-point 'sexp)))
              (not (= (point) (line-end-position))))
    (forward-sexp)
    (while (looking-at " ")
      (forward-char)))
  (kill-ring-save (mark) (point))
  ;; go to the next line and copy the sexprs we encountered
  (paredit-newline)
  (yank)
  (exchange-point-and-mark))

;; 
;; From http://whattheemacsd.com/setup-paredit.el-01.html
;; Like M-( but works from the other side
(defun paredit-wrap-round-from-behind ()
  (interactive)
  (forward-sexp -1)
  (paredit-wrap-round)
  (insert " ")
  (forward-char -1))

(define-key paredit-mode-map (kbd "M-)")
  'paredit-wrap-round-from-behind)

;; Set up paredit keybindings that work in terminal
(eval-after-load 'paredit
  '(progn
     (define-key paredit-mode-map (kbd "C-<up>") 'paredit-splice-sexp-killing-backward)
     ; (define-key paredit-mode-map (kbd "s-d") 'paredit-duplicate-closest-sexp)
     ))


(add-hook 'emacs-lisp-mode-hook 'turn-on-paredit)
(add-hook 'clojure-mode-hook    'turn-on-paredit)

(add-hook 'ruby-mode-hook       'esk-paredit-nonlisp)
(add-hook 'espresso-mode-hook   'esk-paredit-nonlisp)
(add-hook 'js-mode-hook         'esk-paredit-nonlisp)



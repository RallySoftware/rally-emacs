;; General programming mode things

;; Emacs is awsome, except when it comes to indenting code. Sigh.
(defun tabs-mode ()
  (interactive)
  (setq indent-tabs-mode t
        tab-with 4
        js-indent-level 4
        c-indent-level 4))

;; Stuff from ESK, for cleaning up buffers:
(defun untabify-buffer ()
  (interactive)
  (untabify (point-min) (point-max)))

(defun indent-buffer ()
  (interactive)
  (indent-region (point-min) (point-max)))

(defun cleanup-buffer ()
  "Perform a bunch of operations on the whitespace content of a buffer."
  (interactive)
  (indent-buffer)
  (untabify-buffer)
  (delete-trailing-whitespace))

;; Set up buffers for prog-mode. This hook should run when opening any
;; file that contains code (i.e. not plain text)
(defun my-prog-mode-hook ()
  ;; Idle highlight mode - can't live without it.
  (turn-on-idle-hilight)

  (set (make-local-variable 'comment-auto-fill-only-comments) t)
  (auto-fill-mode t))

(add-hook 'prog-mode-hook 'my-prog-mode-hook)

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

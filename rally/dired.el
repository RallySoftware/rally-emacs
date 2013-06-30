(require 'dired-x)
(defun dired-insert-subdir-recursive ()
  (interactive)
  (dired-insert-subdir (dired-get-filename) (concat dired-listing-switches "R")))

(eval-after-load 'dired
  '(progn
     (define-key dired-mode-map (kbd "C-c r") 'dired-insert-subdir-recursive)
     ))

(defun dired-r ()
  (interactive)
  (let ((old-value dired-listing-switches))
    (set-variable 'dired-listing-switches "-lR")
    (ido-dired)
    (set-variable 'dired-listing-switches old-value)))

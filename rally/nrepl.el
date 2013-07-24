(add-hook 'nrepl-mode-hook
          '(lambda ()
             (define-key clojure-mode-map (kbd "C-c z") 'nrepl-switch-to-repl-buffer)))

(defun nrepl-auto-reload ()
  (when (and (member "nrepl-interaction-mode" (get-active-modes))
             (not (string/ends-with (buffer-name) "project.clj")))
    (nrepl-load-current-buffer)))

(defadvice save-buffer (after nrepl-reload-saved-file activate)
  (nrepl-auto-reload))


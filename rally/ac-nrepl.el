;;; Autocomplete
(require 'auto-complete)
(global-auto-complete-mode)

(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'nrepl-mode 'nrepl-interaction-mode))
(add-hook 'nrepl-mode-hook 'ac-nrepl-setup)
(add-hook 'nrepl-interaction-mode-hook 'ac-nrepl-setup)

;; Global Key bindings
(global-set-key (kbd "C-o") 'smart-open-line)

;; Misc:
(global-set-key (kbd "C-S-w")     'make-writable)
(global-set-key (kbd "C-S-k")     'kill-this-buffer)
(global-set-key (kbd "C-x C-k k") 'kill-this-buffer)

(global-set-key (kbd "C-S-f")     'ack-and-a-half) ; doesn't work in terminal
(global-set-key (kbd "C-x C-g")   'ack-and-a-half) ; think "g for grep"
(global-set-key (kbd "C-x M-g")   'ack-and-a-half-same)

(global-set-key (kbd "C-x M-d")   'dired-r)
(global-set-key (kbd "<f8>")      'toggle-truncate-lines)
(global-set-key (kbd "C-x g")     'magit-status)


;; File finding
(global-set-key (kbd "C-x f")   'recentf-ido-find-file)
(global-set-key (kbd "C-c f")   'projectile-find-file)
(global-set-key (kbd "C-c y")   'bury-buffer)
(global-set-key (kbd "C-c r")   'revert-buffer)
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; Completion that uses many different methods to find options.
(global-set-key (kbd "M-/") 'hippie-expand)

;; Turn on the menu bar for exploring new modes
(global-set-key (kbd "C-<f10>") 'menu-bar-mode)

;; Turn paredit on and off easily
(global-set-key (kbd "<f9>") 'paredit-mode)

;; Font size
(define-key global-map (kbd "C-+") 'text-scale-increase)
(define-key global-map (kbd "C--") 'text-scale-decrease)

;; Use regex searches by default.
(global-set-key (kbd "C-s")   'isearch-forward-regexp)
(global-set-key (kbd "C-r")   'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)

;; Jump to a definition in the current file. (This is awesome.)
(global-set-key (kbd "C-x C-i") 'imenu)

;; Help should search more than just commands
(global-set-key (kbd "C-h a") 'apropos)

;; Join the previous line
(global-set-key (kbd "C-x j") 'join-line)

;; Things in isearch
(define-key isearch-mode-map [f1] 'isearch-exit)
(define-key isearch-mode-map [backspace] 'isearch-delete-char)

;; Don't quit by accident
(global-set-key (kbd "C-x C-c") 'maybe-quit)

;;; Unbind ESC ESC ESC from keyboard-escape-quit because it's too easy
;;; to do by accident
(global-set-key (kbd "M-ESC ESC") nil)

;; Key binding ala Intellij
(global-set-key (kbd "s-/") 'comment-or-uncomment-region-or-line)

(global-set-key (kbd "C-S-o")   'move-buffer-to-other-window)
(global-set-key (kbd "C-x M-o") 'move-buffer-to-other-window)



;; Window management - windmove to switch, windsize to resize
(require 'windsize)
(global-unset-key (kbd "<select>"))
(windmove-default-keybindings) ;; Shift+direction
(windsize-default-keybindings) ;; C-S+direction
(global-set-key (kbd "<select>") 'windmove-up)

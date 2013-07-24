;; Window management - windmove to switch, windsize to resize
(global-unset-key (kbd "<select>"))
(windmove-default-keybindings) ;; Shift+direction
(global-set-key (kbd "<select>") 'windmove-up)

(require 'color-theme)
;; Directories for stuff that's not in elpa or marmalade (eg:
;; blackboard):
(add-to-list 'load-path (concat user-emacs-directory "color-themes"))

;; Autoloads for color themes. Note: we have a slightly tweaked
;; version of twilight in the color-themes directory.
(autoload 'color-theme-twilight "color-theme-twilight" nil t)
(autoload 'color-theme-yellow-on-blue "yellow-on-blue-theme" nil t)
(autoload 'color-theme-blackboard "blackboard" nil t)

;; Default to a theme that looks reasonably nice in 256-color
(color-theme-twilight)

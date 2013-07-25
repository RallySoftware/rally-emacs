(let ((is-mac (eq system-type 'darwin)))
  (custom-set-faces
   (if is-mac
       '(default ((t (:inherit nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 139 :width normal :foundry "unknown" :family "Monaco"))))
     '(default ((t (:inherit nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 113 :width normal :foundry "unknown" :family "DejaVu Sans Mono"))))
     )))

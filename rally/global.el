;; The single most important thing in any .emacs file:
(if (fboundp 'set-message-beep)
    (set-message-beep 'silent))
(if (boundp 'ring-bell-function)
    (setq ring-bell-function '(lambda () nil)))

;; gui stuff
(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)
(set-fringe-style 0)
(global-hl-line-mode)

;; The default frame title in emacs is not very useful
(when window-system
  (setq frame-title-format '(buffer-file-name "%f" ("%b")))
  (blink-cursor-mode -1))

;; I finally figured out why opening and saving files was sooooooo
;; slow!!!
(setq vc-handled-backends nil)

;; Use the rectangle selection from cua mode, but not the rest of cua.
(setq cua-enable-cua-keys nil)
(cua-mode t)

;; disable autosave
(setq auto-save-default nil)
(setq make-backup-files nil)

;; Find-File-At-Point - very useful - makes C-x C-f start with a good guess at what you want.
(require 'ffap)

;; Always show the column number along with the line number.
(column-number-mode t)

;; saveplace - Remember place in files
(require 'saveplace)
(setq save-place t)

;; Highlight matching parentheses when the point is on them.
(show-paren-mode 1)

;; Never insert tabs. Tabs are the tool of the devil.
(set-default 'indent-tabs-mode nil)
(set-default 'tab-width 4)

;; Configure various thingies.
(setq inhibit-startup-message t
      shift-select-mode nil
      whitespace-style '(face trailing lines-tail tabs)
      whitespace-line-column 100
      ediff-window-setup-function 'ediff-setup-windows-plain
      backup-directory-alist `(("." . ,(expand-file-name "~/.emacs.d/backups")))
      )

(defun save-buffer-when-modified ()
  (when (buffer-modified-p) (save-buffer)))

;; automatically save buffers associated with files on buffer switch
;; and on windows switch
(defadvice switch-to-buffer (before save-buffer-now activate)
  (when buffer-file-name (save-buffer-when-modified)))
(defadvice other-window (before other-window-now activate)
  (when buffer-file-name (save-buffer-when-modified)))
(defadvice windmove-up (before other-window-now activate)
  (when buffer-file-name (save-buffer-when-modified)))
(defadvice windmove-down (before other-window-now activate)
  (when buffer-file-name (save-buffer-when-modified)))
(defadvice windmove-left (before other-window-now activate)
  (when buffer-file-name (save-buffer-when-modified)))
(defadvice windmove-right (before other-window-now activate)
  (when buffer-file-name (save-buffer-when-modified)))
(defadvice save-buffer (after nrepl-reload-saved-file activate)
  (when (buffer-modified-p) (nrepl-auto-reload)))

;; Activate occur easily inside isearch
(define-key isearch-mode-map (kbd "C-o")
  (lambda () (interactive)
    (let ((case-fold-search isearch-case-fold-search))
      (occur (if isearch-regexp isearch-string (regexp-quote isearch-string))))))

(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

;;Revert a file if the buffer is unmodified and it changes on disk
(global-auto-revert-mode 1)

;; Also auto refresh dired, but be quiet about it
(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose nil)

;; Revert a file if the buffer is unmodified and it changes on disk
(global-auto-revert-mode 1)

;; Also auto refresh dired, but be quiet about it
(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose nil)



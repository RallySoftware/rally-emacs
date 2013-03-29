;; Rally emacs config

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

;; Change where custom settings are stored (I don't want emacs touching my init.el)
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

(let ((is-mac (eq system-type 'darwin)))
  (custom-set-faces
   (if is-mac
       '(default ((t (:inherit nil :stipple nil :background "#0C1021" :foreground "#F8F8F8" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 139 :width normal :foundry "unknown" :family "Monaco"))))
     '(default ((t (:inherit nil :stipple nil :background "#0C1021" :foreground "#F8F8F8" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 113 :width normal :foundry "unknown" :family "DejaVu Sans Mono"))))
     )))

;; I finally figured out why opening and saving files was sooooooo
;; slow!!!
(setq vc-handled-backends nil)

;; Use the rectangle selection from cua mode, but not the rest of cua.
(setq cua-enable-cua-keys nil)
(cua-mode t)

;; http://stackoverflow.com/questions/9435019/how-do-i-source-my-zshrc-within-emacs
(let ((path (shell-command-to-string ". ~/.zshrc; echo -n $PATH")))
  (setenv "PATH" path)
  (setq exec-path
        (append
         (split-string-and-unquote path ":")
         exec-path)))


;; Set up package archives
(require 'package)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
;;(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

;; Function to install a list of packages
(defun ensure-packages-are-installed (packages)
  "Install all the given packages if they aren't installed already."
  (unless package-archive-contents (package-refresh-contents))
  (dolist (package packages)
    (unless (or (member package package-activated-list)
                (functionp package))
      (message "Installing %s" (symbol-name package))
      (package-install package))))


;; List of packages that like to have
(defvar my-packages
  '(
    idle-highlight-mode
    windsize
    expand-region
    multiple-cursors
    markdown-mode

    ruby-mode
    css-mode
    yaml-mode
    sass-mode
    scss-mode
    haml-mode
    inf-ruby
    less-css-mode
    ;;rinari
    coffee-mode

    clojure-mode
    clojure-test-mode
    align-cljlet
    paredit
    nrepl

    auto-complete
    ac-nrepl

    jtags
    scala-mode

    find-file-in-project
    ack-and-a-half
    smex

    color-theme
    color-theme-solarized
    zenburn-theme

    magit

    yasnippet-bundle
    ))

;; Install packages
(ensure-packages-are-installed my-packages)

;;; Clone (or symlink) repos into ~/.emacs.d/checkouts to use the bleeding edge
;;; version. Useful for things like nrepl that move fast.
(defun add-checkouts ()
  (let ((checkouts-dir (expand-file-name (concat user-emacs-directory "checkouts"))))
    (when (file-exists-p checkouts-dir)
      (dolist (d (directory-files-and-attributes checkouts-dir))
        (let ((dirname (car d))
              (is-dir  (car (cdr d))))
          (when (and is-dir (not (equal dirname ".")) (not (equal dirname "..")))
            (add-to-list 'load-path (expand-file-name (concat user-emacs-directory "checkouts/" dirname)))))))))

(add-checkouts)

;;; Autocomplete
(require 'ac-nrepl)
(global-auto-complete-mode)

;; Directories for stuff that's not in elpa or marmalade (eg:
;; blackboard):
(add-to-list 'load-path (concat user-emacs-directory "color-themes"))

;; Autoloads for color themes. Note: we have a slightly tweaked
;; version of twilight in the color-themes directory.
(autoload 'color-theme-twilight "color-theme-twilight" nil t)
(autoload 'color-theme-yellow-on-blue "yellow-on-blue-theme" nil t)
(autoload 'color-theme-blackboard "blackboard" nil t)

;; Default to a theme that looks reasonably nice in 256-color
(require 'color-theme)
(color-theme-twilight)

;;; ffip
(eval-after-load 'find-file-in-project
  '(progn
     (setq ffip-patterns
           '(
             "*.clj"
             "*.css"
             "*.el"
             "*.html"
             "*.java"
             "*.js"
             "*.md"
             "*.org"
             "*.py"
             "*.rb"
             "*.scala"
             "*.sh"
             "*.txt"
             "*.xml"
             ))
     (setq ffip-limit 8192)))


(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)

;; disable autosave
(setq auto-save-default nil)
(setq make-backup-files nil)

;; uniquify - makes sure buffer names are unique in a sensible way.
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;; recentf - Keeps track of recently closed files
(require 'recentf)
(recentf-mode 1)

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


;; ido-mode
(ido-mode t)
(setq ido-enable-prefix nil
      ido-enable-flex-matching t
      ido-auto-merge-work-directories-length nil
      ido-create-new-buffer 'always
      ido-use-filename-at-point 'guess
      ido-use-virtual-buffers nil
      ido-handle-duplicate-virtual-buffers 2
      ido-max-prospects 10)


;; Ruby
(dolist (f '("Gemfile$" "buildfile"))
  (add-to-list 'auto-mode-alist `(,f . ruby-mode)))

;;; Markdown-mode
(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))


;; Emacs is awsome, except when it comes to indenting code. Sigh.
(defun tabs-mode ()
  (interactive)
  (setq indent-tabs-mode t
        tab-with 4
        js-indent-level 4
        c-indent-level 4))


;; Hippie expand: I don't really know how hippie-expand works, but I have always
;; been pretty happy with the completion when using ESK, so I have just copied
;; from there for now.
(dolist (f '(try-expand-line try-expand-list try-complete-file-name-partially))
  (delete f hippie-expand-try-functions-list))

(add-to-list 'hippie-expand-try-functions-list 'try-complete-file-name-partially t)


;; Grep does not ignore class files by default
(eval-after-load 'grep
  '(when (boundp 'grep-find-ignored-files)
     (add-to-list 'grep-find-ignored-files "*.class")))

;; ibuffer mode sets C-x C-f to something less cool than ido
(eval-after-load 'ibuffer
  '(define-key ibuffer-mode-map (kbd "C-x C-f") nil))

;; Cosmetics (copied from ESK)
(eval-after-load 'diff-mode
  '(progn
     (set-face-foreground 'diff-added "green4")
     (set-face-foreground 'diff-removed "red3")))

(eval-after-load 'magit
  '(progn
     (set-face-foreground 'magit-diff-add "green4")
     (set-face-foreground 'magit-diff-del "red3")))



(defun dired-insert-subdir-recursive ()
  (interactive)
  (dired-insert-subdir (dired-get-filename) (concat dired-listing-switches "R")))

(eval-after-load 'dired
  '(progn
     (define-key dired-mode-map (kbd "C-c r") 'dired-insert-subdir-recursive)
     ))


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


;; This looks really useful! I didn't know about it until today.
(defun sudo-edit (&optional arg)
  (interactive "p")
  (if (or arg (not buffer-file-name))
      (find-file (concat "/sudo:root@localhost:" (ido-read-file-name "File: ")))
    (find-alternate-file (concat "/sudo:root@localhost:" buffer-file-name))))


;; Open a recent file
(defun recentf-ido-find-file ()
  "Find a recent file using ido."
  (interactive)
  (let ((file (ido-completing-read "Choose recent file: " recentf-list nil t)))
    (when file
      (find-file file))))

;; For when I open a read-only file, then want to edit it.
(defun make-writable ()
  (interactive)
  (toggle-read-only -1)               ; make it writable
  (chmod (buffer-file-name) #o666))   ; I really just want "+w", but I don't know how to do that


;; Sometimes I want the left buffer on the right and v/v.
(defun swap-buffers ()
  (interactive)
  (let* ((this-buffer (window-buffer))
         (other-window (next-window))
         (other-buffer (window-buffer other-window)))
    (show-buffer other-window this-buffer)
    (show-buffer (other-window 0) other-buffer)))


;; For when I visit a file, and it opens in the wrong window.
(defun move-buffer-to-other-window ()
  (interactive)
  (let ((m (point-marker)))
    (bury-buffer)
    (other-window 1)
    (switch-to-buffer (marker-buffer m))))

(global-set-key (kbd "C-S-o") 'move-buffer-to-other-window)


(defun dired-r ()
  (interactive)
  (let ((old-value dired-listing-switches))
    (set-variable 'dired-listing-switches "-lR")
    (ido-dired)
    (set-variable 'dired-listing-switches old-value)))


(defun turn-on-idle-hilight ()
  (idle-highlight-mode t))

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


;; Clojure
(add-hook 'clojure-mode-hook
          '(lambda ()
             (require 'align-cljlet)
             (define-key clojure-mode-map (kbd "C-M-q") 'align-cljlet)))

(add-hook 'nrepl-mode-hook
          '(lambda ()
             (define-key clojure-mode-map (kbd "C-c z") 'nrepl-switch-to-repl-buffer)))


;; Rails
(when (file-exists-p "~/src/rinari")
  (add-to-list 'load-path "~/src/rinari")
  (require 'rinari))


(defun hide-eol ()
  "Do not show ^M in files containing mixed UNIX and DOS line endings."
  (interactive)
  (setq buffer-display-table (make-display-table))
  (aset buffer-display-table ?\^M []))

(defun look-of-disapproval ()
  (interactive)
  (insert (string-as-multibyte "ಠ_ಠ")))
(global-set-key (kbd "C-x _") 'look-of-disapproval)

;; automatically save buffers associated with files on buffer switch
;; and on windows switch
(defadvice switch-to-buffer (before save-buffer-now activate)
  (when buffer-file-name (save-buffer)))
(defadvice other-window (before other-window-now activate)
  (when buffer-file-name (save-buffer)))
(defadvice windmove-up (before other-window-now activate)
  (when buffer-file-name (save-buffer)))
(defadvice windmove-down (before other-window-now activate)
  (when buffer-file-name (save-buffer)))
(defadvice windmove-left (before other-window-now activate)
  (when buffer-file-name (save-buffer)))
(defadvice windmove-right (before other-window-now activate)
  (when buffer-file-name (save-buffer)))

;; Key bindings

;; Misc:
(global-set-key (kbd "C-S-w")   'make-writable)
(global-set-key (kbd "C-S-k")   'kill-this-buffer)
(global-set-key (kbd "C-S-f")   'ack-and-a-half)
(global-set-key (kbd "C-x M-d") 'dired-r)
(global-set-key (kbd "<f8>")    'toggle-truncate-lines)
(global-set-key (kbd "C-x g")   'magit-status)
(global-set-key (kbd "RET") 'newline-and-indent)

;; Rebind C-<up> for killing backwards
(global-unset-key (kbd "C-<up>"))
(global-set-key (kbd "C-<up>") 'paredit-splice-sexp-killing-backward)

;; Window management - windmove to switch, windsize to resize
(require 'windsize)
(windmove-default-keybindings) ;; Shift+direction
(windsize-default-keybindings) ;; C-S+direction

;; Multiple cursors (mostly so the Sublime junkies can't be too smug)
(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; Other keybindings, mostly taken from ESK (becuase that's what I got used to in my first year of emacs):

;; smex makes M-x better
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)

;; File finding
(global-set-key (kbd "C-x f") 'recentf-ido-find-file)
(global-set-key (kbd "C-c f") 'find-file-in-project)
(global-set-key (kbd "C-c y") 'bury-buffer)
(global-set-key (kbd "C-c r") 'revert-buffer)
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
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "\C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)

;; Jump to a definition in the current file. (This is awesome.)
(global-set-key (kbd "C-x C-i") 'imenu)

;; Help should search more than just commands
(global-set-key (kbd "C-h a") 'apropos)

(global-set-key (kbd "C-c q") 'join-line)


(defun maybe-quit ()
  (interactive)
  (if (yes-or-no-p "Quit Emacs?")
      (save-buffers-kill-terminal)))

(global-set-key (kbd "C-x C-c") 'maybe-quit)

;;; Unbind ESC ESC ESC from keyboard-escape-quit because it's too easy
;;; to do by accident
(global-set-key (kbd "M-ESC ESC") nil)

;; Activate occur easily inside isearch
(define-key isearch-mode-map (kbd "C-o")
  (lambda () (interactive)
    (let ((case-fold-search isearch-case-fold-search))
      (occur (if isearch-regexp isearch-string (regexp-quote isearch-string))))))

(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

(let ((user-init (concat user-emacs-directory "user.init.el")))
  (when (file-exists-p user-init)
    (load-file user-init)))

;; Start the emacs server
(require 'server)
(if (not (server-running-p))
  (server-start))

;;Revert a file if the buffer is unmodified and it changes on disk
(global-auto-revert-mode 1)



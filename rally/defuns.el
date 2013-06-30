;; Load a single package
(defun ensure-package-is-installed (package)
  "Install all the given package if they aren't installed already."
  (unless package-archive-contents (package-refresh-contents))
  (unless (or (member package package-activated-list)
              (functionp package))
    (message "Installing %s" (symbol-name package))
    (package-install package)))

;; For loading libraries from the vendor directory
;; Modified from defunkt's original version to support autoloading.
;; http://github.com/defunkt/emacs/blob/master/defunkt/defuns.el4
;; Order: 
;; - Load from sub-modules directory in vendor/
;; - Load from <library>.el file in vendor/
;; - Load from installed package
(defun vendor (library &rest autoload-functions)
  (let* ((file (symbol-name library))
         (normal (concat "~/.emacs.d/vendor/" file))
         (suffix (concat normal ".el"))
         (personal (concat "~/.emacs.d/rally/" file))
         (found nil))
    (cond
     ((file-directory-p normal) (add-to-list 'load-path normal) (set 'found t))
     ((file-directory-p suffix) (add-to-list 'load-path suffix) (set 'found t))
     ((file-exists-p suffix)  (set 'found t))
     ((ensure-package-is-installed library) (set 'found t)))
    (when found
      (if autoload-functions
          (dolist (autoload-function autoload-functions)
            (autoload autoload-function (symbol-name library) nil t))
        (require library)))
    (when (file-exists-p (concat personal ".el"))
      (load personal))))

;; For when I open a read-only file, then want to edit it.
(defun make-writable ()
  (interactive)
  (toggle-read-only -1)               ; make it writable
  (chmod (buffer-file-name) #o666))   ; I really just want "+w", but I don't know how to do that

(defun get-active-modes ()
  (let ((active-modes))
    (mapc (lambda (mode) (condition-case nil
                             (if (and (symbolp mode) (symbol-value mode))
                                 (add-to-list 'active-modes (prin1-to-string mode)))
                           (error nil)))
          minor-mode-list)
    active-modes))

(defun string/ends-with (s ending)
  "return non-nil if string S ends with ENDING."
  (let ((elength (length ending)))
    (and (>= (length s) elength)
         (string= (substring s (- 0 elength)) ending))))

(defun hide-eol ()
  "Do not show ^M in files containing mixed UNIX and DOS line endings."
  (interactive)
  (setq buffer-display-table (make-display-table))
  (aset buffer-display-table ?\^M []))

(defun look-of-disapproval ()
  (interactive)
  (insert (string-as-multibyte "ಠ_ಠ")))
(global-set-key (kbd "C-x _") 'look-of-disapproval)

;; Comment or uncomment lines and regions. 
(defun comment-or-uncomment-region-or-line ()
    "Comments or uncomments the region or the current line if there's no active region."
    (interactive)
    (let (beg end)
        (if (region-active-p)
            (setq beg (region-beginning) end (region-end))
            (setq beg (line-beginning-position) end (line-end-position)))
        (comment-or-uncomment-region beg end)
        (next-line)))

;; This looks really useful! I didn't know about it until today.
(defun sudo-edit (&optional arg)
  (interactive "p")
  (if (or arg (not buffer-file-name))
      (find-file (concat "/sudo:root@localhost:" (ido-read-file-name "File: ")))
    (find-alternate-file (concat "/sudo:root@localhost:" buffer-file-name))))

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

(defun smart-open-line ()
    "Insert an empty line after the current line.
     Position the cursor at its beginning, according to the current mode."
    (interactive)
    (move-end-of-line nil)
    (newline-and-indent))

(defun maybe-quit ()
  (interactive)
  (if (yes-or-no-p "Quit Emacs?")
      (save-buffers-kill-terminal)))

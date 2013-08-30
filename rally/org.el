(setq org-babel-load-languages (quote 
                                ((emacs-lisp . t) 
                                 (R . t)
                                 (clojure . t)
                                 (python . t)
                                 (latex . t)
                                 (sql . t))))
(setq org-confirm-babel-evaluate nil)
(setq org-src-fontify-natively t)

(add-hook 'org-babel-after-execute-hook 'org-display-inline-images)   
(add-hook 'org-mode-hook 'org-display-inline-images)

;; Patch ob-clojure to work with nrepl
(declare-function nrepl-send-string-sync "ext:nrepl" (code &optional ns))

(require 'ob-clojure)
(defun org-babel-execute:clojure (body params)
  "Execute a block of Clojure code with Babel."
  (require 'nrepl)
  (with-temp-buffer
    (insert (org-babel-expand-body:clojure body params))
    ((lambda (result)
       (let ((result-params (cdr (assoc :result-params params))))
         (if (or (member "scalar" result-params)
                 (member "verbatim" result-params))
             result
           (condition-case nil (org-babel-script-escape result)
             (error result)))))
     (plist-get (nrepl-send-string-sync
                 (buffer-substring-no-properties (point-min) (point-max))
                 (cdr (assoc :package params)))
                :value))))




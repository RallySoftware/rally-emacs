;; Turn off smooth-scrolling during the presentation
(defadvice epresent-run (before epresent-mode activate)
  (ad-deactivate 'previous-line)
  (ad-deactivate 'next-line))

;; Then turn it back on
(defadvice epresent-quit (after epresent-clean-overlays activate)
  (ad-activate 'previous-line)
  (ad-activate 'next-line))


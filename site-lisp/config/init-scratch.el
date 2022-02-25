;;; init-scratch.el --- Settings for *scratch* buffer  -*- lexical-binding: t -*-
;;; Code:
(setq antx/system-type (if (eq system-type 'gnu/linux)
                             "GNU/Linux"
                           (if (eq system-type 'gnu)
                               "GNU Hurd System"
                             (if (eq system-type 'gnu/kfreebsd)
                                 "FreeBSD"
                               (if (eq system-type 'darwin)
                                   "macOS"
                                 (if (or (eq system-type 'windows-nt) (eq system-type 'cygwin))
                                     "Windows"))))))
(setq initial-scratch-message (format ";;; antx Emacs on %s
;; Emacs Startup Time: %.2fs, %s Packages Installed
;; DO NOT start using emacs now, emacs will overload in 0.5s...

" antx/system-type
(float-time (time-subtract after-init-time before-init-time))
(length package-activated-list)
(length features)))

(advice-add #'display-startup-echo-area-message :override #'(lambda () (interactive) (message "Emacs Loaded.")))

(provide 'init-scratch)

;;; init-scratch.el ends here

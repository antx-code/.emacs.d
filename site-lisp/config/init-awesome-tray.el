;;; init-awesome-tray.el --- Settings for awesome tray
;;; Code:
(use-package awesome-tray
  :load-path "~/.emacs.d/site-lisp/extensions/awesome-tray"
  :hook (after-init-hook . awesome-tray-mode)
  :config
  (setq awesome-tray-refresh-idle-delay 0.01)

  (setq awesome-tray-active-modules '("git"
                                      "location"
                                      "mode-name"
                                      "parent-dir"
                                      "buffer-name"
                                      "buffer-read-only"
                                      "date")))

(provide 'init-awesome-tray)

;;; init-awesome-tray.el ends here

;;; init-git.el --- Settings for git  -*- lexical-binding: t -*-

;; Filename: init-git.el
;; Description: Settings for git
;; Author: Antx <wkaifeng2007@163.com> (https://antxrct.space)
;; Maintainer: Antx <wkaifeng2007@163.com> (https://antxrct.space)
;; Copyright (C) 2022, Antx, all rights reserved.
;; Created: 2022-02-25 09:44:12
;; Last-Updated: 2022-02-25 09:44:37
;;           By: Antx
;; URL: https://github.com/antx/.emacs.d/blob/main/site-lisp/config/init-git.el
;; Keywords:
;;
;; Feature that might be required by this library:
;;
;;
;;

;;; This file is NOT part of GNU Emacs

;;; License
;;
;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth
;; Floor, Boston, MA 02110-1301, USA.

;;; Commentary
;;
;; Settings for git
;;

;;; Acknowledgements:
;;
;;
;;

;;; TODO
;;
;;
;;

;;; Require
(require-pkg 'magit)

;;; Code:

(install-pkg 'vc-msg)
(lazy-load-global-keys
 '(("C-' s" . vc-msg-show))
 "vc-msg")

(defun antx/kill-magit (&optional dir)
  (interactive)
  (magit-mode-bury-buffer)
  (unless (null (magit-mode-get-buffers))
    (dolist (buffer (magit-mode-get-buffers))
      (kill-buffer buffer))))
(lazy-load-global-keys
 '(("C-' m" . magit-status))
 "magit")
(define-key magit-mode-map "q" #'antx/kill-magit)

(install-pkg 'diff-hl)
(add-hook 'prog-mode-hook #'(lambda ()
                              (require 'diff-hl)
                              (diff-hl-mode 1)))

(provide 'init-git)

;;; init-git.el ends here

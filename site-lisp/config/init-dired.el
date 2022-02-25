;;; init-dired.el --- Settings for dired  -*- lexical-binding: t -*-

;; Filename: init-dired.el
;; Description: Settings for dired
;; Author: Antx <wkaifeng2007@163.com> (https://antxrct.space)
;; Maintainer: Antx <wkaifeng2007@163.com> (https://antxrct.space)
;; Copyright (C) 2022, Antx, all rights reserved.
;; Created: 2022-02-24 18:33:12
;; Last-Updated: 2022-02-24 18:33:12
;;           By: Antx
;; URL: https://github.com/antx-code/.emacs.d/blob/main/site-lisp/config/init-dired.el
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
;; Settings for dired
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
(require 'dired)
(require 'dired-x)
(require 'dired-details)
(require 'dired-details+)

;;; Code:

(setq dired-recursive-copies t)
(setq dired-recursive-deletes t)
(setq dired-recursive-deletes 'always)
(setq dired-recursive-copies 'always)
(setq dired-listing-switches "-aluh")
(setq dired-details-hidden-string "")
(setq directory-free-space-args "-Pkh")
(setq dired-omit-size-limit nil)
(setq dired-dwim-target t)
(setq my-dired-omit-status t)
(setq my-dired-omit-regexp "^\\.?#\\|^\\..*")
(setq my-dired-omit-extensions '(".cache"))
(add-hook 'dired-after-readin-hook '(lambda ()
                                      (progn
                                        (require 'dired-extension)
                                        (dired-sort-method))))
(add-hook
 'dired-mode-hook
 '(lambda ()
    (require 'dired-extension)
    (dired-omit-method)
    ))
(setq dired-guess-shell-alist-user
      '(
        (list "\\.rar$" "unrar e -ad")
        (list "\\.tar.bz2$" "tar jxvf")
        (list "\\.gz$" "gzip -d")
        (list "\\.exe$" "wine")))

(provide 'init-dired)

;;; init-dired.el ends here

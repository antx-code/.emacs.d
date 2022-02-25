;;; init-auto-save.el --- Settings for auto save  -*- lexical-binding: t -*-

;; Filename: init-auto-save.el
;; Description: Settings for auto save
;; Author: Antx <wkaifeng2007@163.com> (https://antxrct.space)
;; Maintainer: Antx <wkaifeng2007@163.com> (https://antxrct.space)
;; Copyright (C) 2022, Antx, all rights reserved.
;; Created: 2022-02-24 18:16:12
;; Last-Updated: 2022-02-24 18:16:12
;;           By: Antx
;; URL: https://github.com/antx-code/.emacs.d/blob/main/site-lisp/config/init-auto-save.el
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
;; Settings for auto save
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
(require 'auto-save)

;;; Code:

(setq make-backup-files nil           ;; Don't let Emacs make up backup file
      create-lockfiles nil            ;; Don't make lockfile
      auto-save-default nil           ;; Don't auto save the file
      auto-save-list-file-prefix nil) ;; Don't make auto-save-list folder

(auto-save-enable)
(setq auto-save-silent t
      auto-save-delete-trailing-whitespace t)
(setq auto-save-disable-predicates
      '((lambda ()
          (string-suffix-p
           "gpg"
           (file-name-extension (buffer-name)) t))
        ))

(provide 'init-auto-save)

;;; init-auto-save.el ends here

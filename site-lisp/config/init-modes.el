;;; init-modes.el --- Settings for other special modes  -*- lexical-binding: t -*-

;; Filename: init-modes.el
;; Description: Settings for other special modes
;; Author: Antx <wkaifeng2007@163.com> (https://antxrct.space)
;; Maintainer: Antx <wkaifeng2007@163.com> (https://antxrct.space)
;; Copyright (C) 2022, Antx, all rights reserved.
;; Created: 2022-02-25 10:31:12
;; Last-Updated: 2022-02-25 10:31:12
;;           By: Antx
;; URL: https://github.com/antx-code/.emacs.d/blob/main/site-lisp/config/init-modes.el
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
;; Settings for other special modes
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

;;; Code:

;; Hooks
(add-hook 'markdown-mode-hook   'markdown-table-keymap)
(add-hook 'erc-mode-hook        '(lambda () (display-line-numbers-mode -1)))
(add-hook 'emacs-lisp-mode-hook '(lambda () (outline-minor-mode 1) (prettify-symbols-mode 1)))
(add-hook 'web-mode-hook        '(lambda () (outline-minor-mode 1)))

;; Abbrev Mode
;; (abbrev-mode 1)
;; (define-abbrev-table
;;   'global-abbrev-table
;;   '(("myname"  "Antx")
;;     ("myemail" "<wkaifeng2007@163.com>")
;;     ("myblog"  "(https://antxrct.space)")
;;     ("copyr"   "Copyright (C) <+++> Antx")))

(provide 'init-modes)

;;; init-modes.el ends here

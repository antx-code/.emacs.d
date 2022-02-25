;;; init-ace-window.el --- Settings for ace window  -*- lexical-binding: t -*-

;; Filename: init-ace-window.el
;; Description: Settings for ace window
;; Author: Antx <wkaifeng2007@163.com> (https://antxrct.space)
;; Maintainer: Antx <wkaifeng2007@163.com> (https://antxrct.space)
;; Copyright (C) 2022, Antx, all rights reserved.
;; Created: 2022-02-24 18:12:12
;; Last-Updated: 2022-02-24 18:12:12
;;           By: Antx
;; URL: https://github.com/antx-code/.emacs.d/blob/main/site-lisp/config/init-ace-window.el
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
;; Settings for ace window
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

(install-pkg 'ace-window)

(lazy-load-global-keys
 '(("C-' a" . ace-window))
 "ace-window")

(provide 'init-ace-window)

;;; init-ace-window.el ends here

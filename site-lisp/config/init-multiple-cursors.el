;;; init-multiple-cursors.el --- Settings for multiple cursors  -*- lexical-binding: t -*-

;; Filename: init-multiple-cursors.el
;; Description: Settings for multiple cursors
;; Author: Antx <wkaifeng2007@163.com> (https://antxrct.space)
;; Maintainer: Antx <wkaifeng2007@163.com> (https://antxrct.space)
;; Copyright (C) 2022, Antx, all rights reserved.
;; Created: 2022-02-25 10:36:12
;; Last-Updated: 2022-02-25 10:36:13
;;           By: Antx
;; URL: https://github.com/antx-code/.emacs.d/blob/main/site-lisp/config/init-multiple-cursors.el
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
;; Settings for multiple cursors
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

(install-pkg 'multiple-cursors)

(lazy-load-global-keys
 '(("C-M-l" . mc/edit-lines)
   ("C->"   . mc/mark-next-like-this)
   ("C-<"   . mc/mark-previous-like-this))
 "multiple-cursors")

(provide 'init-multiple-cursors)

;;; init-multiple-cursors.el ends here

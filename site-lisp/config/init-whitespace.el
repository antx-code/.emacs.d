;;; init-whitespace.el --- Settings for whitespace  -*- lexical-binding: t -*-

;; Filename: init-whitespace.el
;; Description: Settings for whitespace
;; Author: Antx <wkaifeng2007@163.com> (https://antxrct.space)
;; Maintainer: Antx <wkaifeng2007@163.com> (https://antxrct.space)
;; Copyright (C) 2022, Antx, all rights reserved.
;; Created: 2022-02-25 11:31:12
;; Last-Updated: 2022-02-25 11:31:12
;;           By: Antx
;; URL: https://github.com/antx-code/.emacs.d/blob/main/site-lisp/config/init-whitespace.el
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
;; Settings for whitespace
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
(require 'whitespace)

;;; Code:

(add-hook 'emacs-lisp-mode-hook #'(lambda ()
                                    (whitespace-mode 1)))

(setq whitespace-style
      '(face tabs                     tab-mark
             space-after-tab::space   space-before-tab::space
             indentation::space
             trailing                 empty))
(setq whitespace-display-mappings
      '(;; "tab" char.      Display like "|   ".   Or Display like "\   "
        (tab-mark      9   [124 9]   [92 9])
        ;; " " char.        Display like "·".      Or Display like "_"
        (space-mark    32  [183]     [95])
        ;; "newline" char.  Display like "¬"       Or Display like "¶"
        (newline-mark  10  [172 10]  [182 10])))

(set-face-attribute 'whitespace-tab      nil :foreground "#444444" :background "#686868")
(set-face-attribute 'whitespace-empty    nil :foreground "#cd8c95" :background "#8b5f65")
(set-face-attribute 'whitespace-trailing nil :foreground "#79cdcd" :background "#668b8b")

(provide 'init-whitespace)

;;; init-whitespace.el ends here

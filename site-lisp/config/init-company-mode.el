;;; init-company-mode.el --- Settings for company mode  -*- lexical-binding: t -*-

;; Filename: init-company-mode.el
;; Description: Settings for company mode
;; Author: Antx <wkaifeng2007@163.com> (https://antxrct.space)
;; Maintainer: Antx <wkaifeng2007@163.com> (https://antxrct.space)
;; Copyright (C) 2022, Antx, all rights reserved.
;; Created: 2022-02-24 18:29:12
;; Last-Updated: 2022-02-24 18:29:12
;;           By: Antx
;; URL: https://github.com/antx-code/.emacs.d/blob/main/site-lisp/config/init-company-mode.el
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
;; Settings for company mode
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
(require-pkg 'company)

;;; Code:

(global-company-mode 1)

(setq company-minimum-prefix-length 1
      company-idle-delay 0.1)
(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "C-n") 'company-select-next)
  (define-key company-active-map (kbd "C-p") 'company-select-previous))
(push 'company-capf company-backends)

(require-pkg 'company-c-headers)
(add-to-list 'company-backends 'company-c-headers)

(install-pkg 'company-box)
(add-hook 'company-mode-hook #'(lambda ()
                                 (require 'company-box)
                                 (company-box-mode 1)))

(provide 'init-company-mode)

;;; init-company-mode.el ends here

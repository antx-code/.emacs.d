;;; init-font.el --- Settings for fonts  -*- lexical-binding: t -*-

;; Filename: init-font.el
;; Description: Settings for fonts
;; Author: Antx <wkaifeng2007@163.com> (https://antxrct.space)
;; Maintainer: Antx <wkaifeng2007@163.com> (https://antxrct.space)
;; Copyright (C) 2022, Antx, all rights reserved.
;; Created: 2022-02-24 17:51:12
;; Last-Updated: 2022-02-24 17:51:12
;;           By: Antx
;; URL: https://github.com/antx-code/.emacs.d/blob/main/site-lisp/config/init-font.el
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
;; Settings for fonts
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

(setq antx/en-font-name "Mononoki Nerd Font Mono"
			antx/en-font-style "Regular"
      antx/en-font-size 18)

(setq antx/zh-font-name "WenQuanYi MicroHei Mono"
      antx/zh-font-style "Regular"
      antx/zh-font-size 18)

;; The Quick Brown Fox Jumps Over The Lazy Dog
;; 中英文等宽字体测试 - 敏捷的棕色狐狸跳过懒狗

(progn
  (if (fontp (font-spec
              :name antx/en-font-name
              :style antx/en-font-style
              :size antx/en-font-size))
      (progn
        (set-face-attribute 'default nil
                            :font (font-spec
                                   :name antx/en-font-name
                                   :style antx/en-font-style
                                   :size antx/en-font-size))
        (set-fontset-font t 'han (font-spec
                                  :name antx/zh-font-name
                                  :style antx/zh-font-style
                                  :size antx/zh-font-size))
        (set-fontset-font t ?中 (font-spec
                                 :name antx/zh-font-name
                                 :style antx/zh-font-style
                                 :size antx/zh-font-size))
        (set-fontset-font "fontset-default" ?༼ (font-spec
                                                :name "Noto Serif Tibetan"
                                                :size 0)))
    (message "Can't find %s font. You can install it or ignore this message at init-font.el" antx/en-font-name)))
(provide 'init-font)

;;; init-font.el ends here

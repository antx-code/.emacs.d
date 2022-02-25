;;; init-meow.el --- Settings for meow  -*- lexical-binding: t -*-

;; Filename: init-meow.el
;; Description: Settings for meow
;; Author: Antx <wkaifeng2007@163.com> (https://antxrct.space)
;; Maintainer: Antx <wkaifeng2007@163.com> (https://antxrct.space)
;; Copyright (C) 2022, Antx, all rights reserved.
;; Created: 2022-02-25 10:26:02
;; Last-Updated: 2022-02-25 10:26:25
;;           By: Antx
;; URL: https://github.com/antx-code/.emacs.d/blob/main/site-lisp/config/init-meow.el
;; Keywords:
;;
;; Features that might be required by this library:
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

;;; Commentary:
;;
;; Settings for meow
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
(require-pkg 'meow)

;;; Code:

(meow-global-mode 1)

;; Motions
(defun antx/meow-forward-char ()
  (interactive)
  (when (< (point) (line-end-position))
    (forward-char (abs (prefix-numeric-value nil)))))

(defun antx/meow-backward-char ()
  (interactive)
  (when (> (point) (line-beginning-position))
    (backward-char (abs (prefix-numeric-value nil)))))

(defun antx/meow-forward-char-and-insert ()
  (interactive)
  (antx/meow-forward-char)
  (meow-insert))

(defun antx/meow-insert-at-end ()
  (interactive)
  (end-of-line)
  (meow-insert))

(defun antx/meow-down-5-lines ()
  (interactive)
  (next-line 5))

(defun antx/meow-insert-at-beginning ()
  (interactive)
  (beginning-of-line)
  (meow-insert))

(defun antx/meow-backward-char-and-normal ()
  (interactive)
  (antx/meow-backward-char)
  (meow-insert-exit))

(defun antx/meow-newline-and-insert ()
  (interactive)
  (end-of-line)
  (newline-and-indent)
  (meow-insert))

(defun antx/meow-special-newline ()
  (interactive)
  (newline-and-indent)
  (meow-insert))

(defun antx/meow-newline-up-and-insert ()
  (interactive)
  (beginning-of-line)
  (newline-and-indent)
  (previous-line)
  (indent-for-tab-command)
  (meow-insert))

(defun antx/meow-forward-word ()
  (interactive)
  (forward-word)
  (forward-char))

(defun antx/meow-forward-5-words ()
  (interactive)
  (forward-word 5)
  (forward-char))

(defun antx/meow-up-5-lines ()
  (interactive)
  (previous-line 5))

(defun antx/meow-last-buffer ()
  (interactive)
  (if (region-active-p)
      (deactivate-mark t)
    (meow-last-buffer nil)))

;; Main Function
(defun meow-setup ()
  ;; Basic Layout Set
  (setq meow-cheatsheet-layout meow-cheatsheet-layout-colemak)

  ;; Insert Mode
  (define-key meow-insert-state-keymap (kbd "<escape>") #'antx/meow-backward-char-and-normal)

  ;; Motion Mode
  (meow-motion-overwrite-define-key
   ;; Basic Movement
   '("e" . next-line)
   '("u" . previous-line))

  ;; Normal Mode
  (meow-normal-define-key
   ;; Number Arguments
   '("1" . meow-digit-argument)
   '("2" . meow-digit-argument)
   '("3" . meow-digit-argument)
   '("4" . meow-digit-argument)
   '("5" . meow-digit-argument)
   '("6" . meow-digit-argument)
   '("7" . meow-digit-argument)
   '("8" . meow-digit-argument)
   '("9" . meow-digit-argument)
   '("0" . meow-digit-argument)

   '(":" . counsel-M-x)
   '(";" . counsel-M-x)
   '("/" . swiper)
   '("?" . help-command)
   '("RET" . mark-defun)
   '("DEL" . backward-char)
   '("<escape>" . antx/meow-last-buffer)
   '("a" . antx/meow-forward-char-and-insert)
   '("A" . antx/meow-insert-at-end)
   '("b" . backward-word)
   '("c" . meow-change)
   '("C" . meow-change-save)
   '("d" . meow-kill)
   '("e" . next-line)
   '("E" . antx/meow-down-5-lines)
   '("C-e" . scroll-up-command)
   '("f" . eval-defun)
   '("g" . meow-keyboard-quit)
   '("G" . goto-line)
   '("h" . help-command)
   '("i" . antx/meow-forward-char)
   '("I" . end-of-line)
   '("j" . eval-buffer)
   '("k" . meow-insert)
   '("K" . antx/meow-insert-at-beginning)
   '("l" . undo-only)
   '("L" . undo-tree-visualize)
   '("m" . eval-region)
   '("n" . antx/meow-backward-char)
   '("N" . beginning-of-line)
   '("o" . antx/meow-newline-and-insert)
   '("O" . antx/meow-newline-up-and-insert)
   '("C-o" . antx/meow-special-newline)
   '("p" . yank)
   '("q" . kmacro-start-macro)
   '("Q" . kill-current-buffer)
   '("C-q" . kmacro-end-or-call-macro)
   '("r" . query-replace)
   '("s" . meow-search)
   '("S" . save-buffer)
   '("t" . eval-last-sexp)
   '("u" . previous-line)
   '("U" . antx/meow-up-5-lines)
   '("C-u" . scroll-down-command)
   '("v" . set-mark-command)
   '("V" . mark-line)
   '("w" . antx/meow-forward-word)
   '("W" . antx/meow-forward-5-words)
   '("x" . meow-delete)
   '("y" . kill-ring-save)
   '("z" . meow-cheatsheet))

  ;; Leader Key
  ;; Prefix Commands
  (define-prefix-command 'meow-g-command)
  (define-prefix-command 'meow-q-command)
  (define-prefix-command 'meow-t-command)
  (define-prefix-command 'meow-w-command)
  (define-prefix-command 'meow-u-command)
  (meow-leader-define-key
   ;; Basic
   '("f" . counsel-find-file)
   '("g" . meow-g-command)
   '("gg" . beginning-of-buffer)
   '("gf" . xref-find-definitions)
   '("G" . end-of-buffer)
   '("Q" . emacs-session-save)

   ;; Functions
   '("q"  . meow-q-command)
   '("qc" . open-config-folder)
   '("qC" . open-require-file)
   '("qa" . set-alpha)
   '("qs" . antx/open-scratch)
   '("qT" . antx/add-todo-in-code)
   '("qi" . antx/change-indent-type)
   '("qp" . antx/provide-feature-name)
   '("qt" . antx/insert-current-date-time)
   '("qu" . antx/upgrade-modules)
   '("q TAB" . antx/open-erc)
   '("q SPC" . antx/format-commit)

   ;; Buffer
   '("t"  . meow-t-command)
   '("ts" . counsel-switch-buffer)
   '("tk" . kill-buffer)

   ;; Window
   '("w"  . meow-w-command)
   '("w1" . delete-other-windows)
   '("w2" . split-window-below)
   '("w3" . split-window-right)
   '("w0" . delete-window)
   '("wo" . other-window)

   ;; Useful
   '("u"  . meow-u-command)
   '("uf" . mark-defun)
   '("ul" . undo)
   '("ur" . query-replace)
   '("ue" . eshell)
   '("up" . list-processes)
   '("ug" . goto-line)
   '("ua" . align-regexp)

   ;; Plugins
   ;; Magit
   '("m" . magit-status)

   ;; Evil Nerd Commenter
   '("c" . evilnc-comment-or-uncomment-lines)
   ))

(setq meow-cursor-type-insert '(bar . 2))

(setq meow-esc-delay 0.001)

(meow-setup)

(provide 'init-meow)

;;; init-meow.el ends here

;;; init-function.el --- Settings for functions  -*- lexical-binding: t -*-

;; Filename: init-function.el
;; Description: Settings for functions
;; Author: Antx <wkaifeng2007@163.com> (https://antxrct.space)
;; Maintainer: Antx <wkaifeng2007@163.com> (https://antxrct.space)
;; Copyright (C) 2022, Antx, all rights reserved.
;; Created: 2022-02-24 18:43:12
;; Last-Updated: 2022-02-24 18:43:12
;;           By: Antx
;; URL: https://github.com/antx-code/.emacs.d/blob/main/site-lisp/config/init-function.el
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
;; Settings for functions
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

(defun open-config-folder ()
  "Open the config file in the site-lisp/config folder."
  (interactive)
  (counsel-find-file antx-emacs-root-dir))

(defun open-require-file ()
  "Open init.el"
  (interactive)
  (find-file (concat antx-emacs-config-dir "/init.el")))

(defun set-alpha (var)
  "Set the backgroud alpha by VAR."
  (interactive "sAlpha or not(y-or-n): ")
  (pcase var
    ("y" (set-frame-parameter nil 'alpha '(90  . 100)))
    ("n" (set-frame-parameter nil 'alpha '(100 . 100)))))

(defun antx/open-scratch ()
  "Open the scratch buffer after closing it."
  (interactive)
  (switch-to-buffer "*scratch*")
  (insert initial-scratch-message)
  (message "[Antx Emacs] Open the scratch action done."))

(defun antx/open-erc ()
  "Open the erc with only one time."
  (interactive)
  (let ((erc-file-path
         (expand-file-name (locate-user-emacs-file
                            "erc-userinfo"))))
    (if (file-exists-p erc-file-path)
        (let ((user-info
               (with-temp-buffer (insert-file-contents
                                  erc-file-path)
                                 (split-string (buffer-string)
                                               "\n" t))))
          (erc :nick (car user-info) :password (nth 1 user-info)))
      (let ((user-name (read-string "[Antx Emacs] ERC Nick: "))
            (user-password (read-passwd "[Antx Emacs] ERC Password: "))
            save-y-or-n)
        (if (or (string= user-name "")
                (string= user-password ""))
            (error "[Antx Emacs] The user name or password can't be null!")
          (setq save-y-or-n (read-minibuffer
                             "[Antx Emacs] Do you want to save your ERC user info? (y-or-n): "
                             "y"))
          (when (string= save-y-or-n "y")
            (with-temp-file erc-file-path
              (insert (format "%s\n" user-name))
              (insert (format "%s" user-password))))
          (erc :nick user-name :password user-password))))))

(defun antx/add-todo-in-code ()
  "Add todo content in code."
  (interactive)
  (if (eq major-mode 'emacs-lisp-mode)
      (progn
        (comment-dwim nil)
        (let ((todo-content (read-string "[Antx Emacs] Enter your todo content: ")))
          (insert (format "<TODO(Antx)> %s [%s]" todo-content (current-time-string)))))
    (message "[Antx Emacs] Not in emacs-lisp-mode.")))

(defun antx/kill-unwanted-buffers ()
  "Kill unwanted buffers for me."
  (interactive)
  (progn
    (kill-buffer "*Help*")
    (kill-buffer "*Backtrace*")))

(defun antx/search-engine ()
  "Open search page by eaf-browser."
  (interactive "M[Antx Emacs] The text you want to search: ")
  (eaf-open-browser (concat "https://cn.bing.com/search?q=" content)))

(defun antx/change-indent-type (type)
  "Change the indent type."
  (interactive (list (completing-read "[Antx Emacs] Enter the indent type: "
                                      '("tab" "space"))))
  (pcase type
    ("tab" (setq-local indent-tabs-mode t))
    ("space" (setq-local indent-tabs-mode nil))))

(defun antx/provide-feature-name ()
  "Provide feature name automaticly."
  (interactive)
  (if (eq major-mode 'emacs-lisp-mode)
      (insert (format "(provide '%s)" (car (split-string (buffer-name) ".el"))))
    (message "[Antx Emacs] Not in emacs-lisp-mode. Exiting.")))

(defun antx/insert-current-date-time ()
  "Insert current date time at point."
  (interactive)
  (insert (format-time-string "%Y-%m-%d %H:%M:%S")))

(defun antx/upgrade-modules ()
  "Upgrade modules in `antx-emacs-root-dir' git repository."
  (interactive)
  (async-shell-command (concat "cd " antx-emacs-root-dir " && git submodule foreach git pull")))

(defun antx/format-commit ()
  "Git commit with formatted text."
  (interactive)
  (setq antx/git-commit-type (completing-read "[Antx Emacs] Commit Type: "
                                                '("add" "modify" "remove" "feat" "style" "fix" "module" "rename")))
  (setq antx/git-commit-files (read-from-minibuffer "[Antx Emacs] Commit Files: "))
  (setq antx/git-commit-content (read-from-minibuffer "[Antx Emacs] Commit Content: "))
  (insert (concat antx/git-commit-type
                  "("
                  antx/git-commit-files
                  "): "
                  antx/git-commit-content))
  (message "[Antx Emacs] Action done."))

(provide 'init-function)

;;; init-function.el ends here

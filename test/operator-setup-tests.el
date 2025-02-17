;;; operator-setup-tests.el --- operator-mode tests  -*- lexical-binding: t; -*-

;; Copyright (C) 2018-2022 Andreas Röhler

;; Author: Andreas Röhler <andreas.roehler@easy-emacs.de>
;; Keywords: convenience

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;;

;;; Code:

(require 'ert-x)
;; (require 'python)
(require 'operator-mode)

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; (straight-use-package 'php-mode)
;; (require 'php-mode)

(defmacro operator-test (contents mode debug &rest body)
  "Create temp buffer inserting CONTENTS.

BODY is code to be executed within the temp buffer "
  (declare (indent 1) (debug t))
  `(with-temp-buffer
     (let (hs-minor-mode)
       (insert ,contents)
       (funcall ,mode)
       (when ,debug
	 (switch-to-buffer (current-buffer))
	 (save-excursion (font-lock-fontify-region (point-min)(point-max)))
       ,@body))
  ;; (sit-for 0.1)
  ))

(defmacro operator-test-point-min (contents mode debug &rest body)
  "Create temp buffer inserting CONTENTS.
BODY is code to be executed within the temp buffer.  Point is
 at the beginning of buffer."
  (declare (indent 1) (debug t))
  `(with-temp-buffer
     (let (hs-minor-mode)
       (funcall ,mode)
       (insert ,contents)
       (goto-char (point-min))
       (when ,debug
	 (switch-to-buffer (current-buffer))
	 (save-excursion (font-lock-fontify-region (point-min)(point-max))))
       ,@body)))

;; (ert-simulate-command (cons self-insert-command))

(provide 'operator-setup-tests)
;;; operator-setup-tests.el ends here

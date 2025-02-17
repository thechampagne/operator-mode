;;; operator-org-mode-test.el --- operator org-mode tests  -*- lexical-binding: t; -*-

;; Copyright (C) 2019-2022  Andreas Röhler

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
(require 'operator-setup-tests)

(ert-deftest operator-org-mode-test-b28znx ()
  (operator-test
      "* asdf,"
    'org-mode
    operator-mode-debug
    (goto-char (point-max))
    (skip-chars-backward " \t\r\n\f")
    (operator-do)
    (should (eq (char-before) 32))
    (should (eq (char-before (1- (point))) ?,))
    ))

(ert-deftest operator-org-mode-test-S6g9jV ()
  (operator-test
      "*asdf,"
    'org-mode
    operator-mode-debug
    (goto-char (point-max))
    (search-backward "a")
    (operator-do)
    (should (eq (char-before) 32))
    (should (eq (char-before (1- (point))) ?*))
    ))

(ert-deftest operator-org-mode-test-ofyLzj ()
  (operator-test
      "*?"
    'org-mode
    operator-mode-debug
    (goto-char (point-max))
    (operator-do)
    (should (eq (char-before) 32))
    (should (eq (char-before (1- (point))) ??))
    (should (eq (char-before (- (point) 2)) 32))
    ))

(provide 'operator-org-mode-test)
;;; operator-org-mode-test.el ends here

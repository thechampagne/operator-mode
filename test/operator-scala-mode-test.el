;;; operator-scala-mode-test.el --- scala-mode tests  -*- lexical-binding: t; -*-

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

(require 'ert-x)
(require 'operator-mode)
(require 'operator-setup-tests)

(straight-use-package 'scala-mode nil nil)
(require 'scala-mode)

(ert-deftest operator-scala-test-QxYnli ()
  (operator-test
      ;; map { y => (x, y) -> x * y })
      "map { y = >"
    'scala-mode
    operator-mode-debug
    (goto-char (point-max))
    (operator-do)
    (should (char-equal (char-before) 32))
    (should (char-equal (char-before (- (point) 2)) ?=))
))

(ert-deftest operator-scala-test-esLbyl ()
  (operator-test
      ;; map { y => (x, y) -> x * y })
      "map { y => (x,"
    'scala-mode
    operator-mode-debug
    (goto-char (point-max))
    (operator-do)
    (should (char-equal (char-before) 32))
    (should (char-equal (char-before (- (point) 2)) ?x))
))

(ert-deftest operator-scala-test-DtQE9A ()
  (operator-test
      ;; map { y => (x, y) -> x * y })
      "map { y => (x, y)"
    'scala-mode
    operator-mode-debug
    (goto-char (point-max))
    (operator-do)
    (should (char-equal (char-before) 32))
    (should (char-equal (char-before (- (point) 2)) ?y))
))

(ert-deftest operator-scala-test-QQXqal ()
  (operator-test
      ;; map { y => (x, y) -> x * y })
      "map { y => (x, y) -"
    'scala-mode
    operator-mode-debug
    (goto-char (point-max))
    (search-backward "-")
    (forward-char 1)
    (operator-do)
    (should (char-equal (char-before) 32))
    (should (char-equal (char-before (- (point) 2)) 32))
))

(ert-deftest operator-scala-test-4eRSsr ()
  (operator-test
      ;; map { y => (x, y) -> x * y })
      "map { y => (x, y) ->"
    'scala-mode
    operator-mode-debug
    (goto-char (point-max))
    (operator-do)
    (should (char-equal (char-before) 32))
    (should (char-equal (char-before (- (point) 2)) ?-))
))

(ert-deftest operator-scala-test-WG0LXr ()
  (operator-test
      ;; map { y => (x, y) -> x * y })
      "map { y => (x, y) -> x*y })"
    'scala-mode
    operator-mode-debug
    (goto-char (point-max))
    (search-backward "y")
    (operator-do)
    (should (char-equal (char-before) 32))
    (should (char-equal (char-before (- (point) 2)) 32))
))

(ert-deftest operator-scala-test-rC3gMh ()
  (operator-test
      "def summ(list:"
    'scala-mode
    operator-mode-debug
    (goto-char (point-max))
    (search-backward ":")
    (forward-char 1)
    (operator-do)
    (should (char-equal (char-before) 32))
    (should (char-equal (char-before (- (point) 2)) ?t))))

(ert-deftest operator-scala-test-AodEpd ()
  (operator-test
      ;; "if (list.isEmpty)"
      "if (list."
    'scala-mode
    operator-mode-debug
    (goto-char (point-max))
    ;; (search-backward "i")
    (operator-do)
    (should (char-equal (char-before) ?.))
    (should (char-equal (char-after) ?i))))

(ert-deftest operator-scala-test-9mRanL ()
  (operator-test
      " { case list."
    'scala-mode
    operator-mode-debug
    (operator-do)
    (should (char-equal (char-before) ?.))
    (should (char-equal (char-after) ?t))))

(ert-deftest operator-scala-test-lnfWry ()
  (operator-test
      "if (!args.isEmpty)"
    'scala-mode
    operator-mode-debug
    (operator-do)
    (should (char-equal (char-before) 41))
    (should (char-equal (char-before (1- (point))) ?y))))

(ert-deftest operator-scala-test-YkkZEa ()
  "ThisBuild / version := \"0.1.0-SNAPSHOT\"
ThisBuild / scalaVersion := \"2.13.10\"
lazy val root = (project in file(\".\"))
  .settings(name := \"\"\"muster4\"\"\")
"
  (operator-test
"lazy val root = (project in file(\".\"))
  .settings(name:
"
    'scala-mode
    (goto-char (point-max))
    (search-backward ":")
    (forward-char 1)
    operator-mode-debug
    (operator-do)
    (should (char-equal (char-before) 32))
    (should (char-equal (char-before (1- (point))) ?:))
))

(ert-deftest operator-scala-test-716twd ()
  (operator-test
      "import org.scalatest.{BeforeAndAfterAll,"
    'scala-mode
    (goto-char (point-max))
    (search-backward ",")
    (forward-char 1)
    operator-mode-debug
    (operator-do)
    (should (char-equal (char-before) 32))
    (should (char-equal (char-before (1- (point))) ?,))
    (should (char-equal (char-before (- (point) 2)) ?l))
))

(ert-deftest operator-scala-test-0FgiaA ()
  (operator-test
      "object HelloWorld {
  def main(args: Array[String]): Unit =
}
"
    'scala-mode
    (goto-char (point-max))
    (search-backward "=")
    (forward-char 1)
    operator-mode-debug
    (operator-do)
    (should (char-equal (char-before) 32))
    (should (char-equal (char-before (1- (point))) ?=))
    (should (char-equal (char-before (- (point) 2)) 32))
    (should (char-equal (char-before (- (point) 3)) ?t))
    ))

(ert-deftest operator-scala-test-DWfHzU ()
  (operator-test
      "try {
  val f = new FileReader(\"input.txt\")
  // Use and close file
} catch {
  case ex: FileNotFoundException => // Handle missing file
  case ex: IOException => // Handle other I/O error
}
"
    'scala-mode
    (goto-char (point-max))
    (search-backward ":")
    (forward-char 1)
    operator-mode-debug
    (operator-do)
    (should (char-equal (char-before) 32))
    (should (char-equal (char-before (1- (point))) ?:))
    (should (char-equal (char-before (- (point) 2)) ?x))
    ))

(ert-deftest operator-scala-test-J3TTm1 ()
  (operator-test
      "val firstArg = if (args.length > 0) args(0) else \"\"
firstArg match {
  case \"salt\" => println(\"pepper\")
  case \"chips\" => println(\"salsa\")
  case \"eggs\" => println(\"bacon\")
  case _ =
}
"
    'scala-mode
    (goto-char (point-max))
    (search-backward "=")
    (forward-char 1)
    operator-mode-debug
    (operator-do)
    (should (char-equal (char-before) 32))
    (should (char-equal (char-before (1- (point))) ?=))
    (should (char-equal (char-before (- (point) 2)) 32))
    ))

(provide 'operator-scala-mode-test)
;;; operator-scala-mode-test.el ends here

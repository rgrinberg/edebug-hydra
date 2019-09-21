;;; edebug-hydra.el --- hydra interface for edebug -*- lexical-binding: t; -*-

;; Author: Rudi Grinberg <rudi.grinberg@gmail.com>
;; URL: http://github.com/rgrinberg/edebug-hydra
;; Version: 0.0.1
;; Keywords: hydra, edebug
;; Package-Requires: ((hydra "0.15.0"))

;;; Commentary:
;; A hydra based interface for edebug

;;; Code:

(require 'hydra)

;;;###autoload (autoload 'hydra-edebug/body "edebug-hydra" nil t)
(defhydra hydra-edebug (:hint t :foreign-keys run)

  ("q" nil "quit")
  ("b" #'edebug-backtrace "backtrace" :column "common")
  ("-" #'negative-argument "neg argument" :column "common")

  ;; breaking
  ("I" #'edebug-instrument-callee "instrument callee" :column "break")
  ("x" #'edebug-set-breakpoint "set breakpoint" :column "break")
  ("X" #'edebug-unset-breakpoint "unset breakpoint" :column "break")
  ("N" #'edebug-next-breakpoint "next breakpoint" :column "break")
  ("c" #'edebug-set-conditional-breakpoint "conditional bp" :column "break")
  ("C" #'edebug-set-global-break-condition "global conditional bp"
   :column "break")

  ;; navigation
  ("w" #'edebug-where "where" :column "common")
  ("z" #'edebug-bounce-point "bounce point" :column "common")

  ;; stepping
  ("h" #'edebug-goto-here "continue until point" :column "step")
  ("s" #'edebug-stop "stop" :column "step")
  ("o" #'edebug-step-out "step out" :column "step")
  ("i" #'edebug-step-in "step in" :column "step")
  ("f" #'edebug-forward "forward" :column "step")

  ;; sexp oriented
  ("l" #'edeug-forward-sexp "forward sexp" :column "sexp")
  ("e" #'edebug-eval-expression "eval expression" :column "sexp")
  ("E" #'edebug-eval-last-sexp "eval expression" :column "sexp")
  ("r" #'edebug-previous-result "previous result" :column "sexp")
  (";" #'edebug-visit-eval-list "visit eval list" :column "sexp")

  ;; exiting
  ("Q" #'edebug-top-level-nonstop "toplevel non stop" :column "common")
  ("S" #'edebug-stop "edebug stop" :column "common")

  ;; modes
  ("1" #'edebug-Go-nonstop-mode "go nonstop" :column "modes")
  ("2" #'edebug-go-mode "go until break" :column "modes")
  ("3" #'edebug-step-mode "step mode" :column "modes")
  ("4" #'edebug-next-mode "next mode" :column "modes")
  ("5" #'edebug-continue-mode "continue" :column "modes")
  ("6" #'edebug-Continue-fast-mode "continue fast" :column "modes")
  ("7" #'edebug-trace-mode "trace" :column "modes")
  ("8" #'edebug-Trace-fast-mode "trace fast" :column "modes"))

;; Local Variables:
;; outline-regexp: ";;\\([;*]+ [^\s\t\n]\\|###autoload\\)\\|("
;; indent-tabs-mode: nil
;; End:

(provide 'edebug-hydra)

;;; edebug-hydra.el ends here

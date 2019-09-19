;;; edebug-hydra.el --- hexpressionydra interface for edebug -*- lexical-binding: t; -*-

;;; code

;;;###autoload
(defhydra hydra-edebug (:hint t)
  "
Break: _I_instrument callee _x_ breakpoint here
Navigation: _w_here _z_:point
Step: _s_top step _o_ut
"

  ("q" nil :exit t)
  ("b" #'edebug-backtrace "backtrace")
  ("-" #'negative-argument "neg argument")

  ;; breaking
  ("I" #'edebug-instrument-callee "instrument callee")
  ("x" #'edebug-set-breakpoint "set breakpoint")
  ("X" #'edebug-unset-breakpoint "unset breakpoint")
  ("N" #'edebug-next-breakpoint "next breakpoint")
  ("c" #'edebug-set-conditional-breakpoint "conditional bp")
  ("C" #'edebug-set-global-break-condition "global conditional bp")

  ;; navigation
  ("w" #'edebug-where "where")
  ("z" #'edebug-bounce-point "bounce point")

  ;; stepping
  ("h" #'edebug-goto-here "continue until point")
  ("s" #'edebug-stop "stop")
  ("o" #'edebug-step-out "step out")
  ("i" #'edebug-step-in "step in")
  ("f" #'edebug-forward "forward")

  ;; sexp oriented
  ("l" #'edeug-forward-sexp "forward sexp")
  ("e" #'edebug-eval-expression "eval expression")
  ("E" #'edebug-eval-last-sexp "eval expression")
  ("r" #'edebug-previous-result "previous result")
  (";" #'edebug-visit-eval-list "visit eval list")

  ;; exiting
  ("Q" #'edebug-top-level-nonstop "toplevel non stop")
  ("S" #'edebug-stop "edebug stop")

  ;; modes
  ("1" #'edebug-Go-nonstop-mode "go nonstop")
  ("2" #'edebug-go-mode "go until break")
  ("3" #'edebug-step-mode "step mode")
  ("4" #'edebug-next-mode "next mode")
  ("5" #'edebug-continue-mode "continue")
  ("6" #'edebug-Continue-fast-mode "continue fast")
  ("7" #'edebug-trace-mode "trace")
  ("8" #'edebug-Trace-fast-mode "trace fast"))

(provide 'edebug-hydra)
;;; edebug-hydra.el ends here

;;; praat-script-mode.el --- Praat scripting language

;; Author: Stefano Coretta <stefano.coretta@gmail.com>
;; Created: 2021-05-22
;; Version: 0.1.0 2021-05-22
;;
;; Keywords: praat

(defvar praat-script-mode-syntax-table nil
  "Syntax table in use in praat-script-mode buffers.")

(if praat-script-mode-syntax-table
    ()
  (setq praat-script-mode-syntax-table (make-syntax-table))
  (modify-syntax-entry ?\\ "\\" praat-script-mode-syntax-table)
  (modify-syntax-entry ?\n ">" praat-script-mode-syntax-table)
  (modify-syntax-entry ?\f ">" praat-script-mode-syntax-table)
  (modify-syntax-entry ?\# "<" praat-script-mode-syntax-table)
  (modify-syntax-entry ?/ "." praat-script-mode-syntax-table)
  (modify-syntax-entry ?* "." praat-script-mode-syntax-table)
  (modify-syntax-entry ?+ "." praat-script-mode-syntax-table)
  (modify-syntax-entry ?- "." praat-script-mode-syntax-table)
  (modify-syntax-entry ?= "." praat-script-mode-syntax-table)
  (modify-syntax-entry ?% "." praat-script-mode-syntax-table)
  (modify-syntax-entry ?< "." praat-script-mode-syntax-table)
  (modify-syntax-entry ?> "." praat-script-mode-syntax-table)
  (modify-syntax-entry ?& "." praat-script-mode-syntax-table)
  (modify-syntax-entry ?| "." praat-script-mode-syntax-table)
  (modify-syntax-entry ?$ "_" praat-script-mode-syntax-table)
  (modify-syntax-entry ?_ "_" praat-script-mode-syntax-table)
  (modify-syntax-entry ?@ "_" praat-script-mode-syntax-table)
  (modify-syntax-entry ?\" "\"" praat-script-mode-syntax-table)
  (modify-syntax-entry ?\' "'" praat-script-mode-syntax-table))

(defconst praat-script-font-lock-keywords
  (eval-when-compile
    (list (list (regexp-opt '("selectObject" "removeObject" "plusObject" "createDirectory"
                              "selected") 'words) 1 font-lock-builtin-face)

          '("\\([[:upper:]]\\w*\\(\\w\\| \\|(\\|)\\)*\\)\\(:\\|$\\)"
            (1 font-lock-builtin-face))

          (list (regexp-opt '("break" "continue" "delete" "exit" "else" "for" "getline"
                              "if" "next" "print" "printf" "return" "while" "call" "clearinfo"
                              "comment" "down" "echo" "editor" "else" "elsif" "endeditor"
                              "endfor" "endform" "endif" "endproc" "endwhile" "execute" "exit"
                              "for" "form" "from" "if" "ifelse" "minus" "no" "pause" "plus"
                              "print" "printline" "printtab" "procedure" "repeat" "select"
                              "to" "until" "while" "$") 'words) 1 font-lock-keyword-face)

          (cons (regexp-opt '("=>" "/" "+" "-" "*" "=" "==")) 'font-lock-constant-face))))

(define-derived-mode praat-script-mode text-mode "Praat"

  (set (make-local-variable 'paragraph-start) (concat "$\\|" page-delimiter))
  (set (make-local-variable 'paragraph-separate) paragraph-start)
  (set (make-local-variable 'comment-start) "# ")
  (set (make-local-variable 'comment-end) "")
  (set (make-local-variable 'comment-start-skip) "#+ *")
  (setq font-lock-defaults '(praat-script-font-lock-keywords nil nil ((?_ . "w")))))

(provide 'praat-script-mode)


;;; praat-script-mode.el ends here

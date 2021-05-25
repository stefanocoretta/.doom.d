;;; praat-script-mode.el --- Praat scripting language

;; Author: Stefano Coretta <stefano.coretta@gmail.com>
;; Created: 2021-05-22
;; Version: 0.1.0 2021-05-22
;;
;; Keywords: praat

;; MIT License
;;
;; Copyright (c) 2021 Stefano Coretta
;;
;; Permission is hereby granted, free of charge, to any person obtaining a copy
;; of this software and associated documentation files (the "Software"), to deal
;; in the Software without restriction, including without limitation the rights
;; to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
;; copies of the Software, and to permit persons to whom the Software is
;; furnished to do so, subject to the following conditions:
;;
;; The above copyright notice and this permission notice shall be included in all
;; copies or substantial portions of the Software.
;;
;; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
;; IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
;; FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
;; AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
;; LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
;; OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
;; SOFTWARE.

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

          ;; Keywords imported from praat-mode.el
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

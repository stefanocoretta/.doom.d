;;; lexurgy-mode.el --- Lexurgy sound change applier

;; Author: Stefano Coretta <stefano.coretta@gmail.com>
;; Created: 2021-05-22
;; Version: 0.1.0 2021-05-22
;;
;; Keywords: lexurgy

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


;;
;; Main mode
;;
;; The lexurgy-mode is used to highlight .lsc files.

(defvar lexurgy-mode-syntax-table nil
  "Syntax table in use in lexurgy-mode buffers.")

(setq lexurgy-mode-syntax-table (make-syntax-table))

(defconst lexurgy-font-lock-keywords
  (eval-when-compile
    (list '("\\(Class\\|Diacritic\\|Feature\\|Symbol\\)\\s-" (1 font-lock-keyword-face))

          '("\\<\\(Feature\\)\\>" (1 font-lock-keyword-face))

          '("Feature \\(\\w+\\)(" (1 font-lock-function-name-face))

          '("\\(\\(\\w\\|-\\|_\\)+\\):" (1 font-lock-type-face))

          (cons (regexp-opt '("[" "]" "{" "}" "@")) 'font-lock-builtin-face)

          (cons (regexp-opt '("=>" "/" "_" "+" "-" "*" ",")) 'font-lock-constant-face))))

(define-derived-mode lexurgy-mode text-mode "Lexurgy"
  (set (make-local-variable 'paragraph-start) (concat "$\\|" page-delimiter))
  (set (make-local-variable 'paragraph-separate) paragraph-start)
  (set (make-local-variable 'comment-start) "# ")
  (set (make-local-variable 'comment-end) "")
  (set (make-local-variable 'comment-start-skip) "#+ *")
  (setq font-lock-defaults '(lexurgy-font-lock-keywords nil nil ((?_ . "w")))))

(provide 'lexurgy-mode)

;;
;; WLM mode
;;
;; The lexurgy-wlm-mode provides syntax highlighting for .wlm files.

(defconst lexurgy-wlm-font-lock
  (eval-when-compile
    (list (cons (regexp-opt '("=>" "/" "_" "+" "-" "*" ",")) 'font-lock-constant-face)
          '("^\\(\\w+\\)$" (1 font-lock-type-face))
          '("=> \\(.*\\)$" (1 font-lock-type-face)))))

(define-derived-mode lexurgy-wlm-mode lexurgy-mode "Lexurgy WLM"
  (setq font-lock-defaults '(lexurgy-wlm-font-lock nil nil ((?_ . "w")))))

(provide 'lexurgy-wlm-mode)

;;; lexurgy-mode.el ends here

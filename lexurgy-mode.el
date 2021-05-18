;;; lexurgy-mode.el --- Lexurgy sound change applier in Emacs

(defvar lexurgy-mode-syntax-table nil
  "Syntax table in use in lexurgy-mode buffers.")

(setq lexurgy-mode-syntax-table (make-syntax-table))

(defconst lexurgy-font-lock-keywords
  (eval-when-compile
    (list '("\\(Class\\|Diacritic\\|Feature\\|Symbol\\)\\s-\\(\\w+\\)" (1 font-lock-keyword-face) (2 font-lock-function-name-face nil t))

          '("\\<\\(Feature\\)\\>" (1 font-lock-keyword-face))

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

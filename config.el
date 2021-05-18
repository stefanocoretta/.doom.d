;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; DO NOT EDIT THIS FILE DIRECTLY
;; This is a file generated from a literate programing source file located at
;; https://gitlab.com/zzamboni/dot-doom/-/blob/master/doom.org
;; You should make any changes there and regenerate it from Emacs org-mode
;; using org-babel-tangle (C-c C-v t)

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
;; (setq user-full-name "John Doe"
;;      user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;; (setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
;; (setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
;; (setq display-line-numbers-type t)

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Stefano Coretta")

(setq doom-font (font-spec :family "MesloLGS NF" :size 14)
      doom-big-font (font-spec :family "MesloLGS NF" :size 20)
      doom-variable-pitch-font (font-spec :family "Lato" :size 14)
)

(add-hook! 'org-mode-hook #'mixed-pitch-mode)
(setq mixed-pitch-variable-pitch-cursor nil)

(setq emojify-display-style 'unicode)

(add-to-list 'initial-frame-alist '(fullscreen . fullscreen))

(setq confirm-kill-emacs nil)

(setq doom-theme 'doom-dracula)

(setq display-line-numbers-type t)

(setq async-shell-command-display-buffer nil)

(map!
 :leader
 :prefix "k"
 :desc "Open treemacs" "t" #'treemacs
 :desc "Open file with external app" "e" #'open-in-external-app
 :desc "Open research in dired" "r" (lambda () (interactive) (find-file "~/repos/research"))
 :desc "Search in bibliography" "b" #'ivy-bibtex
 :desc "Open bibliograpy file" "B" (lambda () (interactive) (find-file "~/texmf/bibtex/bib/linguistics.bib"))
 :desc "Open repository status list" "s" #'magit-list-repositories)

(setq markdown-code-lang-modes
  '(("ocaml" . tuareg-mode) ("elisp" . emacs-lisp-mode) ("ditaa" . artist-mode)
    ("asymptote" . asy-mode) ("dot" . fundamental-mode) ("sqlite" . sql-mode)
    ("calc" . fundamental-mode) ("C" . c-mode) ("cpp" . c++-mode)
    ("C++" . c++-mode) ("screen" . shell-script-mode) ("shell" . sh-mode)
    ("bash" . sh-mode) ("=latex" . latex-mode)))

(setq projectile-project-search-path
      '("~/repos" "~/repos/conlang" "~/repos/research" "~/repos/software" "~/repos/typography" "~/repos/web")
      projectile-auto-discover nil)

(setq projectile-switch-project-action #'projectile-commander)

(setq all-the-icons-ivy-file-commands
      '(counsel-find-file counsel-file-jump counsel-recentf counsel-projectile-find-file counsel-projectile-find-dir projectile-find-file))

(after! org
  (map! :map org-mode-map
        :n "M-j" #'org-metadown
        :n "M-k" #'org-metaup)
  (setq org-priority-faces '((?A :foreground "#e45649")
                             (?B :foreground "#da8548")
                             (?C :foreground "#0098dd"))
        org-agenda-files '("/Users/ste/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/org/agenda.org")))

(use-package org-fancy-priorities
  :ensure t
  :hook (org-mode . org-fancy-priorities-mode)
  :config
  (setq org-fancy-priorities-list '("⬢" "⬢" "⬢")))

(setq magit-repository-directories
      '(("~/repos" . 2)))

(setq magit-repolist-column-flag-alist
             '((magit-untracked-files . "   ⚪️    ")
               (magit-unstaged-files . "   🟠    ")
               (magit-staged-files . "   🟢    ")))

(setq magit-repolist-columns
  '(("Name"     25 magit-repolist-column-ident nil)
    ("Version"  25 magit-repolist-column-version nil)
    ("Status"   8 magit-repolist-column-flag nil)
    ("B<U"      3 magit-repolist-column-unpulled-from-upstream
      ((:right-align t)
       (:help-echo "Upstream changes not in branch")))
    ("B>U"      3 magit-repolist-column-unpushed-to-upstream
      ((:right-align t)
       (:help-echo "Local changes not in upstream")))
    ("Path"     99 magit-repolist-column-path nil)))

(setq auth-sources '("~/.authinfo"))

(after! dired
  (add-hook 'dired-mode-hook 'treemacs-icons-dired-mode))

(setq deft-directory "~/repos/notes"
      deft-extensions '("org")
      deft-recursive t)

(setq bibtex-autokey-name-year-separator ""
      bibtex-autokey-year-title-separator ""
      bibtex-autokey-year-length 4
      bibtex-autokey-titleword-length 0
      bibtex-autokey-titlewords 0)

(setq bibtex-completion-bibliography '("~/texmf/bibtex/bib/linguistics.bib")
      bibtex-completion-library-path '("/Users/ste/Library/Mobile Documents/com~apple~CloudDocs/drive/biblio"))

(setq ess-ask-for-ess-directory nil)

(add-to-list 'auto-mode-alist
             '("\\.secrets\\'" . ess-r-mode))

(load! "praat-mode.el")

(setq load-path (cons "~/emacs" load-path))
(autoload 'praat-mode "praat" "Enter Praat mode." t)
(setq auto-mode-alist (cons '("\\.praat$" . praat-mode) auto-mode-alist))

(load! "lexurgy-mode.el")

(setq load-path (cons "~/emacs" load-path))
(autoload 'lexurgy-mode "lexurgy" "Enter Lexurgy mode." t)
(setq auto-mode-alist (cons '("\\.lsc$" . lexurgy-mode) auto-mode-alist))

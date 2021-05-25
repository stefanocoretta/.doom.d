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

(setq doom-font (font-spec :family "Hasklug Nerd Font" :size 14)
      doom-big-font (font-spec :family "Hasklug Nerd Font" :size 24)
      doom-variable-pitch-font (font-spec :family "Lato" :size 14)
)

(add-to-list 'initial-frame-alist '(fullscreen . maximized))

(setq confirm-kill-emacs nil)

(setq doom-theme 'doom-dracula)

(setq display-line-numbers-type t)

;; (setq async-shell-command-display-buffer nil)

(map!
 :leader
 :prefix "k"
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

(after! org
  (setq org-agenda-files '("/Users/ste/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/org/agenda.org")))

(after! org
  (map! :map org-mode-map
        :n "M-j" #'org-metadown
        :n "M-k" #'org-metaup ))

(after! org
  (setq org-priority-faces '((?A :foreground "#e45649")
                             (?B :foreground "#da8548")
                             (?C :foreground "#0098dd"))))

(use-package! org-fancy-priorities
  :ensure t
  :hook (org-mode . org-fancy-priorities-mode)
  :config
  (setq org-fancy-priorities-list '("⬢" "⬢" "⬢")))

(use-package! org-bullets
  :after org
  :hook (org-mode . org-bullets-mode))

(setq org-roam-directory "/Users/ste/Library/Mobile Documents/com~apple~CloudDocs/drive/roam" )

(setq deft-directory "/Users/ste/Library/Mobile Documents/com~apple~CloudDocs/drive/deft"
      deft-extensions '("org")
      deft-recursive t)

(setq magit-repository-directories
      '(("~/repos" . 2)))

(setq magit-repolist-column-flag-alist
             '((magit-untracked-files . "   ❕️    ")
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

(setq all-the-icons-ivy-file-commands
      '(counsel-find-file counsel-file-jump counsel-recentf counsel-projectile-find-file counsel-projectile-find-dir projectile-find-file))

(after! dired
  (add-hook 'dired-mode-hook 'treemacs-icons-dired-mode))

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

(add-to-list 'auto-mode-alist
             '("\\.rstheme\\'" . css-mode))

(load! "praat-script-mode.el")

(setq load-path (cons "~/emacs" load-path))
(autoload 'praat-script-mode "praat" "Enter Praat mode." t)
(setq auto-mode-alist (cons '("\\.praat$" . praat-script-mode) auto-mode-alist))

(load! "lexurgy-mode.el")

(setq load-path (cons "~/emacs" load-path))
(autoload 'lexurgy-mode "lexurgy" "Enter Lexurgy mode." t)
(setq auto-mode-alist (cons '("\\.lsc$" . lexurgy-mode) auto-mode-alist))
(autoload 'lexurgy-wlm-mode "lexurgy wlm" "Enter Lexurgy WLM mode." t)
(setq auto-mode-alist (cons '("\\.wl\\(m\\|i\\)$" . lexurgy-wlm-mode) auto-mode-alist))

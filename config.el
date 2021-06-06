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

(setq doom-theme 'doom-dracula
      doom-dracula-brighter-modeline t)

;; make background black for better readability
(custom-set-faces!
  '(default :background "black"))

(setq doom-font (font-spec :family "Hasklug Nerd Font Mono" :size 14)
      doom-big-font (font-spec :family "Hasklug Nerd Font Mono" :size 24)
      doom-variable-pitch-font (font-spec :family "Lato" :size 14))

(setq-default tab-width 2)

(add-to-list 'initial-frame-alist '(fullscreen . maximized))

(setq confirm-kill-emacs nil)

(setq display-line-numbers-type t)

(after! org
  (remove-hook 'after-save-hook #'+literate-recompile-maybe-h))

(setq +workspaces-on-switch-project-behavior t)

(map!
 :leader
 :prefix ("G" . "go-to")
 :desc "Open research in dired" "r" (lambda () (interactive) (find-file "~/repos/research"))
 :desc "Open bibliograpy file" "b" (lambda () (interactive) (find-file "~/texmf/bibtex/bib/linguistics.bib")))

(map!
 :leader
 :desc "Open agenda view" "a" #'org-agenda-list
 :desc "Open file with external app" "e" #'open-in-external-app
 :desc "Search in bibliography" "B" #'ivy-bibtex )

(define-key evil-normal-state-map "u" 'undo-fu-only-undo)
(define-key evil-normal-state-map "\C-r" 'undo-fu-only-redo)

(after! org
  (map! :map org-mode-map
        :n "M-j" #'org-metadown
        :n "M-k" #'org-metaup ))

(setq deft-directory "/Users/ste/Library/Mobile Documents/com~apple~CloudDocs/drive/deft"
      deft-extensions '("org", "md", "txt", "tex")
      deft-recursive t)

(setq magit-repository-directories
      '(("~/repos" . 2)))

(setq magit-repolist-column-flag-alist
             '((magit-untracked-files . "  ❕️  ")
               (magit-unstaged-files . "  🟠  ")
               (magit-staged-files . "  🟢  ")))

(setq magit-repolist-columns
  '(("Name"     25 magit-repolist-column-ident nil)
    ("Version"  25 magit-repolist-column-version nil)
    (""   5 magit-repolist-column-flag nil)
    ("B<U"      3 magit-repolist-column-unpulled-from-upstream
      ((:right-align t)
       (:help-echo "Upstream changes not in branch")))
    ("B>U"      3 magit-repolist-column-unpushed-to-upstream
      ((:right-align t)
       (:help-echo "Local changes not in upstream")))
    ("Path"     99 magit-repolist-column-path nil)))

(setq auth-sources '("~/.authinfo"))

(setq projectile-project-search-path
      '("~/repos" "~/repos/conlang" "~/repos/research" "~/repos/software" "~/repos/typography" "~/repos/web")
      projectile-auto-discover nil)

(setq org-roam-directory "/Users/ste/Library/Mobile Documents/com~apple~CloudDocs/drive/roam" )

(setq org-roam-capture-templates
      '(("d" "default" plain #'org-roam-capture--get-point "%?" :file-name "${slug}" :head "#+title: ${title}\n#+date: %t\n" :unnarrowed t)))

(use-package! org-roam-bibtex
  :after org-roam
  :hook (org-roam-mode . org-roam-bibtex-mode)
  :config
  (require 'org-ref)) ; optional: if Org Ref is not loaded anywhere else, load it here

(setq ispell-dictionary "en")

(use-package! zetteldeft
  :after deft
  :config
    (zetteldeft-set-classic-keybindings))

(map!
  :leader
  :prefix ("d" . "deft")
  :desc "deft" "d" #'deft
  :desc "new serch" "D" #'zetteldeft-deft-new-search
  :desc "refresh" "R" #'deft-refresh
  :desc "search at point" "s" #'zetteldeft-search-at-point
  :desc "search current id" "c" #'zetteldeft-search-current-id
  :desc "follow link" "f" #'zetteldeft-follow-link
  :desc "avy file othe window" "F" #'zetteldeft-avy-file-search-ace-window
  :desc "browse" "." #'zetteldeft-browse
  :desc "go home" "h" #'zetteldeft-go-home
  :desc "avy link search" "l" #'zetteldeft-avy-link-search
  :desc "avy tag search" "t" #'zetteldeft-avy-tag-search
  :desc "tag list" "T" #'zetteldeft-tag-buffer
  :desc "insert tag" "#" #'zetteldeft-tag-insert
  :desc "search tag" "/" #'zetteldeft-search-tag
  :desc "insert id" "i" #'zetteldeft-find-file-id-insert
  :desc "insert full title" "I" #'zetteldeft-find-file-full-title-insert
  :desc "find file" "o" #'zetteldeft-find-file
  :desc "new file" "n" #'zetteldeft-new-file
  :desc "new file & link" "N" #'zetteldeft-new-file-and-link
  :desc "new file & backlink" "B" #'zetteldeft-new-file-and-backlink
  :desc "add link" "b" #'zetteldeft-backlink-add
  :desc "rename" "r" #'zetteldeft-file-rename
  :desc "count words" "x" #'zetteldeft-count-words)

(setq bibtex-autokey-name-year-separator ""
      bibtex-autokey-year-title-separator ""
      bibtex-autokey-year-length 4
      bibtex-autokey-titleword-length 0
      bibtex-autokey-titlewords 0)

(setq bibtex-completion-bibliography '("/Users/ste/texmf/bibtex/bib/linguistics.bib")
      bibtex-completion-library-path '("/Users/ste/Library/Mobile Documents/com~apple~CloudDocs/drive/biblio")
      bibtex-completion-notes-path "/Users/ste/Library/Mobile Documents/com~apple~CloudDocs/drive/roam")

(setq reftex-default-bibliography '("/Users/ste/texmf/bibtex/bib/linguistics.bib"))

;; see org-ref for use of these variables
(setq org-ref-bibliography-notes "/Users/ste/Library/Mobile Documents/com~apple~CloudDocs/drive/roam"
      org-ref-default-bibliography '("/Users/ste/texmf/bibtex/bib/linguistics.bib")
      org-ref-pdf-directory "/Users/ste/Library/Mobile Documents/com~apple~CloudDocs/drive/biblio")

(load! "lexurgy-mode.el")

(setq load-path (cons "~/emacs" load-path))
(autoload 'lexurgy-mode "lexurgy" "Enter Lexurgy mode." t)
(setq auto-mode-alist (cons '("\\.lsc$" . lexurgy-mode) auto-mode-alist))
(autoload 'lexurgy-wlm-mode "lexurgy wlm" "Enter Lexurgy WLM mode." t)
(setq auto-mode-alist (cons '("\\.wl\\(m\\|i\\)$" . lexurgy-wlm-mode) auto-mode-alist))

(setq markdown-code-lang-modes
  '(("ocaml" . tuareg-mode) ("elisp" . emacs-lisp-mode) ("ditaa" . artist-mode)
    ("asymptote" . asy-mode) ("dot" . fundamental-mode) ("sqlite" . sql-mode)
    ("calc" . fundamental-mode) ("C" . c-mode) ("cpp" . c++-mode)
    ("C++" . c++-mode) ("screen" . shell-script-mode) ("shell" . sh-mode)
    ("bash" . sh-mode) ("=latex" . latex-mode)))

(load! "praat-script-mode.el")

(setq load-path (cons "~/emacs" load-path))
(autoload 'praat-script-mode "praat" "Enter Praat mode." t)
(setq auto-mode-alist (cons '("\\.praat$" . praat-script-mode) auto-mode-alist))

(setq ess-ask-for-ess-directory nil)

(add-to-list 'auto-mode-alist
             '("\\.secrets\\'" . ess-r-mode))

(add-to-list 'auto-mode-alist
             '("\\.rstheme\\'" . css-mode))

(add-to-list 'auto-mode-alist
             '("\\.Rproj$" . yaml-mode))

(after! org
  (setq org-startup-numerated t)
  (setq org-startup-folded t))

(after! org
  (setq org-agenda-files '("/Users/ste/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/org/agenda.org"))
  (setq org-agenda-span 14)
  (setq org-agenda-start-day nil)
  (setq calendar-week-start-day 1))

(add-hook 'org-agenda-mode-hook 'org-fancy-priorities-mode)

(after! org-fancy-priorities
  (setq org-priority-faces '((?A :foreground "#e45649")
                             (?B :foreground "#da8548")
                             (?C :foreground "#0098dd"))
        org-fancy-priorities-list '("⬢" "⬢" "⬢")))

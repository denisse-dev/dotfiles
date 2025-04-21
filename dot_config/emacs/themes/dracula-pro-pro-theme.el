;;; dracula-pro-pro-theme.el --- Dracula Pro

;; Copyright (C) 2020-Today Dracula Theme.

;; Author: Dracula Team
;; Version: 1.0.0
;; Package-Requires: ((emacs "24.3"))
;; URL: https://draculatheme.com/pro

;;; Commentary:
;; Dracula PRO is a color scheme and UI theme tailored for programming. Made for terminal emulators, code editors, and syntax highlighters.

;;; Code:

(require 'cl-lib)
(deftheme dracula-pro-pro
  "Dracula PRO - Pro Variant")


;;;; Configuration options:

(defgroup dracula-pro-pro nil
  "Dracula theme options.

The theme has to be reloaded after changing anything in this group."
  :group 'faces)

(defcustom dracula-pro-pro-enlarge-headings t
  "Use different font sizes for some headings and titles."
  :type 'boolean
  :group 'dracula-pro-pro)

(defcustom dracula-pro-pro-height-title-1 1.3
  "Font size 100%."
  :type 'number
  :group 'dracula-pro-pro)

(defcustom dracula-pro-pro-height-title-2 1.1
  "Font size 110%."
  :type 'number
  :group 'dracula-pro-pro)

(defcustom dracula-pro-pro-height-title-3 1.0
  "Font size 130%."
  :type 'number
  :group 'dracula-pro-pro)

(defcustom dracula-pro-pro-height-doc-title 1.44
  "Font size 144%."
  :type 'number
  :group 'dracula-pro-pro)

(defcustom dracula-pro-pro-alternate-mode-line-and-minibuffer nil
  "Use less bold and pink in the minibuffer."
  :type 'boolean
  :group 'dracula-pro-pro)


;;;; Theme definition:

;; Assigment form: VARIABLE COLOR [TTY-COLOR]
(let ((colors '(;; Upstream theme color
                (dracula-pro-pro-bg       "#22212C" "#201F2E" nil)             ; Background
                (dracula-pro-pro-fg       "#F8F8F2" "#F9F9F1" "brightwhite")   ; Foreground
                (dracula-pro-pro-current  "#454158" "#433D5C" "brightblack")   ; Current-line/selection
                (dracula-pro-pro-comment  "#7970A9" "#756AAF" "blue")          ; Comment
                (dracula-pro-pro-cyan     "#80FFEA" "#86F9E6" "brightcyan")    ; Cyan
                (dracula-pro-pro-green    "#8AFF80" "#8FF986" "green")         ; Green
                (dracula-pro-pro-orange   "#FFCA80" "#F9C986" "brightred")     ; Orange
                (dracula-pro-pro-pink     "#FF80BF" "#F986BF" "magenta")       ; Pink
                (dracula-pro-pro-purple   "#9580FF" "#9986F9" "brightmagenta") ; Purple
                (dracula-pro-pro-red      "#FF9580" "#F99986" "red")           ; Red
                (dracula-pro-pro-yellow   "#FFFF80" "#F9F986" "yellow")        ; Yellow
                ;; Other colors
                (dracula-pro-pro-bg2      "#201F2E" "#2B293D" "brightblack")
                (dracula-pro-pro-bg3      "#2B293D" "#35334D" "brightblack")
                (dracula-pro-pro-bg4      "#36334C" "#3F3D5C" "brightblack")
                (dracula-pro-pro-fg2      "#EDEDDE" "#EBEBE0" "brightwhite")
                (dracula-pro-pro-fg3      "#D6D6C2" "#D1D1C7" "white")
                (dracula-pro-pro-fg4      "#BABAAB" "#B3B3B3" "white")
                (dracula-pro-pro-alt-blue "#8A75F0" "#846EF7" "brightblue")))
      (faces '(;; default
               (cursor :background ,dracula-pro-pro-fg3)
               (completions-first-difference :foreground ,dracula-pro-pro-pink :weight bold)
               (default :background ,dracula-pro-pro-bg :foreground ,dracula-pro-pro-fg)
               (default-italic :slant italic)
               (ffap :foreground ,dracula-pro-pro-fg4)
               (fringe :background ,dracula-pro-pro-bg :foreground ,dracula-pro-pro-fg4)
               (highlight :foreground ,dracula-pro-pro-fg3 :background ,dracula-pro-pro-bg3)
               (hl-line :background ,dracula-pro-pro-current :extend t)
               (info-quoted-name :foreground ,dracula-pro-pro-orange)
               (info-string :foreground ,dracula-pro-pro-yellow)
               (lazy-highlight :foreground ,dracula-pro-pro-fg2 :background ,dracula-pro-pro-bg2)
               (link :foreground ,dracula-pro-pro-cyan :underline t)
               (linum :slant italic :foreground ,dracula-pro-pro-bg4 :background ,dracula-pro-pro-bg)
               (line-number :slant italic :foreground ,dracula-pro-pro-bg4 :background ,dracula-pro-pro-bg)
               (match :background ,dracula-pro-pro-yellow :foreground ,dracula-pro-pro-bg)
               (minibuffer-prompt
                ,@(if dracula-pro-pro-alternate-mode-line-and-minibuffer
                      (list :weight 'normal :foreground dracula-pro-pro-fg)
                    (list :weight 'bold :foreground dracula-pro-pro-pink)))
               (read-multiple-choice-face :inherit completions-first-difference)
               (region :inherit match :extend t)
               (trailing-whitespace :foreground nil :background ,dracula-pro-pro-orange)
               (vertical-border :foreground ,dracula-pro-pro-bg2)
               (success :foreground ,dracula-pro-pro-green)
               (warning :foreground ,dracula-pro-pro-orange)
               (error :foreground ,dracula-pro-pro-red)
               (header-line :background ,dracula-pro-pro-bg)
               ;; syntax
               (font-lock-builtin-face :foreground ,dracula-pro-pro-orange)
               (font-lock-comment-face :foreground ,dracula-pro-pro-comment)
               (font-lock-comment-delimiter-face :foreground ,dracula-pro-pro-comment)
               (font-lock-constant-face :foreground ,dracula-pro-pro-cyan)
               (font-lock-doc-face :foreground ,dracula-pro-pro-comment)
               (font-lock-function-name-face :foreground ,dracula-pro-pro-green :weight bold)
               (font-lock-keyword-face :weight bold :foreground ,dracula-pro-pro-pink)
               (font-lock-negation-char-face :foreground ,dracula-pro-pro-cyan)
               (font-lock-preprocessor-face :foreground ,dracula-pro-pro-orange)
               (font-lock-reference-face :foreground ,dracula-pro-pro-cyan)
               (font-lock-regexp-grouping-backslash :foreground ,dracula-pro-pro-cyan)
               (font-lock-regexp-grouping-construct :foreground ,dracula-pro-pro-purple)
               (font-lock-string-face :foreground ,dracula-pro-pro-yellow)
               (font-lock-type-face :foreground ,dracula-pro-pro-purple)
               (font-lock-variable-name-face :foreground ,dracula-pro-pro-fg
                                             :weight bold)
               (font-lock-warning-face :foreground ,dracula-pro-pro-orange :background ,dracula-pro-pro-bg2)
               ;; auto-complete
               (ac-completion-face :underline t :foreground ,dracula-pro-pro-pink)
               ;; company
               (company-echo-common :foreground ,dracula-pro-pro-bg :background ,dracula-pro-pro-fg)
               (company-preview :background ,dracula-pro-pro-bg :foreground ,dracula-pro-pro-alt-blue)
               (company-preview-common :foreground ,dracula-pro-pro-bg2 :foreground ,dracula-pro-pro-fg3)
               (company-preview-search :foreground ,dracula-pro-pro-purple :background ,dracula-pro-pro-bg)
               (company-scrollbar-bg :background ,dracula-pro-pro-bg3)
               (company-scrollbar-fg :foreground ,dracula-pro-pro-pink)
               (company-template-field :inherit match)
               (company-tooltip :foreground ,dracula-pro-pro-fg2 :background ,dracula-pro-pro-bg :weight bold)
               (company-tooltip-annotation :foreground ,dracula-pro-pro-cyan)
               (company-tooltip-common :foreground ,dracula-pro-pro-fg3)
               (company-tooltip-common-selection :foreground ,dracula-pro-pro-yellow)
               (company-tooltip-mouse :inherit highlight)
               (company-tooltip-selection :background ,dracula-pro-pro-bg3 :foreground ,dracula-pro-pro-fg3)
               ;; diff-hl
               (diff-hl-change :foreground ,dracula-pro-pro-orange :background ,dracula-pro-pro-orange)
               (diff-hl-delete :foreground ,dracula-pro-pro-red :background ,dracula-pro-pro-red)
               (diff-hl-insert :foreground ,dracula-pro-pro-green :background ,dracula-pro-pro-green)
               ;; dired
               (dired-directory :foreground ,dracula-pro-pro-green :weight normal)
               (dired-flagged :foreground ,dracula-pro-pro-pink)
               (dired-header :foreground ,dracula-pro-pro-fg3 :background ,dracula-pro-pro-bg)
               (dired-ignored :inherit shadow)
               (dired-mark :foreground ,dracula-pro-pro-fg :weight bold)
               (dired-marked :foreground ,dracula-pro-pro-orange :weight bold)
               (dired-perm-write :foreground ,dracula-pro-pro-fg3 :underline t)
               (dired-symlink :foreground ,dracula-pro-pro-yellow :weight normal :slant italic)
               (dired-warning :foreground ,dracula-pro-pro-orange :underline t)
               (diredp-compressed-file-name :foreground ,dracula-pro-pro-fg3)
               (diredp-compressed-file-suffix :foreground ,dracula-pro-pro-fg4)
               (diredp-date-time :foreground ,dracula-pro-pro-fg)
               (diredp-deletion-file-name :foreground ,dracula-pro-pro-pink :background ,dracula-pro-pro-current)
               (diredp-deletion :foreground ,dracula-pro-pro-pink :weight bold)
               (diredp-dir-heading :foreground ,dracula-pro-pro-fg2 :background ,dracula-pro-pro-bg4)
               (diredp-dir-name :inherit dired-directory)
               (diredp-dir-priv :inherit dired-directory)
               (diredp-executable-tag :foreground ,dracula-pro-pro-orange)
               (diredp-file-name :foreground ,dracula-pro-pro-fg)
               (diredp-file-suffix :foreground ,dracula-pro-pro-fg4)
               (diredp-flag-mark-line :foreground ,dracula-pro-pro-fg2 :slant italic :background ,dracula-pro-pro-current)
               (diredp-flag-mark :foreground ,dracula-pro-pro-fg2 :weight bold :background ,dracula-pro-pro-current)
               (diredp-ignored-file-name :foreground ,dracula-pro-pro-fg)
               (diredp-mode-line-flagged :foreground ,dracula-pro-pro-orange)
               (diredp-mode-line-marked :foreground ,dracula-pro-pro-orange)
               (diredp-no-priv :foreground ,dracula-pro-pro-fg)
               (diredp-number :foreground ,dracula-pro-pro-cyan)
               (diredp-other-priv :foreground ,dracula-pro-pro-orange)
               (diredp-rare-priv :foreground ,dracula-pro-pro-orange)
               (diredp-read-priv :foreground ,dracula-pro-pro-purple)
               (diredp-write-priv :foreground ,dracula-pro-pro-pink)
               (diredp-exec-priv :foreground ,dracula-pro-pro-yellow)
               (diredp-symlink :foreground ,dracula-pro-pro-orange)
               (diredp-link-priv :foreground ,dracula-pro-pro-orange)
               (diredp-autofile-name :foreground ,dracula-pro-pro-yellow)
               (diredp-tagged-autofile-name :foreground ,dracula-pro-pro-yellow)
               ;; enh-ruby
               (enh-ruby-heredoc-delimiter-face :foreground ,dracula-pro-pro-yellow)
               (enh-ruby-op-face :foreground ,dracula-pro-pro-pink)
               (enh-ruby-regexp-delimiter-face :foreground ,dracula-pro-pro-yellow)
               (enh-ruby-string-delimiter-face :foreground ,dracula-pro-pro-yellow)
               ;; flyspell
               (flyspell-duplicate :underline (:style wave :color ,dracula-pro-pro-orange))
               (flyspell-incorrect :underline (:style wave :color ,dracula-pro-pro-red))
               ;; font-latex
               (font-latex-bold-face :foreground ,dracula-pro-pro-purple)
               (font-latex-italic-face :foreground ,dracula-pro-pro-pink :slant italic)
               (font-latex-match-reference-keywords :foreground ,dracula-pro-pro-cyan)
               (font-latex-match-variable-keywords :foreground ,dracula-pro-pro-fg)
               (font-latex-string-face :foreground ,dracula-pro-pro-yellow)
               ;; gnus-group
               (gnus-group-mail-1 :foreground ,dracula-pro-pro-pink :weight bold)
               (gnus-group-mail-1-empty :inherit gnus-group-mail-1 :weight normal)
               (gnus-group-mail-2 :foreground ,dracula-pro-pro-cyan :weight bold)
               (gnus-group-mail-2-empty :inherit gnus-group-mail-2 :weight normal)
               (gnus-group-mail-3 :foreground ,dracula-pro-pro-comment :weight bold)
               (gnus-group-mail-3-empty :inherit gnus-group-mail-3 :weight normal)
               (gnus-group-mail-low :foreground ,dracula-pro-pro-current :weight bold)
               (gnus-group-mail-low-empty :inherit gnus-group-mail-low :weight normal)
               (gnus-group-news-1 :foreground ,dracula-pro-pro-pink :weight bold)
               (gnus-group-news-1-empty :inherit gnus-group-news-1 :weight normal)
               (gnus-group-news-2 :foreground ,dracula-pro-pro-cyan :weight bold)
               (gnus-group-news-2-empty :inherit gnus-group-news-2 :weight normal)
               (gnus-group-news-3 :foreground ,dracula-pro-pro-comment :weight bold)
               (gnus-group-news-3-empty :inherit gnus-group-news-3 :weight normal)
               (gnus-group-news-4 :inherit gnus-group-news-low)
               (gnus-group-news-4-empty :inherit gnus-group-news-low-empty)
               (gnus-group-news-5 :inherit gnus-group-news-low)
               (gnus-group-news-5-empty :inherit gnus-group-news-low-empty)
               (gnus-group-news-6 :inherit gnus-group-news-low)
               (gnus-group-news-6-empty :inherit gnus-group-news-low-empty)
               (gnus-group-news-low :foreground ,dracula-pro-pro-current :weight bold)
               (gnus-group-news-low-empty :inherit gnus-group-news-low :weight normal)
               (gnus-header-content :foreground ,dracula-pro-pro-pink)
               (gnus-header-from :foreground ,dracula-pro-pro-fg)
               (gnus-header-name :foreground ,dracula-pro-pro-purple)
               (gnus-header-subject :foreground ,dracula-pro-pro-green :weight bold)
               (gnus-summary-markup-face :foreground ,dracula-pro-pro-cyan)
               (gnus-summary-high-unread :foreground ,dracula-pro-pro-pink :weight bold)
               (gnus-summary-high-read :inherit gnus-summary-high-unread :weight normal)
               (gnus-summary-high-ancient :inherit gnus-summary-high-read)
               (gnus-summary-high-ticked :inherit gnus-summary-high-read :underline t)
               (gnus-summary-normal-unread :foreground ,dracula-pro-pro-alt-blue :weight bold)
               (gnus-summary-normal-read :foreground ,dracula-pro-pro-comment :weight normal)
               (gnus-summary-normal-ancient :inherit gnus-summary-normal-read :weight light)
               (gnus-summary-normal-ticked :foreground ,dracula-pro-pro-pink :weight bold)
               (gnus-summary-low-unread :foreground ,dracula-pro-pro-comment :weight bold)
               (gnus-summary-low-read :inherit gnus-summary-low-unread :weight normal)
               (gnus-summary-low-ancient :inherit gnus-summary-low-read)
               (gnus-summary-low-ticked :inherit gnus-summary-low-read :underline t)
               (gnus-summary-selected :inverse-video t)
               ;; haskell-mode
               (haskell-operator-face :foreground ,dracula-pro-pro-pink)
               (haskell-constructor-face :foreground ,dracula-pro-pro-purple)
               ;; helm
               (helm-bookmark-w3m :foreground ,dracula-pro-pro-purple)
               (helm-buffer-not-saved :foreground ,dracula-pro-pro-purple :background ,dracula-pro-pro-bg)
               (helm-buffer-process :foreground ,dracula-pro-pro-orange :background ,dracula-pro-pro-bg)
               (helm-buffer-saved-out :foreground ,dracula-pro-pro-fg :background ,dracula-pro-pro-bg)
               (helm-buffer-size :foreground ,dracula-pro-pro-fg :background ,dracula-pro-pro-bg)
               (helm-candidate-number :foreground ,dracula-pro-pro-bg :background ,dracula-pro-pro-fg)
               (helm-ff-directory :foreground ,dracula-pro-pro-green :background ,dracula-pro-pro-bg :weight bold)
               (helm-ff-dotted-directory :foreground ,dracula-pro-pro-green :background ,dracula-pro-pro-bg :weight normal)
               (helm-ff-executable :foreground ,dracula-pro-pro-alt-blue :background ,dracula-pro-pro-bg :weight normal)
               (helm-ff-file :foreground ,dracula-pro-pro-fg :background ,dracula-pro-pro-bg :weight normal)
               (helm-ff-invalid-symlink :foreground ,dracula-pro-pro-pink :background ,dracula-pro-pro-bg :weight bold)
               (helm-ff-prefix :foreground ,dracula-pro-pro-bg :background ,dracula-pro-pro-pink :weight normal)
               (helm-ff-symlink :foreground ,dracula-pro-pro-pink :background ,dracula-pro-pro-bg :weight bold)
               (helm-grep-cmd-line :foreground ,dracula-pro-pro-fg :background ,dracula-pro-pro-bg)
               (helm-grep-file :foreground ,dracula-pro-pro-fg :background ,dracula-pro-pro-bg)
               (helm-grep-finish :foreground ,dracula-pro-pro-fg2 :background ,dracula-pro-pro-bg)
               (helm-grep-lineno :foreground ,dracula-pro-pro-fg :background ,dracula-pro-pro-bg)
               (helm-grep-match :foreground nil :background nil :inherit helm-match)
               (helm-grep-running :foreground ,dracula-pro-pro-green :background ,dracula-pro-pro-bg)
               (helm-header :foreground ,dracula-pro-pro-fg2 :background ,dracula-pro-pro-bg :underline nil :box nil)
               (helm-moccur-buffer :foreground ,dracula-pro-pro-green :background ,dracula-pro-pro-bg)
               (helm-selection :background ,dracula-pro-pro-bg2 :underline nil)
               (helm-selection-line :background ,dracula-pro-pro-bg2)
               (helm-separator :foreground ,dracula-pro-pro-purple :background ,dracula-pro-pro-bg)
               (helm-source-go-package-godoc-description :foreground ,dracula-pro-pro-yellow)
               (helm-source-header :foreground ,dracula-pro-pro-pink :background ,dracula-pro-pro-bg :underline nil :weight bold)
               (helm-time-zone-current :foreground ,dracula-pro-pro-orange :background ,dracula-pro-pro-bg)
               (helm-time-zone-home :foreground ,dracula-pro-pro-purple :background ,dracula-pro-pro-bg)
               (helm-visible-mark :foreground ,dracula-pro-pro-bg :background ,dracula-pro-pro-bg3)
               ;; highlight-indentation minor mode
               (highlight-indentation-face :background ,dracula-pro-pro-bg2)
               ;; icicle
               (icicle-whitespace-highlight :background ,dracula-pro-pro-fg)
               (icicle-special-candidate :foreground ,dracula-pro-pro-fg2)
               (icicle-extra-candidate :foreground ,dracula-pro-pro-fg2)
               (icicle-search-main-regexp-others :foreground ,dracula-pro-pro-fg)
               (icicle-search-current-input :foreground ,dracula-pro-pro-pink)
               (icicle-search-context-level-8 :foreground ,dracula-pro-pro-orange)
               (icicle-search-context-level-7 :foreground ,dracula-pro-pro-orange)
               (icicle-search-context-level-6 :foreground ,dracula-pro-pro-orange)
               (icicle-search-context-level-5 :foreground ,dracula-pro-pro-orange)
               (icicle-search-context-level-4 :foreground ,dracula-pro-pro-orange)
               (icicle-search-context-level-3 :foreground ,dracula-pro-pro-orange)
               (icicle-search-context-level-2 :foreground ,dracula-pro-pro-orange)
               (icicle-search-context-level-1 :foreground ,dracula-pro-pro-orange)
               (icicle-search-main-regexp-current :foreground ,dracula-pro-pro-fg)
               (icicle-saved-candidate :foreground ,dracula-pro-pro-fg)
               (icicle-proxy-candidate :foreground ,dracula-pro-pro-fg)
               (icicle-mustmatch-completion :foreground ,dracula-pro-pro-purple)
               (icicle-multi-command-completion :foreground ,dracula-pro-pro-fg2 :background ,dracula-pro-pro-bg2)
               (icicle-msg-emphasis :foreground ,dracula-pro-pro-green)
               (icicle-mode-line-help :foreground ,dracula-pro-pro-fg4)
               (icicle-match-highlight-minibuffer :foreground ,dracula-pro-pro-orange)
               (icicle-match-highlight-Completions :foreground ,dracula-pro-pro-green)
               (icicle-key-complete-menu-local :foreground ,dracula-pro-pro-fg)
               (icicle-key-complete-menu :foreground ,dracula-pro-pro-fg)
               (icicle-input-completion-fail-lax :foreground ,dracula-pro-pro-pink)
               (icicle-input-completion-fail :foreground ,dracula-pro-pro-pink)
               (icicle-historical-candidate-other :foreground ,dracula-pro-pro-fg)
               (icicle-historical-candidate :foreground ,dracula-pro-pro-fg)
               (icicle-current-candidate-highlight :foreground ,dracula-pro-pro-orange :background ,dracula-pro-pro-bg3)
               (icicle-Completions-instruction-2 :foreground ,dracula-pro-pro-fg4)
               (icicle-Completions-instruction-1 :foreground ,dracula-pro-pro-fg4)
               (icicle-completion :foreground ,dracula-pro-pro-fg)
               (icicle-complete-input :foreground ,dracula-pro-pro-orange)
               (icicle-common-match-highlight-Completions :foreground ,dracula-pro-pro-purple)
               (icicle-candidate-part :foreground ,dracula-pro-pro-fg)
               (icicle-annotation :foreground ,dracula-pro-pro-fg4)
               ;; icomplete
               (icompletep-determined :foreground ,dracula-pro-pro-orange)
               ;; ido
               (ido-first-match
                ,@(if dracula-pro-pro-alternate-mode-line-and-minibuffer
                      (list :weight 'normal :foreground dracula-pro-pro-green)
                    (list :weight 'bold :foreground dracula-pro-pro-pink)))
               (ido-only-match :foreground ,dracula-pro-pro-orange)
               (ido-subdir :foreground ,dracula-pro-pro-yellow)
               (ido-virtual :foreground ,dracula-pro-pro-cyan)
               (ido-incomplete-regexp :inherit font-lock-warning-face)
               (ido-indicator :foreground ,dracula-pro-pro-fg :background ,dracula-pro-pro-pink)
               ;; isearch
               (isearch :inherit match :weight bold)
               (isearch-fail :foreground ,dracula-pro-pro-bg :background ,dracula-pro-pro-orange)
               ;; jde-java
               (jde-java-font-lock-constant-face :foreground ,dracula-pro-pro-cyan)
               (jde-java-font-lock-modifier-face :foreground ,dracula-pro-pro-pink)
               (jde-java-font-lock-number-face :foreground ,dracula-pro-pro-fg)
               (jde-java-font-lock-package-face :foreground ,dracula-pro-pro-fg)
               (jde-java-font-lock-private-face :foreground ,dracula-pro-pro-pink)
               (jde-java-font-lock-public-face :foreground ,dracula-pro-pro-pink)
               ;; js2-mode
               (js2-external-variable :foreground ,dracula-pro-pro-purple)
               (js2-function-param :foreground ,dracula-pro-pro-cyan)
               (js2-jsdoc-html-tag-delimiter :foreground ,dracula-pro-pro-yellow)
               (js2-jsdoc-html-tag-name :foreground ,dracula-pro-pro-alt-blue)
               (js2-jsdoc-value :foreground ,dracula-pro-pro-yellow)
               (js2-private-function-call :foreground ,dracula-pro-pro-cyan)
               (js2-private-member :foreground ,dracula-pro-pro-fg3)
               ;; js3-mode
               (js3-error-face :underline ,dracula-pro-pro-orange)
               (js3-external-variable-face :foreground ,dracula-pro-pro-fg)
               (js3-function-param-face :foreground ,dracula-pro-pro-pink)
               (js3-instance-member-face :foreground ,dracula-pro-pro-cyan)
               (js3-jsdoc-tag-face :foreground ,dracula-pro-pro-pink)
               (js3-warning-face :underline ,dracula-pro-pro-pink)
               ;; magit
               (magit-branch-local :foreground ,dracula-pro-pro-cyan)
               (magit-branch-remote :foreground ,dracula-pro-pro-green)
               (magit-tag :foreground ,dracula-pro-pro-orange)
               (magit-section-heading :foreground ,dracula-pro-pro-pink :weight bold)
               (magit-section-highlight :background ,dracula-pro-pro-bg3 :extend t)
               (magit-diff-context-highlight :background ,dracula-pro-pro-bg3
                                             :foreground ,dracula-pro-pro-fg3
                                             :extend t)
               (magit-diff-revision-summary :foreground ,dracula-pro-pro-orange
                                            :background ,dracula-pro-pro-bg
                                            :weight bold)
               (magit-diff-revision-summary-highlight :foreground ,dracula-pro-pro-orange
                                                      :background ,dracula-pro-pro-bg3
                                                      :weight bold
                                                      :extend t)
               ;; the four following lines are just a patch of the
               ;; upstream color to add the extend keyword.
               (magit-diff-added :background "#335533"
                                 :foreground "#ddffdd"
                                 :extend t)
               (magit-diff-added-highlight :background "#336633"
                                           :foreground "#cceecc"
                                           :extend t)
               (magit-diff-removed :background "#553333"
                                   :foreground "#ffdddd"
                                   :extend t)
               (magit-diff-removed-highlight :background "#663333"
                                             :foreground "#eecccc"
                                             :extend t)
               (magit-diff-file-heading :foreground ,dracula-pro-pro-fg)
               (magit-diff-file-heading-highlight :inherit magit-section-highlight)
               (magit-diffstat-added :foreground ,dracula-pro-pro-green)
               (magit-diffstat-removed :foreground ,dracula-pro-pro-red)
               (magit-hash :foreground ,dracula-pro-pro-fg2)
               (magit-hunk-heading :background ,dracula-pro-pro-bg3)
               (magit-hunk-heading-highlight :background ,dracula-pro-pro-bg3)
               (magit-item-highlight :background ,dracula-pro-pro-bg3)
               (magit-log-author :foreground ,dracula-pro-pro-fg3)
               (magit-process-ng :foreground ,dracula-pro-pro-orange :weight bold)
               (magit-process-ok :foreground ,dracula-pro-pro-green :weight bold)
               ;; markdown
               (markdown-blockquote-face :foreground ,dracula-pro-pro-orange)
               (markdown-code-face :foreground ,dracula-pro-pro-orange)
               (markdown-footnote-face :foreground ,dracula-pro-pro-alt-blue)
               (markdown-header-face :weight normal)
               (markdown-header-face-1
                :inherit bold :foreground ,dracula-pro-pro-pink
                ,@(when dracula-pro-pro-enlarge-headings
                    (list :height dracula-pro-pro-height-title-1)))
               (markdown-header-face-2
                :inherit bold :foreground ,dracula-pro-pro-purple
                ,@(when dracula-pro-pro-enlarge-headings
                    (list :height dracula-pro-pro-height-title-2)))
               (markdown-header-face-3
                :foreground ,dracula-pro-pro-green
                ,@(when dracula-pro-pro-enlarge-headings
                    (list :height dracula-pro-pro-height-title-3)))
               (markdown-header-face-4 :foreground ,dracula-pro-pro-yellow)
               (markdown-header-face-5 :foreground ,dracula-pro-pro-cyan)
               (markdown-header-face-6 :foreground ,dracula-pro-pro-orange)
               (markdown-header-face-7 :foreground ,dracula-pro-pro-alt-blue)
               (markdown-header-face-8 :foreground ,dracula-pro-pro-fg)
               (markdown-inline-code-face :foreground ,dracula-pro-pro-yellow)
               (markdown-plain-url-face :inherit link)
               (markdown-pre-face :foreground ,dracula-pro-pro-orange)
               (markdown-table-face :foreground ,dracula-pro-pro-purple)
               ;; message
               (message-mml :foreground ,dracula-pro-pro-green :weight normal)
               (message-header-xheader :foreground ,dracula-pro-pro-cyan :weight normal)
               ;; mode-line
               (mode-line :background ,dracula-pro-pro-current
                          :box ,dracula-pro-pro-current :inverse-video nil
                          ,@(if dracula-pro-pro-alternate-mode-line-and-minibuffer
                                (list :foreground dracula-pro-pro-fg3)
                              (list :foreground nil)))
               (mode-line-inactive
                :inverse-video nil
                ,@(if dracula-pro-pro-alternate-mode-line-and-minibuffer
                      (list :foreground dracula-pro-pro-comment :background dracula-pro-pro-bg
                            :box dracula-pro-pro-bg)
                    (list :foreground dracula-pro-pro-fg :background dracula-pro-pro-bg2 :box dracula-pro-pro-bg2)))
               ;; mu4e
               (mu4e-unread-face :foreground ,dracula-pro-pro-pink :weight normal)
               (mu4e-view-url-number-face :foreground ,dracula-pro-pro-purple)
               (mu4e-highlight-face :background ,dracula-pro-pro-bg
                                    :foreground ,dracula-pro-pro-yellow
                                    :extend t)
               (mu4e-header-highlight-face :background ,dracula-pro-pro-current
                                           :foreground ,dracula-pro-pro-fg
                                           :underline nil :weight bold
                                           :extend t)
               (mu4e-header-key-face :inherit message-mml)
               (mu4e-header-marks-face :foreground ,dracula-pro-pro-purple)
               (mu4e-cited-1-face :foreground ,dracula-pro-pro-purple)
               (mu4e-cited-2-face :foreground ,dracula-pro-pro-orange)
               (mu4e-cited-3-face :foreground ,dracula-pro-pro-comment)
               (mu4e-cited-4-face :foreground ,dracula-pro-pro-fg2)
               (mu4e-cited-5-face :foreground ,dracula-pro-pro-fg3)
               ;; org
               (org-agenda-date :foreground ,dracula-pro-pro-cyan :underline nil)
               (org-agenda-dimmed-todo-face :foreground ,dracula-pro-pro-comment)
               (org-agenda-done :foreground ,dracula-pro-pro-green)
               (org-agenda-structure :foreground ,dracula-pro-pro-purple)
               (org-block :foreground ,dracula-pro-pro-orange)
               (org-code :foreground ,dracula-pro-pro-yellow)
               (org-column :background ,dracula-pro-pro-bg4)
               (org-column-title :inherit org-column :weight bold :underline t)
               (org-date :foreground ,dracula-pro-pro-cyan :underline t)
               (org-document-info :foreground ,dracula-pro-pro-alt-blue)
               (org-document-info-keyword :foreground ,dracula-pro-pro-comment)
               (org-document-title :weight bold :foreground ,dracula-pro-pro-orange
                                   ,@(when dracula-pro-pro-enlarge-headings
                                       (list :height dracula-pro-pro-height-doc-title)))
               (org-done :foreground ,dracula-pro-pro-green)
               (org-ellipsis :foreground ,dracula-pro-pro-comment)
               (org-footnote :foreground ,dracula-pro-pro-alt-blue)
               (org-formula :foreground ,dracula-pro-pro-pink)
               (org-headline-done :foreground ,dracula-pro-pro-comment
                                  :weight normal :strike-through t)
               (org-hide :foreground ,dracula-pro-pro-bg :background ,dracula-pro-pro-bg)
               (org-level-1 :inherit bold :foreground ,dracula-pro-pro-pink
                            ,@(when dracula-pro-pro-enlarge-headings
                                (list :height dracula-pro-pro-height-title-1)))
               (org-level-2 :inherit bold :foreground ,dracula-pro-pro-purple
                            ,@(when dracula-pro-pro-enlarge-headings
                                (list :height dracula-pro-pro-height-title-2)))
               (org-level-3 :weight normal :foreground ,dracula-pro-pro-green
                            ,@(when dracula-pro-pro-enlarge-headings
                                (list :height dracula-pro-pro-height-title-3)))
               (org-level-4 :weight normal :foreground ,dracula-pro-pro-yellow)
               (org-level-5 :weight normal :foreground ,dracula-pro-pro-cyan)
               (org-level-6 :weight normal :foreground ,dracula-pro-pro-orange)
               (org-level-7 :weight normal :foreground ,dracula-pro-pro-alt-blue)
               (org-level-8 :weight normal :foreground ,dracula-pro-pro-fg)
               (org-link :foreground ,dracula-pro-pro-cyan :underline t)
               (org-priority :foreground ,dracula-pro-pro-cyan)
               (org-scheduled :foreground ,dracula-pro-pro-green)
               (org-scheduled-previously :foreground ,dracula-pro-pro-yellow)
               (org-scheduled-today :foreground ,dracula-pro-pro-green)
               (org-sexp-date :foreground ,dracula-pro-pro-fg4)
               (org-special-keyword :foreground ,dracula-pro-pro-yellow)
               (org-table :foreground ,dracula-pro-pro-purple)
               (org-tag :foreground ,dracula-pro-pro-pink :weight bold :background ,dracula-pro-pro-bg2)
               (org-todo :foreground ,dracula-pro-pro-orange :weight bold :background ,dracula-pro-pro-bg2)
               (org-upcoming-deadline :foreground ,dracula-pro-pro-yellow)
               (org-warning :weight bold :foreground ,dracula-pro-pro-pink)
               ;; outline
               (outline-1 :foreground ,dracula-pro-pro-pink)
               (outline-2 :foreground ,dracula-pro-pro-purple)
               (outline-3 :foreground ,dracula-pro-pro-green)
               (outline-4 :foreground ,dracula-pro-pro-yellow)
               (outline-5 :foreground ,dracula-pro-pro-cyan)
               (outline-6 :foreground ,dracula-pro-pro-orange)
               ;; powerline
               (powerline-evil-base-face :foreground ,dracula-pro-pro-bg2)
               (powerline-evil-emacs-face :inherit powerline-evil-base-face :background ,dracula-pro-pro-yellow)
               (powerline-evil-insert-face :inherit powerline-evil-base-face :background ,dracula-pro-pro-cyan)
               (powerline-evil-motion-face :inherit powerline-evil-base-face :background ,dracula-pro-pro-purple)
               (powerline-evil-normal-face :inherit powerline-evil-base-face :background ,dracula-pro-pro-green)
               (powerline-evil-operator-face :inherit powerline-evil-base-face :background ,dracula-pro-pro-pink)
               (powerline-evil-replace-face :inherit powerline-evil-base-face :background ,dracula-pro-pro-red)
               (powerline-evil-visual-face :inherit powerline-evil-base-face :background ,dracula-pro-pro-orange)
               ;; rainbow-delimiters
               (rainbow-delimiters-depth-1-face :foreground ,dracula-pro-pro-fg)
               (rainbow-delimiters-depth-2-face :foreground ,dracula-pro-pro-cyan)
               (rainbow-delimiters-depth-3-face :foreground ,dracula-pro-pro-purple)
               (rainbow-delimiters-depth-4-face :foreground ,dracula-pro-pro-pink)
               (rainbow-delimiters-depth-5-face :foreground ,dracula-pro-pro-orange)
               (rainbow-delimiters-depth-6-face :foreground ,dracula-pro-pro-green)
               (rainbow-delimiters-depth-7-face :foreground ,dracula-pro-pro-yellow)
               (rainbow-delimiters-depth-8-face :foreground ,dracula-pro-pro-alt-blue)
               (rainbow-delimiters-unmatched-face :foreground ,dracula-pro-pro-orange)
               ;; rpm-spec
               (rpm-spec-dir-face :foreground ,dracula-pro-pro-green)
               (rpm-spec-doc-face :foreground ,dracula-pro-pro-pink)
               (rpm-spec-ghost-face :foreground ,dracula-pro-pro-purple)
               (rpm-spec-macro-face :foreground ,dracula-pro-pro-yellow)
               (rpm-spec-obsolete-tag-face :inherit font-lock-warning-face)
               (rpm-spec-package-face :foreground ,dracula-pro-pro-purple)
               (rpm-spec-section-face :foreground ,dracula-pro-pro-yellow)
               (rpm-spec-tag-face :foreground ,dracula-pro-pro-cyan)
               (rpm-spec-var-face :foreground ,dracula-pro-pro-orange)
               ;; show-paren
               (show-paren-match-face :background unspecified
                                      :foreground ,dracula-pro-pro-cyan
                                      :weight bold)
               (show-paren-match :background unspecified
                                 :foreground ,dracula-pro-pro-cyan
                                 :weight bold)
               (show-paren-match-expression :inherit match)
               (show-paren-mismatch :inherit font-lock-warning-face)
               ;; slime
               (slime-repl-inputed-output-face :foreground ,dracula-pro-pro-purple)
               ;; spam
               (spam :inherit gnus-summary-normal-read :foreground ,dracula-pro-pro-orange
                     :strike-through t :slant oblique)
               ;; tab-bar & tab-line (since Emacs 27.1)
               (tab-bar :foreground ,dracula-pro-pro-purple :background ,dracula-pro-pro-current
                        :inherit variable-pitch)
               (tab-bar-tab :foreground ,dracula-pro-pro-pink :background ,dracula-pro-pro-bg
                            :box (:line-width 2 :color ,dracula-pro-pro-bg :style nil))
               (tab-bar-tab-inactive :foreground ,dracula-pro-pro-purple :background ,dracula-pro-pro-bg2
                                     :box (:line-width 2 :color ,dracula-pro-pro-bg2 :style nil))
               (tab-line :foreground ,dracula-pro-pro-purple :background ,dracula-pro-pro-current
                         :height 0.9 :inherit variable-pitch)
               (tab-line-tab :foreground ,dracula-pro-pro-pink :background ,dracula-pro-pro-bg
                             :box (:line-width 2 :color ,dracula-pro-pro-bg :style nil))
               (tab-line-tab-inactive :foreground ,dracula-pro-pro-purple :background ,dracula-pro-pro-bg2
                                      :box (:line-width 2 :color ,dracula-pro-pro-bg2 :style nil))
               (tab-line-tab-current :inherit tab-line-tab)
               (tab-line-close-highlight :foreground ,dracula-pro-pro-red)
               ;; term
               (term :foreground ,dracula-pro-pro-fg :background ,dracula-pro-pro-bg)
               (term-color-black :foreground ,dracula-pro-pro-bg :background ,dracula-pro-pro-bg)
               (term-color-blue :foreground ,dracula-pro-pro-purple :background ,dracula-pro-pro-purple)
               (term-color-cyan :foreground ,dracula-pro-pro-cyan :background ,dracula-pro-pro-cyan)
               (term-color-green :foreground ,dracula-pro-pro-green :background ,dracula-pro-pro-green)
               (term-color-magenta :foreground ,dracula-pro-pro-pink :background ,dracula-pro-pro-pink)
               (term-color-red :foreground ,dracula-pro-pro-red :background ,dracula-pro-pro-red)
               (term-color-white :foreground ,dracula-pro-pro-fg :background ,dracula-pro-pro-fg)
               (term-color-yellow :foreground ,dracula-pro-pro-yellow :background ,dracula-pro-pro-yellow)
               ;; undo-tree
               (undo-tree-visualizer-current-face :foreground ,dracula-pro-pro-orange)
               (undo-tree-visualizer-default-face :foreground ,dracula-pro-pro-fg2)
               (undo-tree-visualizer-register-face :foreground ,dracula-pro-pro-purple)
               (undo-tree-visualizer-unmodified-face :foreground ,dracula-pro-pro-fg)
               ;; web-mode
               (web-mode-builtin-face :inherit ,font-lock-builtin-face)
               (web-mode-comment-face :inherit ,font-lock-comment-face)
               (web-mode-constant-face :inherit ,font-lock-constant-face)
               (web-mode-doctype-face :inherit ,font-lock-comment-face)
               (web-mode-function-name-face :inherit ,font-lock-function-name-face)
               (web-mode-html-attr-name-face :foreground ,dracula-pro-pro-purple)
               (web-mode-html-attr-value-face :foreground ,dracula-pro-pro-green)
               (web-mode-html-tag-face :foreground ,dracula-pro-pro-pink :weight bold)
               (web-mode-keyword-face :foreground ,dracula-pro-pro-pink)
               (web-mode-string-face :foreground ,dracula-pro-pro-yellow)
               (web-mode-type-face :inherit ,font-lock-type-face)
               (web-mode-warning-face :inherit ,font-lock-warning-face)
               ;; which-func
               (which-func :inherit ,font-lock-function-name-face)
               ;; whitespace
               (whitespace-big-indent :background ,dracula-pro-pro-red :foreground ,dracula-pro-pro-red)
               (whitespace-empty :background ,dracula-pro-pro-orange :foreground ,dracula-pro-pro-red)
               (whitespace-hspace :background ,dracula-pro-pro-bg3 :foreground ,dracula-pro-pro-comment)
               (whitespace-indentation :background ,dracula-pro-pro-orange :foreground ,dracula-pro-pro-red)
               (whitespace-line :background ,dracula-pro-pro-bg :foreground ,dracula-pro-pro-pink)
               (whitespace-newline :foreground ,dracula-pro-pro-comment)
               (whitespace-space :background ,dracula-pro-pro-bg :foreground ,dracula-pro-pro-comment)
               (whitespace-space-after-tab :background ,dracula-pro-pro-orange :foreground ,dracula-pro-pro-red)
               (whitespace-space-before-tab :background ,dracula-pro-pro-orange :foreground ,dracula-pro-pro-red)
               (whitespace-tab :background ,dracula-pro-pro-bg2 :foreground ,dracula-pro-pro-comment)
               (whitespace-trailing :inherit trailing-whitespace)
               ;; yard-mode
               (yard-tag-face :inherit ,font-lock-builtin-face)
               (yard-directive-face :inherit ,font-lock-builtin-face))))

  (apply #'custom-theme-set-faces
         'dracula-pro-pro
         (let ((color-names (mapcar #'car colors))
               (graphic-colors (mapcar #'cadr colors))
               (term-colors (mapcar #'car (mapcar #'cddr colors)))
               (tty-colors (mapcar #'car (mapcar #'last colors)))
               (expand-for-kind (lambda (kind spec)
                                  (cl-progv color-names kind
                                    (eval `(backquote ,spec))))))
           (cl-loop for (face . spec) in faces
                    collect `(,face
                              ((((min-colors 16777216)) ; fully graphical envs
                                ,(funcall expand-for-kind graphic-colors spec))
                               (((min-colors 256))      ; terminal withs 256 colors
                                ,(funcall expand-for-kind term-colors spec))
                               (t                       ; should be only tty-like envs
                                ,(funcall expand-for-kind tty-colors spec))))))))


;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'dracula-pro-pro)

;; Local Variables:
;; no-byte-compile: t
;; indent-tabs-mode: nil
;; End:

;;; dracula-pro-pro-theme.el ends here

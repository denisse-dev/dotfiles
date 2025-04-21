;;; init.el --- Denisse's Emacs Config 🧠 -*- lexical-binding: t; -*-

;;; Commentary:
;; Clean, modern Emacs configuration inspired by Spacemacs/Doom,
;; without evil-mode, using straight.el and use-package.

;;; Code:

;; 🚀 Bootstrap straight.el and use-package
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 6))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)
(setq straight-use-package-by-default t)

;; ⚙️ Better defaults
(setq inhibit-startup-screen t
      ring-bell-function 'ignore
      make-backup-files nil
      auto-save-default nil
      create-lockfiles nil
      column-number-mode t
      use-short-answers t)

(global-display-line-numbers-mode 1)
(global-hl-line-mode 1)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(set-fringe-mode 10)

;; 🌍 UTF-8 everywhere
(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)

;; 🎨 Dracula Pro Theme (local file)
(add-to-list 'custom-theme-load-path (expand-file-name "themes" user-emacs-directory))
(load-theme 'dracula-pro-pro t)

;; 👁️ Make line numbers and delimiters colorful and bright
(custom-set-faces
 '(line-number ((t (:foreground "#FFCA80" :background nil))))
 '(line-number-current-line ((t (:foreground "#FFFF80" :weight bold :background nil))))
 '(rainbow-delimiters-depth-1-face ((t (:foreground "#FF80BF"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "#9580FF"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "#80FFEA"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "#8AFF80"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "#FFFF80"))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "#FFCA80"))))
 '(rainbow-delimiters-depth-7-face ((t (:foreground "#F8F8F2"))))
 '(rainbow-delimiters-depth-8-face ((t (:foreground "#FF80BF"))))
 '(rainbow-delimiters-unmatched-face ((t (:foreground "#FFAA99" :weight bold))))
 '(rainbow-mode-current-color ((t (:inherit default :background nil))))
 '(show-paren-match ((t (:weight bold :background nil :underline t))))
 '(show-paren-match-expression ((t (:weight bold :background nil :underline t)))))

;; Enable show-paren-mode
(show-paren-mode 1)

;; Matching delimiters with brighter colors
(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode)
  :config
  (setq my/rainbow-delimiters-color-map
        '(("#FF80BF" . "#FF99CC") ; magenta -> bright magenta
          ("#9580FF" . "#AA99FF") ; blue -> bright blue
          ("#80FFEA" . "#99FFEE") ; cyan -> bright cyan
          ("#8AFF80" . "#A2FF99") ; green -> bright green
          ("#FFFF80" . "#FFFF99") ; yellow -> bright yellow
          ("#FFCA80" . "#FFAA99") ; orange -> bright orange
          ("#F8F8F2" . "#FFFFFF"))) ; white -> bright white

  (defun my/update-show-paren-match-face ()
    "Update `show-paren-match` face with a bright variant of the current delimiter color."
    (let* ((depth (car (syntax-ppss)))
           (face-index (and depth (1+ (mod (1- depth) 8))))
           (face-name (and face-index (intern (format "rainbow-delimiters-depth-%d-face" face-index))))
           (normal-color (and face-name (face-foreground face-name)))
           (bright-color (and normal-color (cdr (assoc normal-color my/rainbow-delimiters-color-map)))))
      (when bright-color
        (set-face-attribute 'show-paren-match nil
                            :foreground bright-color
                            :weight 'bold
                            :background nil
                            :underline t))))

  (add-hook 'post-command-hook #'my/update-show-paren-match-face))

;; 🖥️ Tab Bar support (optional)
(tab-bar-mode 1)
(setq tab-bar-show 1)

;; 📟 Modeline
(use-package doom-modeline
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 25)
           (doom-modeline-icon t)
           (doom-modeline-checker-simple-format t)))

;; 🔍 Completion UI
(use-package vertico
  :init (vertico-mode))

(use-package marginalia
  :init (marginalia-mode))

(use-package orderless
  :custom (completion-styles '(orderless basic)))

;; 🧠 Helpful minibuffer
(use-package embark-consult
  :hook (embark-collect-mode . consult-preview-at-point-mode)
  :config
  (setq embark-consult-preview-action nil))
(use-package consult)
(use-package embark)

;; ⌨️ Which-key
(use-package which-key
  :init (which-key-mode))

;; 🗂️ Project Management
(use-package projectile
  :init (projectile-mode 1)
  :custom ((projectile-completion-system 'default))
  :bind-keymap ("C-c p" . projectile-command-map))

;; 🌀 Magit
(use-package magit)

;; 💬 Completion
(use-package company
  :hook (after-init . global-company-mode))

;; ✅ Syntax checking
(use-package flycheck
  :hook (prog-mode . flycheck-mode)
  :config
  (use-package flycheck-popup-tip
    :after flycheck
    :hook (flycheck-mode . flycheck-popup-tip-mode)))

;; ✂️ Snippets
(use-package yasnippet
  :init (yas-global-mode 1))
(use-package yasnippet-snippets)

;; 🖥️ Terminal
(use-package vterm)

;; 🌳 File Tree
(use-package treemacs)

;; 🧾 Org mode enhancements
(use-package org-modern
  :hook (org-mode . org-modern-mode))

;; 🖼️ Dashboard
(use-package dashboard
  :init
  (setq dashboard-startup-banner 'logo
        dashboard-center-content t
        dashboard-items '((recents  . 5)
                          (projects . 5)))
  :config (dashboard-setup-startup-hook))

;; 🧠 Language Server Protocol (LSP)
(use-package lsp-mode
  :commands lsp
  :hook ((python-mode rust-mode go-mode js-mode typescript-mode c-mode c++-mode
          bash-mode sh-mode puppet-mode yaml-mode markdown-mode latex-mode dockerfile-mode) . lsp)
  :custom (lsp-prefer-flymake nil)
  :config (setq lsp-enable-symbol-highlighting t
                lsp-enable-on-type-formatting t
                lsp-enable-snippet t
                lsp-format-on-save t
                lsp-language-id-configuration
                (append lsp-language-id-configuration '((emacs-lisp-mode . "emacs-lisp")))))

(use-package lsp-ui
  :commands lsp-ui-mode
  :custom
  (lsp-ui-sideline-enable t)
  (lsp-ui-doc-enable t)
  (lsp-ui-doc-position 'at-point))

(use-package lsp-treemacs
  :after lsp)

;; 🌳 Tree-sitter support for modern syntax highlighting
(use-package treesit-auto
  :straight (:host github :repo "renzmann/treesit-auto")
  :custom
  (treesit-auto-install 'prompt)
  :config
  (global-treesit-auto-mode))

;; ✨ Formatters
(use-package blacken
  :hook (python-mode . blacken-mode))

(use-package rust-mode
  :hook (rust-mode . (lambda ()
                       (setq rust-format-on-save t))))

(use-package go-mode
  :hook (go-mode . (lambda ()
                     (add-hook 'before-save-hook #'gofmt-before-save nil t))))

(use-package prettier-js
  :hook ((js-mode typescript-mode) . prettier-js-mode))

(use-package sh-script)
(use-package puppet-mode :mode "\\.pp\\'")
(use-package yaml-mode :mode "\\.ya?ml\\'")
(use-package cc-mode)
(use-package dockerfile-mode :mode "Dockerfile\\'\\|\\.dockerfile\\'")

(add-hook 'emacs-lisp-mode-hook #'font-lock-mode)

(use-package colorful-mode
  :hook ((prog-mode) . colorful-mode))

(use-package js
  :mode ("\\.js\\'" . js-mode))
(use-package typescript-mode
  :mode "\\.ts\\'")

(use-package markdown-mode
  :mode "\\.md\\'")

(use-package auctex
  :defer t)

;; 🧠 Visual Helpers
(use-package eldoc-box
  :hook (eldoc-mode . eldoc-box-hover-mode))

;; 🐚 Eshell Goodies
(use-package eshell-git-prompt
  :after eshell
  :config
  (eshell-git-prompt-use-theme 'powerline))

;; 🖼️ Icons
(use-package all-the-icons
  :if (display-graphic-p)
  :config
  (unless (member "all-the-icons" (font-family-list))
    (all-the-icons-install-fonts t)))

(provide 'init)
;;; init.el ends here

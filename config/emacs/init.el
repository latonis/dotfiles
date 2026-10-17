;; -*- lexical-binding: t; -*-

(require 'package)
(setq byte-compile-warnings '(not free-vars unresolved callargs local-vars obsolete native-compiler))
(add-hook 'window-setup-hook #'global-display-line-numbers-mode)
(menu-bar-mode -1)

;; Setup package archives (MELPA)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; Bootstrap use-package if not already installed
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;; Directory settings for backups and auto-saves
(setq auto-save-file-name-transforms
      `((".*" ,(expand-file-name "auto-save/" user-emacs-directory) t)))

(setq backup-directory-alist
      `(("." . ,(expand-file-name "backups/" user-emacs-directory))))

;; Completion (Company)
(use-package company
  :init
  (add-hook 'after-init-hook 'global-company-mode))

;; Language Modes
(use-package elixir-mode)

(use-package rego-mode)

;; LSP Mode & Language Servers
(use-package lsp-mode
  :commands lsp
  :hook ((elixir-mode . lsp)
         (rego-mode . lsp))
  :init
  (setq lsp-auto-guess-root t
        lsp-completion-provider :capf
        lsp-enable-on-type-formatting t)
  :config
  (add-to-list 'lsp-language-id-configuration '(rego-mode . "rego"))

  (lsp-register-client
   (make-lsp-client
    :new-connection (lsp-stdio-connection '("regal" "language-server"))
    :major-modes '(rego-mode)
    :server-id 'regal-lsp)))

(use-package lsp-ui
  :defer t)

;; Theme (Catppuccin Latte - Light)
(use-package catppuccin-theme
  :init
  (setq catppuccin-flavor 'latte
        frame-background-mode 'light)
  :config
  (set-terminal-parameter nil 'background-mode 'light)
  (load-theme 'catppuccin t))

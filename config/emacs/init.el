;; -*- lexical-binding: t; -*-
(require 'package)
(setq byte-compile-warnings '(not free-vars unresolved callargs local-vars obsolete native-compiler))
(add-hook 'window-setup-hook #'global-display-line-numbers-mode)
(menu-bar-mode -1)

; need melpa for most user packages
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(use-package company
  :ensure t
  :init
  (add-hook 'after-init-hook 'global-company-mode))

(use-package elixir-mode
  :ensure t)

(use-package rego-mode
  :ensure t)

(use-package lsp-mode
  :ensure t
  :commands lsp
  :hook ((elixir-mode . lsp)
	 (rego-mode . lsp))
  :config
  (setq lsp-auto-guess-root t)
  (add-to-list 'lsp-language-id-configuration '(rego-mode . "rego"))

  (lsp-register-client
   (make-lsp-client
    :new-connection (lsp-stdio-connection '("regal" "language-server"))
    :major-modes '(rego-mode)
    :server-id 'regal-lsp))
  )

(setq catppuccin-flavor 'latte)   ; 'latte, 'frappe, 'macchiato, or 'mocha


(use-package catppuccin-theme
  :ensure t
  :config
  ;; Force light mode before loading
  (setq frame-background-mode 'light)
  (set-terminal-parameter nil 'background-mode 'light)
  ;; Load the theme (this is the light "Latte" variant)
  (load-theme 'catppuccin t))

(setq lsp-completion-provider :capf)
(setq lsp-enable-on-type-formatting t)

(use-package lsp-ui
  :ensure t
  :defer t)

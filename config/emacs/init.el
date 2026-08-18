(require 'package)

(add-hook 'window-setup-hook #'global-display-line-numbers-mode)
(menu-bar-mode -1)

; need melpa for most user packages
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
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

(use-package elixir-mode
  :ensure t)

(use-package lsp-mode
  :ensure t
  :commands lsp
  :hook (elixir-mode . lsp)
  :init
  )
(use-package lsp-ui)

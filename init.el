;;; init.el -*- lexical-binding: t; -*-

;; ── Package bootstrap ───────────────────────────────────────────────
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

;; ── use-package bootstrap ──────────────────────────────────────────
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(eval-when-compile (require 'use-package))
(setq use-package-always-ensure t)

;; ── Evil ── Vim keybindings ────────────────────────────────────────
(use-package evil
  :init
  (setq evil-want-keybinding t)
  :config
  (evil-mode 1))

;; ── which-key ── keybinding hints ──────────────────────────────────
(use-package which-key
  :config
  (which-key-mode))

;; ── Vertico ── vertical completion ────────────────────────────────
(use-package vertico
  :init
  (vertico-mode))

;; ── Orderless ── flexible matching ────────────────────────────────
(use-package orderless
  :init
  (setq completion-styles '(orderless basic)
        completion-category-defaults nil
        completion-category-overrides '((file (styles partial-completion)))))

;; ── Consult ── search & navigation ────────────────────────────────
(use-package consult
  :bind (("C-s"     . consult-line)
         ("C-x b"   . consult-buffer)
         ("C-x C-f" . consult-find)
         ("M-g g"   . consult-goto-line)
         ("M-g i"   . consult-imenu)
         ("M-s r"   . consult-ripgrep)
         ("M-s g"   . consult-grep)))

;; ── Embark ── context actions ─────────────────────────────────────
(use-package embark
  :bind (("C-." . embark-act)
         ("M-." . embark-dwim))
  :init
  (setq prefix-help-command #'embark-prefix-help-command))

(use-package embark-consult
  :after (embark consult)
  :demand t)

;; ── Marginalia ── richer annotations (pairs with Vertico) ─────────
(use-package marginalia
  :init
  (marginalia-mode))

;; ── Magit ── Git interface ────────────────────────────────────────
(use-package magit
  :bind ("C-x g" . magit-status))

;; ── Projectile ── project navigation ──────────────────────────────
(use-package projectile
  :init
  (projectile-mode)
  :bind-keymap ("C-c p" . projectile-command-map))

;; ── Org-mode ── already built-in; sensible defaults ────────────────
(use-package org
  :ensure nil
  :bind (("C-c a" . org-agenda)
         ("C-c c" . org-capture))
  :config
  (setq org-agenda-files '("~/org")
        org-todo-keywords '((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d)" "CANCELLED(c)"))
        org-log-done 'time))

;; ── Language major modes ───────────────────────────────────────────
(use-package go-mode
  :mode (("\\.go\\'" . go-mode)))

(use-package typescript-mode
  :mode (("\\.ts\\'" . typescript-mode)
         ("\\.tsx\\'" . typescript-mode)))

(use-package elixir-mode
  :mode (("\\.ex\\'" . elixir-mode)
         ("\\.exs\\'" . elixir-mode)))

(use-package markdown-mode
  :mode (("\\.md\\'" . markdown-mode)))

;; ── Eglot ── built-in LSP client ───────────────────────────────────
(use-package eglot
  :ensure nil
  :hook ((go-mode         . eglot-ensure)
         (typescript-mode . eglot-ensure)
         (elixir-mode     . eglot-ensure)
         (markdown-mode   . eglot-ensure)
         (js-mode         . eglot-ensure)
         (python-mode     . eglot-ensure))
  :bind (("C-c l g" . xref-find-definitions)
         ("C-c l r" . xref-find-references)
         ("C-c l i" . eglot-find-implementation)
         ("C-c l t" . eglot-find-typeDefinition)
         ("C-c l R" . eglot-rename)
         ("C-c l a" . eglot-code-actions)
         ("C-c l =" . eglot-format)
         ("C-c l h" . eldoc))
  :config
  (add-to-list 'eglot-server-programs '(markdown-mode . ("marksman")))
  (setq eglot-autoshutdown t)
  (with-eval-after-load 'evil
    (defun eglot-evil-keys ()
      (evil-local-set-key 'normal (kbd "gd") #'xref-find-definitions)
      (evil-local-set-key 'normal (kbd "gD") #'xref-find-references)
      (evil-local-set-key 'normal (kbd "gI") #'eglot-find-implementation)
      (evil-local-set-key 'normal (kbd "gT") #'eglot-find-typeDefinition)
      (evil-local-set-key 'normal (kbd "gR") #'eglot-rename)
      (evil-local-set-key 'normal (kbd "ga") #'eglot-code-actions)
      (evil-local-set-key 'normal (kbd "g=") #'eglot-format)
      (evil-local-set-key 'normal (kbd "K") #'eldoc)
      (evil-local-set-key 'normal (kbd "[g") #'flymake-goto-prev-error)
      (evil-local-set-key 'normal (kbd "]g") #'flymake-goto-next-error))
    (add-hook 'eglot-managed-mode-hook #'eglot-evil-keys)))

;; ── Savehist ── persist minibuffer history across sessions ─────────
(savehist-mode)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(consult embark embark-consult elixir-mode evil go-mode magit marginalia
             markdown-mode orderless projectile typescript-mode use-package
             vertico which-key)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

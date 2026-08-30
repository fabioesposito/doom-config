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

;; ── Savehist ── persist minibuffer history across sessions ─────────
(savehist-mode)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(consult embark embark-consult evil magit marginalia orderless
	     projectile vertico)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

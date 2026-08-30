# Emacs config

Vim-like setup with Evil keybindings throughout.

## Install

Requires Emacs 29+.

```bash
git clone https://github.com/fabioesposito/doom-config.git ~/.emacs.d
```

Launch Emacs — packages install automatically on first start via `use-package`.

## What's enabled

- **Evil** — Vim keybindings
- **which-key** — displays available key combinations
- **Vertico** — vertical completion menus
- **Orderless** — flexible fuzzy matching
- **Consult** — fast searching and navigation
- **Embark** — context-sensitive actions
- **Marginalia** — richer minibuffer annotations
- **Magit** — Git interface
- **Projectile** — project navigation
- **Org-mode** — structured notes and task management
- **Savehist** — persist minibuffer history across sessions

## Keybindings

| Key | Action |
|-----|--------|
| `C-s` | `consult-line` (search in buffer) |
| `C-x b` | `consult-buffer` (switch buffer) |
| `C-x C-f` | `consult-find` (find file) |
| `C-x g` | `magit-status` |
| `M-g g` | `consult-goto-line` |
| `M-g i` | `consult-imenu` |
| `M-s r` | `consult-ripgrep` |
| `M-s g` | `consult-grep` |
| `C-.` | `embark-act` |
| `M-.` | `embark-dwim` |
| `C-c p` | Projectile prefix |
| `C-c a` | `org-agenda` |
| `C-c c` | `org-capture` |

## Configuration

Edit `init.el` and restart Emacs (or `M-x eval-buffer`).

Org files default to `~/org`. Change `org-agenda-files` in `init.el` to customize.

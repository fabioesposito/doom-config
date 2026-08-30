# Emacs config

Evil (vim) keybindings throughout. Two setups available:

- **Vanilla** (`init.el`) — standalone Emacs config with `use-package`
- **Doom** (`config.el` + `packages.el`) — Doom Emacs config (legacy)

## Install

### Vanilla (recommended)

Requires Emacs 29+.

```bash
git clone https://github.com/fabioesposito/doom-config.git ~/.emacs.d
```

Launch Emacs — packages install automatically on first start via `use-package`.

### Doom (legacy)

```bash
git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.emacs.d
~/.emacs.d/bin/doom install

git clone https://github.com/fabioesposito/doom-config.git ~/.config/doom
~/.emacs.d/bin/doom sync
```

---

## Vanilla config (init.el)

Migrated from Neovim (lazy.nvim + catppuccin).

## What's enabled

- **LSP** (lsp-mode) with `+lsp` on: `go`, `javascript`/typescript, `lua`, `markdown`,
  `terraform`, `sh`, `web`, `cc`, `python`. Also `docker`.
- **Format-on-save** (`format +onsave`) via lsp-mode.
- **Tree-sitter** highlighting.
- **Theme**: catppuccin (mocha).
- Completion: corfu + orderless + vertico. Git: magit + vc-gutter. UI: doom-modeline,
  hl-todo, which-key, smartparens/surround, comment.

## Must install manually (in Emacs)

`M-x lsp-install-server` for: `gopls`, `typescript-language-server`,
`lua-language-server`, `marksman`, `terraform-ls`, `docker-ls`, `bash-language-server`.

Formatters/linters (not managed by Doom — install via brew/mise): `gofumpt`,
`goimports`, `prettier`, `stylua`, `golangci-lint`, `eslint_d`, `tflint`,
`hadolint`, `markdownlint`.

Reload config after edits: `SPC h r r`. After editing `init.el`/`packages.el`: `doom sync`.

## Custom keybindings (added in config.el)

| Key | Action |
|-----|--------|
| `C-h` / `C-j` / `C-k` / `C-l` | move to left / down / up / right window |
| `v <` / `v >` | indent (keep visual selection) |
| `v J` / `v K` | move selection down / up |
| `C-c C-k` | LSP signature help |

Note: `C-k` does window-up here; LSP signature help (was `C-k` in Neovim) is on `C-c C-k`.

## Neovim → Doom equivalents

| Neovim | Doom |
|--------|------|
| `<leader>w` save | `:w` / `SPC f s` |
| `<leader>q` quit | `SPC q` (session prefix) |
| `<leader>bn` / `bp` / `bD` | `SPC b n` / `b p` / `b d` |
| `:Neotree` / `Oil` | `SPC .` find-file, `SPC f d` dired, or enable `neotree` |
| Telescope `SPC ff/fg` | `SPC f f` / `SPC s g` (consult) |
| LazyGit | magit: `SPC g g` |
| Trouble | `SPC c l` (lsp diagnostics/trouble-style lists) |
| Flash `s` | `SPC j` (evil-easymotion) / `SPC j j` (avy) |
| Gitsigns hunk ops | `SPC g` (magit) + vc-gutter `SPC g h` hunks |
| Todo comments | `SPC s t` (hl-todo search) / `SPC p s` |

### Doom leader prefixes (cheat)

- `SPC b` buffers · `SPC f` files/find · `SPC p` project · `SPC g` git (magit)
- `SPC c` code/LSP · `SPC w` windows · `SPC q` quit/session · `SPC h` help
- `SPC /` search · `SPC j` jump (avy/easymotion) · `SPC s` search/todo

LSP actions live under `SPC c`: `SPC c a` code action, `SPC c r` rename,
`SPC c d` line diagnostics, `SPC c l` (diagnostics), `gd`/`gD`/`gr`/`gi` jump,
`K` hover, `[e` / `]e` next/prev error.

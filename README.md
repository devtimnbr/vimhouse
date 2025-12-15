# vimhouse

My personal NeoVim configuration built with [NixVim](https://github.com/nix-community/nixvim). This is a straightforward setup that provides a solid development environment without any complex optimizations.

## About

This is essentially a collection of my favorite NeoVim plugins and configurations managed declaratively with Nix. It's not trying to be the fastest or most minimal - just a comfortable setup for daily coding.

## Features

### UI & Visuals
- **Statusline:** [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) for a clean statusline
- **Notifications:** [noice.nvim](https://github.com/folke/noice.nvim) for better message display
- **Keybinding help:** [which-key.nvim](https://github.com/folke/which-key.nvim) to show available keybindings

### Development Tools
- **Autocompletion:** [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) with LSP and snippet sources
- **LSP:** Full language server support via [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
- **Code quality:** [conform.nvim](https://github.com/stevearc/conform.nvim) for formatting and [nvim-lint](https://github.com/mfussenegger/nvim-lint) for linting
- **Git:** [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) for git signs and [diffview.nvim](https://github.com/sindrets/diffview.nvim) for diffing
- **Terminal:** [toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim) for terminal management

## Usage

Run this configuration with:

```bash
nix run github:devtimnbr/vimhouse
```

Or if you've cloned it locally:

```bash
nix run .
```

## Keybindings

The leader key is set to `Space`. Here are the main keybindings:

| Keybinding      | Description                   |
| --------------- | ----------------------------- |
| `<leader>r`     | Rename word under cursor      |
| `<leader>uw`    | Toggle word wrap              |
| `<leader>cr`    | Copy relative path            |
| `<S-h>`/`<S-l>` | Previous/Next buffer          |
| `<leader>bd`    | Delete buffer                 |
| `<leader>b`     | New buffer                    |
| `<leader>x`     | Close buffer                  |
| `<leader>B`     | New terminal in a buffer      |
| `<leader>T`     | New terminal in a tab         |
| `<C-h/j/k/l>`   | Navigate between windows      |
| `<leader>gg`    | Open lazygit                  |
| `<leader>gd`    | Open git diff                 |

## Configuration Structure

```
nvim/
├── autocmd.nix
├── default.nix
├── filetype.nix
├── keymap.nix
├── options.nix
└── plugins/
    ├── git/
    ├── lsp/
    └── ...
```

- `default.nix`: Main configuration entry point
- `options.nix`: General NeoVim settings
- `keymap.nix`: Global keybindings
- `autocmd.nix`: Auto commands
- `filetype.nix`: File-specific settings
- `plugins/`: Plugin configurations organized by category

## Notes

This is a personal configuration that works for me. It might not be optimized for your workflow or preferences. Feel free to fork and adjust it to your needs.
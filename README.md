# vimhouse

Welcome to `vimhouse`, my personal NeoVim configuration meticulously crafted with [NixVim](httpss://github.com/nix-community/nixvim). This setup is designed to be a fast, efficient, and enjoyable development environment, balancing powerful features with a clean, minimalist aesthetic.

## Philosophy

The goal of this configuration is to provide a powerful and extensible NeoVim experience managed declaratively with Nix. This approach ensures reproducibility and simplifies the management of plugins and their configurations.

## Features

This configuration is packed with features to enhance the development workflow. Here are some of the highlights:

### 🚀 Fast and Efficient

The configuration is optimized for performance. Lazy loading of plugins and a careful selection of lightweight alternatives ensure that NeoVim starts quickly and remains responsive.

### ✨ Modern UI

A beautiful and functional UI is achieved through a combination of plugins:
- **Statusline:** [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) provides a sleek and informative statusline.
- **Tabline:** [barbar.nvim](https://github.com/romgrk/barbar.nvim) for a powerful and customizable tabline.
- **Notifications:** [noice.nvim](https://github.com/folke/noice.nvim) to display messages in a more modern and less intrusive way.
- **Keybinding Hints:** [which-key.nvim](https://github.com/folke/which-key.nvim) helps you discover and remember keybindings.

### 💻 Development Powerhouse

- **Autocompletion:** [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) provides a fast and extensible autocompletion engine, with sources for LSP, snippets, and more.
- **LSP:** Full-featured LSP support for diagnostics, code actions, and more, powered by [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig).
- **Formatting and Linting:** [conform.nvim](https://github.com/stevearc/conform.nvim/tree/master) and [nvim-lint](https://github.com/mfussenegger/nvim-lint) keep your code clean and consistent.
- **Git Integration:** [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) for git decorations and [diffview.nvim](https://github.com/sindrets/diffview.nvim) for a beautiful diffing experience.
- **Terminal:** [toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim) provides a powerful and easy-to-use terminal manager.

## Usage

To run this configuration, you can use the following command:

```bash
nix run github:devtimnbr/vimhouse
```

## Keybindings

The leader key is set to `Space`. Here are some of the most important keybindings:

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

For a complete list of keybindings, please refer to the `nvim/keymap.nix` file.

## Configuration Structure

The configuration is organized as follows:

```
nvim
├── autocmd.nix
├── default.nix
├── filetype.nix
├── keymap.nix
├── options.nix
└── plugins
    ├── ...
```

- `default.nix`: The main entry point for the configuration.
- `options.nix`: General NeoVim options.
- `keymap.nix`: Global keybindings.
- `autocmd.nix`: Autocommands.
- `filetype.nix`: Filetype specific configurations.
- `plugins/`: All plugin configurations, neatly organized into individual files.

This structure makes it easy to find and modify specific parts of the configuration.

## Contributing

This is a personal configuration, but feel free to open an issue or pull request if you have any suggestions or find any bugs.
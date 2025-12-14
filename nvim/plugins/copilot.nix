{
  # GitHub Copilot
  # https://nix-community.github.io/nixvim/plugins/copilot-lua.html
  plugins.copilot-lua = {
    enable = true;

    # Settings for Copilot
    settings = {
      # Auto start Copilot when Neovim starts
      auto_start = true;

      # Suggestions panel
      suggestion = {
        # Show suggestions automatically
        auto_trigger = true;

        # Debounce time in milliseconds
        debounce = 75;

        # Keymap to accept suggestion
        keymap = {
          # Accept suggestion
          accept = "<C-y>";

          # Accept next word
          accept_word = false;

          # Accept line
          accept_line = false;

          # Next suggestion
          next = "<M-]>";

          # Previous suggestion
          prev = "<M-[>";

          # Dismiss suggestion
          dismiss = "<C-]>";
        };
      };

      # File types to disable Copilot
      filetypes = {
        ["*"] = true;
        ["markdown"] = false;
        ["text"] = false;
        ["gitcommit"] = false;
        ["gitrebase"] = false;
        ["hgcommit"] = false;
        ["svn"] = false;
        ["cvs"] = false;
        ["."] = false;
      };
    };
  };
}
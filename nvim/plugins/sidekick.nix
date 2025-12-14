{
  plugins.sidekick = {
    enable = true;
    settings = {
      # Optional: configure any settings here
      # jump = {
      #   jumplist = true;
      # };
      # signs = {
      #   enabled = true;
      # };
      # cli = {
      #   watch = true;
      # };
    };
  };

  keymaps = [
    {
      mode = "i";
      key = "<Tab>";
      action.__raw = ''
        function()
          -- Try to jump to or apply next edit suggestion
          if require("sidekick").nes_jump_or_apply() then
            return
          end

          -- If you're using Neovim's native inline completions
          if vim.lsp.inline_completion.get() then
            return vim.lsp.inline_completion.get()
          end

          -- Any other tab behavior (like cmp or snippets) goes here
          -- fall back to normal tab
          return "<Tab>"
        end
      '';
      options = {
        expr = true;
        desc = "Goto/Apply Next Edit Suggestion";
      };
    }
    {
      mode = [ "n" "t" "i" "x" ];
      key = "<C-.>";
      action.__raw = ''function() require("sidekick").toggle() end'';
      options.desc = "Sidekick Toggle";
    }
    {
      mode = "n";
      key = "<leader>aa";
      action.__raw = ''function() require("sidekick.cli").toggle() end'';
      options.desc = "Sidekick Toggle CLI";
    }
    {
      mode = "n";
      key = "<leader>as";
      action.__raw = ''function() require("sidekick.cli").select() end'';
      options.desc = "Sidekick Select Tool";
    }
    {
      mode = "n";
      key = "<leader>ac";
      action.__raw = ''function() require("sidekick.cli").close() end'';
      options.desc = "Sidekick CLI Close";
    }
    {
      mode = [ "x" "n" ];
      key = "<leader>at";
      action.__raw = ''function() require("sidekick.cli").send({ msg = "{file}" }) end'';
      options.desc = "Sidekick Send This";
    }
    {
      mode = [ "x" "n" ];
      key = "<leader>av";
      action.__raw = ''function() require("sidekick.cli").send({ msg = "{selection}" }) end'';
      options.desc = "Sidekick Send Visual Selection";
    }
    {
      mode = "n";
      key = "<leader>ap";
      action.__raw = ''function() require("sidekick.cli").prompt() end'';
      options.desc = "Sidekick Prompt";
    }
    # Example keybinding to open Claude specifically
    {
      mode = "n";
      key = "<leader>ac";
      action.__raw = ''function() require("sidekick.cli").toggle({ name = "claude" }) end'';
      options.desc = "Sidekick Toggle Claude";
    }
    # NES (Next Edit Suggestion) keymaps
    {
      mode = "n";
      key = "<leader>en";
      action.__raw = ''function() require("sidekick.nes").jump() end'';
      options.desc = "Sidekick NES Jump";
    }
    {
      mode = "n";
      key = "<leader>ea";
      action.__raw = ''function() require("sidekick.nes").apply() end'';
      options.desc = "Sidekick NES Apply";
    }
    {
      mode = "n";
      key = "<leader>ec";
      action.__raw = ''function() require("sidekick.nes").clear() end'';
      options.desc = "Sidekick NES Clear";
    }
    {
      mode = "n";
      key = "<leader>et";
      action.__raw = ''function() require("sidekick.nes").toggle() end'';
      options.desc = "Sidekick NES Toggle";
    }
  ];

}

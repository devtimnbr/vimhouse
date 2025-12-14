{

  plugins.lazygit = {
    enable = true;
    settings = {
      keymaps = {
        quit = "q";
      };
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>gg";
      action.__raw = ''function() require("lazygit").lazygit() end'';
      options.desc = "Lazygit";
    }
    {
      mode = "n";
      key = "<leader>gG";
      action.__raw = ''function()
        local cwd = vim.fn.getcwd()
        require("lazygit").lazygit({ cwd = cwd })
      end'';
      options.desc = "Lazygit (cwd)";
    }
  ];

}

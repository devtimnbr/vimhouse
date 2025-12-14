{

  plugins.toggleterm = {
    enable = true;
    settings = {
      autochdir = true;
      direction = "float";
      float_opts.border = "curved";
      open_mapping = "[[<c-\\>]]";
      size.__raw = ''
        function(term)
          if term.direction == "horizontal" then
            return 20
          elseif term.direction == "vertical" then
            return vim.o.columns * 0.4
          end
        end
      '';
    };
  };

  extraConfigLua = ''
    -- LazyVim style terminal mappings
    map("n", "<leader>ft", "<Cmd>ToggleTerm<CR>", { desc = "Terminal (Root Dir)" })
    map("n", "<leader>fT", "<Cmd>ToggleTerm direction=float<CR>", { desc = "Terminal (Float)" })
    map("n", "<C-/>", "<Cmd>ToggleTerm<CR>", { desc = "Terminal" })
    map({"n","t"}, "<c-_>", "<Cmd>ToggleTerm<CR>", { desc = "which_key_ignore" })
    map("t", "<esc><esc>", "<C-\\><C-n>", { desc = "Terminal exit" })
  '';

}

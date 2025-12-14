{

  plugins.undotree.enable = true;

  extraConfigLua = ''
    -- LazyVim style terminal mappings
    map("n", "<leader>ut", "<Cmd>UndotreeToggle<CR>", { desc = "Undotree Toggle" })
    map("n", "<leader>uf", "<Cmd>UndotreeFocus<CR>", { desc = "Undotree Show" })
  '';
}

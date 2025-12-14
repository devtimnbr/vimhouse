{

  plugins.markdown-preview.enable = true;

  extraConfigLua = # lua
    ''
      vim.g.mkdp_port = "9898"
      map("n", "<leader>cp", "<Cmd>MarkdownPreview<CR>", { desc = "Markdown Preview" })
    '';

}

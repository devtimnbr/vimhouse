{

  plugins.which-key = {
    enable = true;
    settings.icons.mappings = false;
  };

  extraConfigLua = # lua
    ''
      require("which-key").add {
        { "<leader>b", group = "+buffer" },
        { "<leader>c", group = "+copy" },
        { "<leader>g", group = "+git" },
        { "<leader>h", group = "+harpoon" },
        { "<leader>l", group = "+lsp" },
        { "<leader>n", group = "+notes" },
        { "<leader>s", group = "+find" },
        { "<leader>sg", group = "+git" },
        { "<leader>sl", group = "+lsp" },
        { "<leader>t", group = "+toggle" },
        { "<leader>u", group = "+ui" },
        { "<leader>w", group = "+window" },
        { "gz", group = "+flash" },
      }
    '';

/*   highlightOverride.WhichKeyNormal = {
    fg = "#cad3f5";
    bg = "#1e2030";
  }; */

}

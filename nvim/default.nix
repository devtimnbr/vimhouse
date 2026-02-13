{ pkgs, config, lib, ... }:
let
  stylixEnabled = config.stylix.enable or false;
in
{

  imports = [
    ./plugins
    ./autocmd.nix
    ./filetype.nix
    ./keymap.nix
    ./options.nix
  ];

  extraPackages = with pkgs; [ xclip ];

  clipboard.register = "unnamedplus";

  extraConfigLuaPost = lib.mkIf (!stylixEnabled) ''
    local colorscheme_file = vim.fn.expand("~/.config/nixvim-colorscheme")
    local file = io.open(colorscheme_file, "r")
    if file then
      local saved_colorscheme = file:read("*a"):gsub("%s+", "")
      file:close()
      local ok, _ = pcall(vim.cmd, "colorscheme " .. saved_colorscheme)
      if not ok then
        vim.notify("Colorscheme '" .. saved_colorscheme .. "' not found, using gruvbox", vim.log.levels.WARN)
      end
    end
  '';

  
}

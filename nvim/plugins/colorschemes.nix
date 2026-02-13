{ config, lib, ... }:

let
  stylixEnabled = config.stylix.enable or false;
in
{
  colorschemes = lib.mkIf (!stylixEnabled) {
    gruvbox = {
      enable = true;
      settings = {
        transparent_mode = true;
      };
    };
    gruvbox-material.enable = true;
    gruvbox-material-nvim.enable = true;
    catppuccin.enable = true;
    tokyonight.enable = true;
    kanagawa.enable = true;
    rose-pine.enable = true;
  };

  colorscheme = lib.mkIf (!stylixEnabled) "gruvbox";
}

{ lib, ... }:

{
  plugins = {
    alpha = {
      enable = true;
      theme = "dashboard";
/*       layout = [
        {
          type = "padding";
          val = 2;
        }
        {
          opts = {
            hl = "Type";
            position = "center";
          };
          type = "text";
          val = [
            "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣶⣶⣶⣶⣤⣤⣄⡀⠀⠀⢀⣐⠋⢉⡛⢋⣩⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⣄⠀⠀"
            "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣶⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣄"
            "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣛⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿"
            "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡏⠻⣟⠻⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠛⠏⣩⣔⠊⠙⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿"
            "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠃⠀⠀⠙⢦⡀⠈⣙⡿⡿⠋⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠙⠛⠥⢤⣠⡴⠏⠉⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿"
            "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠉⠘⢉⣠⡴⠖⠒⠲⢤⣀⡀⠀⠀⠀⣀⡴⠖⠋⠑⠲⢦⣄⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿"
            "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡆⠀⠀⠀⠀⢀⣴⠟⠁⠀⠀⠀⠀⠀⠀⠉⠛⠚⠋⠁⠀⠀⠀⠀⠀⠀⠈⠻⣦⡀⠀⠀⠀⠀⢰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿"
            "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⣴⠟⠀⢀⣠⣤⡤⢤⣄⡀⠀⠀⠀⠀⠀⠀⠠⠤⠤⠤⠤⠤⣄⡀⠈⠻⣆⠀⠀⠀⣸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿"
            "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡗⠀⠀⡼⠃⠀⠚⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣧⠀⠀⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿"
            "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⡇⠀⣸⠃⠀⠀⠀⠀⠀⠀⠀⣰⣷⡤⠤⠤⠤⠤⠤⠤⢤⣾⣆⠀⠀⠀⠀⠀⠀⠀⠀⠘⡆⠀⢈⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿"
            "⣿⣿⣿⣿⣿⠿⠛⠛⠛⠻⠿⣿⣿⣿⣷⡿⣄⣿⠸⡀⠀⠀⠀⠀⠀⠀⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠀⠀⠀⠀⠀⠀⠀⠀⣠⣿⢀⡞⣿⣿⡿⠟⠋⠉⠉⠉⠉⠙⠻⣿⣿⣿⣿"
            "⣿⣿⣿⣋⣀⠀⢀⣄⡀⢀⣄⠀⢙⣿⣏⠰⣿⡧⠀⠱⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⠃⣿⡜⡁⣼⣿⣧⡀⢀⡤⣭⣃⣠⣤⡀⣠⣽⣿⣿"
          ];
        }
        {
          type = "padding";
          val = 2;
        }
        {
          type = "group";
          val = [
            {
              on_press = lib.nixvim.mkRaw "function() require('telescope.builtin').find_files() end";
              opts = {
                shortcut = "f";
                position = "center";
              };
              type = "button";
              val = "  Find File";
            }
            {
              on_press = lib.nixvim.mkRaw "function() vim.cmd[[ene]] end";
              opts = {
                shortcut = "n";
                position = "center";
              };
              type = "button";
              val = "  New File";
            }
            {
              on_press = lib.nixvim.mkRaw "function() require('telescope').extensions.project.project{} end";
              opts = {
                shortcut = "p";
                position = "center";
              };
              type = "button";
              val = "  Projects";
            }
            {
              on_press = lib.nixvim.mkRaw "function() require('telescope.builtin').live_grep() end";
              opts = {
                shortcut = "g";
                position = "center";
              };
              type = "button";
              val = "  Find Text";
            }
            {
              on_press = lib.nixvim.mkRaw "function() require('telescope.builtin').oldfiles() end";
              opts = {
                shortcut = "r";
                position = "center";
              };
              type = "button";
              val = "  Recent Files";
            }
            {
              on_press = lib.nixvim.mkRaw "function() vim.cmd[[e ~/.config/nixvim/nixvim.lua]] end";
              opts = {
                shortcut = "c";
                position = "center";
              };
              type = "button";
              val = "  Config";
            }
            {
              on_press = lib.nixvim.mkRaw "function() require('persistence').load() end";
              opts = {
                shortcut = "s";
                position = "center";
              };
              type = "button";
              val = "  Restore Session";
            }
            {
              on_press = lib.nixvim.mkRaw "function() vim.cmd[[LazyExtras]] end";
              opts = {
                shortcut = "x";
                position = "center";
              };
              type = "button";
              val = "  Lazy Extras";
            }
            {
              on_press = lib.nixvim.mkRaw "function() vim.cmd[[Lazy]] end";
              opts = {
                shortcut = "l";
                position = "center";
              };
              type = "button";
              val = "󰒲  Lazy";
            }
            {
              on_press = lib.nixvim.mkRaw "function() vim.cmd[[qa]] end";
              opts = {
                shortcut = "q";
                position = "center";
              };
              type = "button";
              val = "  Quit";
            }
          ];
        }
        {
          type = "padding";
          val = 2;
        }
        {
          opts = {
            hl = "Keyword";
            position = "center";
          };
          type = "text";
          val = "Inspiring quote here.";
        }
        {
          type = "padding";
          val = 1;
        }
        {
          opts = {
            hl = "SpecialComment";
            position = "center";
          };
          type = "text";
          val = "  Recent Files";
        }
        {
          type = "group";
          val = [
            {
              on_press = lib.nixvim.mkRaw "function() vim.cmd[[edit ~/C/f/m/h/p/n/c/l/p/dash.lua]] end";
              opts = {
                hl = "Normal";
                position = "center";
              };
              type = "button";
              val = "  󰢱  ~/C/f/m/h/p/n/c/l/p/dash.lua";
              shortcut = "1";
            }
            {
              on_press = lib.nixvim.mkRaw "function() vim.cmd[[edit ~/Code/nixvim-config/nvim/plugins/dashboard.nix]] end";
              opts = {
                hl = "Normal";
                position = "center";
              };
              type = "button";
              val = "  󱄅  ~/Code/nixvim-config/nvim/plugins/dashboard.nix";
              shortcut = "2";
            }
            {
              on_press = lib.nixvim.mkRaw "function() vim.cmd[[edit ~/C/f/m/h/p/s/default.nix]] end";
              opts = {
                hl = "Normal";
                position = "center";
              };
              type = "button";
              val = "  󱄅  ~/C/f/m/h/p/s/default.nix";
              shortcut = "3";
            }
            {
              on_press = lib.nixvim.mkRaw "function() vim.cmd[[edit ~/Code/nixvim-config/nvim/plugins/nvim-autopairs.nix]] end";
              opts = {
                hl = "Normal";
                position = "center";
              };
              type = "button";
              val = "  󱄅  ~/Code/nixvim-config/nvim/plugins/nvim-autopairs.nix";
              shortcut = "4";
            }
            {
              on_press = lib.nixvim.mkRaw "function() vim.cmd[[edit ~]] end";
              opts = {
                hl = "Normal";
                position = "center";
              };
              type = "button";
              val = "  󰉋  ~";
              shortcut = "5";
            }
          ];
        }
      ]; */
    };
  };
}


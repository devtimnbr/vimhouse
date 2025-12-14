{ pkgs, ... }:
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

  # Load saved colorscheme after plugins load
  extraConfigLuaPost = ''
    -- Load saved colorscheme if it exists (run after all plugins are loaded)
    vim.defer_fn(function()
      local colorscheme_file = vim.fn.expand("~/.config/nixvim-colorscheme")
      local file = io.open(colorscheme_file, "r")
      if file then
        local saved_colorscheme = file:read("*a"):gsub("%s+", "")
        file:close()
        -- Check if the colorscheme is available
        local ok, _ = pcall(vim.cmd, "colorscheme " .. saved_colorscheme)
        if not ok then
          vim.notify("Colorscheme '" .. saved_colorscheme .. "' not found, using gruvbox", vim.log.levels.WARN)
        end
      end
    end, 100) -- Delay to ensure all colorschemes are loaded
  '';

  
}

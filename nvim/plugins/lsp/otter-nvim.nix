{

  plugins.otter = {
    enable = true;
    settings = {
      handle_leaves = true;
      buffers = {
        set_filetype = true;
      };
    };
  };
  autoCmd = [
    {
      event = [ "BufEnter" ];
      pattern = [ "*.nix" ];
      # Defer otter activation to avoid conflict with diffview
      callback = ''
        function()
          -- Don't activate in diff buffers or special buffers
          if vim.bo.buftype == "" or vim.bo.filetype == "nix" then
            vim.defer_fn(function()
              require("otter").activate({"python", "lua", "bash"}, true, true, nil)
            end, 100)
          end
        end
      '';
    }
    # Prevent otter from interfering with diffview buffers
    {
      event = [ "FileType" ];
      pattern = [ "DiffviewFiles" "diff" "git" ];
      callback = ''
        function()
          vim.b.otter_inactive = true
        end
      '';
    }
  ];

}

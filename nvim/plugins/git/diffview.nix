{ lib, ... }:
{

  plugins.diffview = {
    enable = true;

    settings.keymaps =
      let
        closeDiffviewMap = [
          {
            key = "q";
            mode = "n";
            action = "<Cmd>DiffviewClose<CR>";
            description = "Close Diffview";
          }
        ];
        diffviewContexts = [
          "diff1"
          "diff2"
          "diff3"
          "diff4"
          "file_history_panel"
          "file_panel"
          "view"
        ];
      in
      lib.genAttrs diffviewContexts (_contextName: closeDiffviewMap);

  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>gd";
      action = "<Cmd>DiffviewOpen<CR>";
      options.desc = "Git Diff (working directory)";
    }
    {
      mode = "n";
      key = "<leader>gc";
      action = "<Cmd>DiffviewClose<CR>";
      options.desc = "Git Diff Close";
    }
    {
      mode = "n";
      key = "<leader>gh";
      action = "<Cmd>DiffviewFileHistory %<CR>";
      options.desc = "Git History (current file)";
    }
    {
      mode = "n";
      key = "<leader>gH";
      action = "<Cmd>DiffviewFileHistory<CR>";
      options.desc = "Git History (all files)";
    }
    {
      mode = "v";
      key = "<leader>gd";
      action = "<Cmd>'<,'>DiffviewFileHistory<CR>";
      options.desc = "Git History (selection)";
    }
  ];

}

{ config, pkgs, ... }:
{

  extraPackages = with pkgs; [ ghostscript_headless ]; # NOTE: pdf preview in picker

  plugins = {

    lsp.servers.lua_ls.settings.diagnostics.globals = [ "Snacks" ];

    snacks = {
      enable = true;
      settings = {
        bigfile.enabled = true;
        image.enabled = true;
        input.enabled = true;
        explorer.enabled = true;
        notifier = {
          enabled = true;
          timeout = 6000;
        };
        picker = {
          enabled = true;
          sources = {
            files = {
              hidden = true;
            };
            projects = {
              dev = [ "~/repos" ];
              max_depth = 5;
              inherit (config.plugins.project-nvim.settings) patterns;
            };
          };
          matcher = {
            cwd_bonus = true;
            frecency = true;
            history_bonus = true;
          };
        };
        statuscolumn.enabled = true;
        toggle.enable = true; # TODO: integrate with which-key https://github.com/folke/snacks.nvim/blob/main/docs/toggle.md
        words.enabled = false;
      };
    };

  };

  extraConfigLuaPost = ''
    local colors = vim.g.colors_name == "gruvbox"
        and {
          dark0 = "#1d2021",
          dark1 = "#3c3836",
          dark2 = "#504945",
          dark3 = "#665c54",
          dark4 = "#7c6f64",
          light0 = "#fbf1c7",
          light1 = "#ebdbb2",
          light2 = "#d5c4a1",
          light3 = "#bdae93",
          light4 = "#a89984",
          bright_red = "#fb4934",
          bright_green = "#b8bb26",
          bright_yellow = "#fabd2f",
          bright_blue = "#83a598",
          bright_purple = "#d3869b",
          bright_aqua = "#8ec07c",
          bright_orange = "#fe8019",
          neutral_red = "#cc241d",
          neutral_green = "#98971a",
          neutral_yellow = "#d79921",
          neutral_blue = "#458588",
          neutral_purple = "#b16286",
          neutral_aqua = "#689d6a",
          neutral_orange = "#d65d0e",
        }
      or {}

    local PickerColor = {
      SnacksPickerBox = { bg = colors.dark0 or "#1d2021" },
      SnacksPickerBoxBorder = { bg = colors.dark0 or "#1d2021", fg = colors.dark0 or "#1d2021" },
      SnacksPickerBoxTitle = { bg = colors.bright_purple or "#d3869b", fg = colors.dark0 or "#1d2021" },
      SnacksPickerInput = { bg = colors.dark0 or "#1d2021" },
      SnacksPickerInputBorder = { bg = colors.dark0 or "#1d2021", fg = colors.dark1 or "#3c3836" },
      SnacksPickerList = { bg = colors.dark0 or "#1d2021" },
      SnacksPickerListBorder = { bg = colors.dark0 or "#1d2021", fg = colors.dark0 or "#1d2021" },
      SnacksPickerListTitle = { fg = colors.dark0 or "#1d2021" },
      SnacksPickerPreview = { bg = colors.dark0 or "#1d2021" },
      SnacksPickerPreviewBorder = { bg = colors.dark0 or "#1d2021", fg = colors.dark0 or "#1d2021" },
      SnacksPickerPreviewTitle = { bg = colors.bright_green or "#b8bb26", fg = colors.dark0 or "#1d2021" },
    }

    for hl, col in pairs(PickerColor) do
      vim.api.nvim_set_hl(0, hl, col)
    end

    -- explorer
    map("n", "<leader>e", "<Cmd>lua Snacks.explorer()<CR>", { desc = "File Explorer" })
    -- find - using leader s
    map("n", "<leader><leader>", "<Cmd>lua Snacks.picker.smart()<CR>", { desc = "Find Files" })
    map("n", "<leader>uC", function()
      Snacks.picker.colorschemes {
        preset = "vertical",
        confirm = function(picker, item)
          picker:close()
          if item then
            -- Clear the preview colorscheme
            picker.preview.state.colorscheme = nil
            vim.schedule(function()
              vim.cmd("colorscheme " .. item.text)
              -- Save the colorscheme preference
              vim.fn.writefile({ item.text }, vim.fn.expand "~/.config/nixvim-colorscheme")
            end)
          end
        end,
      }
    end, { desc = "Colorschemes" })
    map("n", "<leader>sf", "<Cmd>lua Snacks.picker.smart()<CR>", { desc = "Files" })
    map("n", "<leader>sr", "<Cmd>lua Snacks.picker.recent()<CR>", { desc = "Recent files" })
    map("n", "<leader>sb", "<Cmd>lua Snacks.picker.buffers()<CR>", { desc = "Buffers" })

    -- grep
    map("n", "<leader>sg", "<Cmd>lua Snacks.picker.grep()<CR>", { desc = "Grep" })
    map("n", "<leader>sG", "<Cmd>lua Snacks.picker.grep_buffers()<CR>", { desc = "Grep (open buffers)" })
    map("n", "<leader>sz", "<Cmd>lua Snacks.picker.lines()<CR>", { desc = "Grep (buffer)" })
    map("n", "<leader>st", "<Cmd>lua Snacks.picker.todo_comments()<CR>", { desc = "TODOs" })

    -- search
    map("n", "<leader>sh", "<Cmd>lua Snacks.picker.help()<CR>", { desc = "Help" })
    map("n", "<leader>sk", "<Cmd>lua Snacks.picker.keymaps()<CR>", { desc = "Keymaps" })
    map("n", "<leader>sH", "<Cmd>lua Snacks.picker.highlights()<CR>", { desc = "Highlights" })
    map("n", "<leader>sn", "<Cmd>lua Snacks.picker.notifications()<CR>", { desc = "Notifications" })
    map("n", "<leader>sc", "<Cmd>lua Snacks.picker.command_history()<CR>", { desc = "Command history" })

    -- git under leader sg
    -- map("n", "<leader>sgc", "<Cmd>lua Snacks.picker.git_log_file()<CR>", { desc = "Git commits (buffer)" })
    -- map("n", "<leader>sgC", "<Cmd>lua Snacks.picker.git_log()<CR>", { desc = "Git commit" })
    -- map("n", "<leader>sgs", "<Cmd>lua Snacks.picker.git_status()<CR>", { desc = "Git status" })
    -- map("n", "<leader>sgS", "<Cmd>lua Snacks.picker.git_stash()<CR>", { desc = "Git stash" })
    -- map("n", "<leader>sgb", "<Cmd>lua Snacks.picker.git_branches()<CR>", { desc = "Git branches" })

    Snacks.toggle.option("spell", { name = "Spelling" }):map "<leader>ts"
    Snacks.toggle.option("wrap", { name = "Wrap" }):map "<leader>tw"
    Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map "<leader>tL"
    Snacks.toggle.diagnostics():map "<leader>td"
    Snacks.toggle.line_number():map "<leader>tl"
    Snacks.toggle
      .option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2, name = "Conceal Level" })
      :map "<leader>tc"
    Snacks.toggle
      .option("showtabline", { off = 0, on = vim.o.showtabline > 0 and vim.o.showtabline or 2, name = "Tabline" })
      :map "<leader>tA"
    Snacks.toggle.treesitter():map "<leader>tT"
    Snacks.toggle.dim():map "<leader>tD"
    Snacks.toggle.animate():map "<leader>ta"
    Snacks.toggle.indent():map "<leader>ti"
    Snacks.toggle.scroll():map "<leader>tS"
    Snacks.toggle
      .new({
        id = "auto_formatting",
        name = "Auto Formatting",
        get = function()
          return vim.g.autoformat or false
        end,
        set = function(state)
          vim.g.autoformat = state
        end,
      })
      :map "<leader>tf"
  '';

}

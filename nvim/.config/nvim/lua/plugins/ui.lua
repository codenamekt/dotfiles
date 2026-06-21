return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    opts = {
      options = {
        theme = "catppuccin-mocha",
        icons_enabled = true,
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = {
          statusline = { "dashboard", "alpha" },
          winbar = {},
        },
      },
      sections = {
        lualine_a = { { "mode", icon = "" } },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { { "filename", path = 1 } },
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
    },
  },
  {
    "akinsho/bufferline.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    opts = {
      options = {
        theme = "catppuccin",
        mode = "buffers",
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level)
          local icon = level:lower():match("error") and " " or " "
          return " " .. icon .. count
        end,
        offsets = {
          {
            filetype = "oil",
            text = "Oil",
            highlight = "Directory",
            text_align = "left",
          },
        },
        show_buffer_close_icons = false,
        show_close_icon = false,
        separator_style = "slant",
        always_show_bufferline = false,
      },
    },
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = { "Trouble", "TroubleToggle", "TroubleRefresh" },
    keys = {
      { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics (Trouble)" },
      { "<leader>xw", "<cmd>Trouble workspace_diagnostics toggle<cr>", desc = "Workspace diagnostics" },
      { "<leader>xq", "<cmd>Trouble quickfix toggle<cr>", desc = "Quickfix list" },
      { "<leader>xl", "<cmd>Trouble loclist toggle<cr>", desc = "Location list" },
    },
    opts = {},
  },
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    keys = {
      { "<leader>uz", "<cmd>ZenMode<cr>", desc = "Toggle Zen Mode" },
    },
    opts = {
      window = {
        backdrop = 0.95,
        width = 120,
      },
      plugins = {
        gitsigns = true,
        tmux = true,
      },
    },
  },
}

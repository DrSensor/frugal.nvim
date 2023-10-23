return {
  {
    "tokyonight.nvim",
    opts = function(_, opts)
      if not (vim.g.neovide or vim.g.vscode) then
        opts.transparent = true
        opts.styles = {
          sidebars = "transparent",
          floats = "transparent",
        }
      end
      opts.lualine_bold = true
      opts.hide_inactive_statusline = true
    end,
  },
  {
    "lualine.nvim",
    enabled = not vim.g.vscode,
    opts = {
      options = {
        component_separators = "",
        section_separators = "",
        theme = {
          replace = {
            a = { fg = "lightgray", bg = "green" },
            b = { fg = "lightgreen", bg = "transparent" },
          },
          visual = {
            a = { fg = "black", bg = "orange" },
            b = { fg = "orange", bg = "transparent", gui = "italic" },
          },
          command = {
            a = { fg = "lightgreen", bg = "transparent" },
          },
          insert = {
            a = { fg = "black", bg = "lightyellow", gui = "italic" },
            b = { fg = "gray", bg = "transparent" },
            c = { fg = "orange", bg = "transparent", gui = "italic" },
          },
          normal = {
            a = { fg = "black", bg = "lightgreen" },
            b = { fg = "orange", bg = "transparent" },
            c = { bg = "transparent", gui = "italic" },
          },
        },
      },
      sections = {
        lualine_b = vim.g.neovide and { "branch" } or {},
        lualine_z = {},
      },
    },
  },
  {
    "noice.nvim",
    enabled = not vim.g.vscode,
    opts = {
      lsp = {
        progress = {
          throttle = 100,
        },
      },
      throttle = 40,
    },
  },
  {
    "indent-blankline.nvim",
    enabled = not vim.g.vscode,
    opts = {
      scope = {
        enabled = true,
        show_start = false,
        show_end = false,
        show_exact_scope = true,
      },
    },
  },
  {
    "mini.indentscope",
    enabled = not (vim.g.vscode or vim.g.neovide),
    opts = {
      draw = {
        delay = 40,
        animation = function()
          return 0
        end,
      },
      options = {
        border = "bottom",
        indent_at_cursor = false,
        try_as_border = false,
      },
    },
  },
  {
    "nvim-notify",
    enabled = not (vim.g.neovide or vim.g.vscode),
    opts = {
      render = "minimal",
      stages = "static",
    },
  },
}

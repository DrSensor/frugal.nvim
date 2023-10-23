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
    end,
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

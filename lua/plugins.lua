-- This file can be loaded by calling `lua require('plugins')` from your init.vim or `require('plugins')` from your init.lua

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)

  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use {
    'nvim-treesitter/playground', run = ':TSInstall query', after = 'nvim-treesitter',
    -- config = function()
    --   require "nvim-treesitter.configs".setup {
    --     playground = {
    --       enable = true,
    --       disable = {},
    --       updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    --       persist_queries = false, -- Whether the query persists across vim sessions
    --       keybindings = {
    --         toggle_query_editor = 'o',
    --         toggle_hl_groups = 'i',
    --         toggle_injected_languages = 't',
    --         toggle_anonymous_nodes = 'a',
    --         toggle_language_display = 'I',
    --         focus_language = 'f',
    --         unfocus_language = 'F',
    --         update = 'R',
    --         goto_node = '<cr>',
    --         show_help = '?',
    --       },
    --     },
    --     query_linter = {
    --       enable = true,
    --       use_virtual_text = true,
    --       lint_events = {"BufWrite", "CursorHold"},
    --     },
    --   }
    -- end
  }

  use {
    'romgrk/nvim-treesitter-context', after = 'nvim-treesitter',
    -- config = function()
    --   require'treesitter-context'.setup{
    --       enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
    --       throttle = true, -- Throttles plugin updates (may improve performance)
    --       max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
    --       patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
    --           -- For all filetypes
    --           -- Note that setting an entry here replaces all other patterns for this entry.
    --           -- By setting the 'default' entry below, you can control which nodes you want to
    --           -- appear in the context window.
    --           default = {
    --               'class',
    --               'function',
    --               'method',
    --               -- 'for', -- These won't appear in the context
    --               -- 'while',
    --               -- 'if',
    --               -- 'switch',
    --               -- 'case',
    --           },
    --           -- Example for a specific filetype.
    --           -- If a pattern is missing, *open a PR* so everyone can benefit.
    --           --   rust = {
    --           --       'impl_item',
    --           --   },
    --       },
    --       exact_patterns = {
    --           -- Example for a specific filetype with Lua patterns
    --           -- Treat patterns.rust as a Lua pattern (i.e "^impl_item$" will
    --           -- exactly match "impl_item" only)
    --           -- rust = true, 
    --       }
    --   }
    -- end
  }

  use {
    'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    -- config = function() require'statusline' end
    -- config = function()
    --   require('lualine').setup {
    --     options = {
    --       icons_enabled = true,
    --       theme = 'auto', -- lualine theme
    --       component_separators = { left = '', right = ''},
    --       section_separators = { left = '', right = ''},
    --       disabled_filetypes = {},     -- Filetypes to disable lualine for.
    --       always_divide_middle = true, -- When set to true, left sections i.e. 'a','b' and 'c'
    --                                    -- can't take over the entire statusline even
    --                                    -- if neither of 'x', 'y' or 'z' are present.
    --     },
    --     sections = {
    --       lualine_a = {
    --         'mode',
    --         -- {
    --         --   'buffers',
    --         --   show_filename_only = true,   -- Shows shortened relative path when set to false.
    --         --   show_modified_status = true, -- Shows indicator when the buffer is modified.

    --         --   mode = 0, -- 0: Shows buffer name
    --         --             -- 1: Shows buffer index (bufnr)
    --         --             -- 2: Shows buffer name + buffer index (bufnr)

    --         --   max_length = vim.o.columns * 2 / 3, -- Maximum width of buffers component,
    --         --                                       -- it can also be a function that returns
    --         --                                       -- the value of `max_length` dynamically.
    --         --   filetype_names = {
    --         --     TelescopePrompt = 'Telescope',
    --         --     dashboard = 'Dashboard',
    --         --     packer = 'Packer',
    --         --     fzf = 'FZF',
    --         --     alpha = 'Alpha'
    --         --   }, -- Shows specific buffer name for that filetype ( { `filetype` = `buffer_name`, ... } )

    --         --   buffers_color = {
    --         --     -- Same values as the general color option can be used here.
    --         --     active = 'lualine_{section}_normal',     -- Color for active buffer.
    --         --     inactive = 'lualine_{section}_inactive', -- Color for inactive buffer.
    --         --   },
    --         -- },
    --         -- {
    --         --   'tabs',
    --         --   max_length = vim.o.columns / 3, -- Maximum width of tabs component.
    --         --                                   -- Note:
    --         --                                   -- It can also be a function that returns
    --         --                                   -- the value of `max_length` dynamically.
    --         --   mode = 0, -- 0: Shows tab_nr
    --         --             -- 1: Shows tab_name
    --         --             -- 2: Shows tab_nr + tab_name

    --         --   tabs_color = {
    --         --     -- Same values as the general color option can be used here.
    --         --     active = 'lualine_{section}_normal',     -- Color for active tab.
    --         --     inactive = 'lualine_{section}_inactive', -- Color for inactive tab.
    --         --   },
    --         -- },
    --       },
    --       lualine_b = {
    --         'branch',
    --         'diff',
    --         -- {
    --         --   'diff',
    --         --   colored = true, -- Displays a colored diff status if set to true
    --         --   diff_color = {
    --         --     -- Same color values as the general color option can be used here.
    --         --     added    = 'DiffAdd',    -- Changes the diff's added color
    --         --     modified = 'DiffChange', -- Changes the diff's modified color
    --         --     removed  = 'DiffDelete', -- Changes the diff's removed color you
    --         --   },
    --         --   symbols = {added = '+', modified = '~', removed = '-'}, -- Changes the symbols used by the diff.
    --         --   source = nil, -- A function that works as a data source for diff.
    --         --                 -- It must return a table as such:
    --         --                 --   { added = add_count, modified = modified_count, removed = removed_count }
    --         --                 -- or nil on failure. count <= 0 won't be displayed.
    --         -- }
    --         'diagnostics',
    --         -- {
    --         --   'diagnostics',

    --         --   -- Table of diagnostic sources, available sources are:
    --         --   --   'nvim_lsp', 'nvim_diagnostic', 'coc', 'ale', 'vim_lsp'.
    --         --   -- or a function that returns a table as such:
    --         --   --   { error=error_cnt, warn=warn_cnt, info=info_cnt, hint=hint_cnt }
    --         --   sources = { 'nvim_diagnostic', 'coc' },

    --         --   -- Displays diagnostics for the defined severity types
    --         --   sections = { 'error', 'warn', 'info', 'hint' },

    --         --   diagnostics_color = {
    --         --     -- Same values as the general color option can be used here.
    --         --     error = 'DiagnosticError', -- Changes diagnostics' error color.
    --         --     warn  = 'DiagnosticWarn',  -- Changes diagnostics' warn color.
    --         --     info  = 'DiagnosticInfo',  -- Changes diagnostics' info color.
    --         --     hint  = 'DiagnosticHint',  -- Changes diagnostics' hint color.
    --         --   },
    --         --   symbols = {error = 'E', warn = 'W', info = 'I', hint = 'H'},
    --         --   colored = true,           -- Displays diagnostics status in color if set to true.
    --         --   update_in_insert = false, -- Update diagnostics in insert mode.
    --         --   always_visible = false,   -- Show diagnostics even if there are none.
    --         -- },
    --       },
    --       lualine_c = {
    --         'filename',
    --         -- {
    --         --   'filename',
    --         --   file_status = true,      -- Displays file status (readonly status, modified status)
    --         --   path = 0,                -- 0: Just the filename
    --         --                            -- 1: Relative path
    --         --                            -- 2: Absolute path

    --         --   shorting_target = 40,    -- Shortens path to leave 40 spaces in the window
    --         --                            -- for other components. (terrible name, any suggestions?)
    --         --   symbols = {
    --         --     modified = '[+]',      -- Text to show when the file is modified.
    --         --     readonly = '[-]',      -- Text to show when the file is non-modifiable or readonly.
    --         --     unnamed = '[No Name]', -- Text to show for unnamed buffers.
    --         --   }
    --         -- },
    --       },
    --       lualine_x = {
    --         'encoding',
    --         'fileformat',
    --         'filetype',
    --         -- {
    --         --   'filetype',
    --         --   colored = true,   -- Displays filetype icon in color if set to true
    --         --   icon_only = false -- Display only an icon for filetype
    --         -- },
    --       },
    --       lualine_y = {'progress'},
    --       lualine_z = {'location'}
    --     },
    --     inactive_sections = {
    --       lualine_a = {},
    --       lualine_b = {},
    --       lualine_c = {'filename'},
    --       lualine_x = {'location'},
    --       lualine_y = {},
    --       lualine_z = {}
    --     },
    --     tabline = {
    --       lualine_a = {'buffers'},
    --       lualine_b = {'branch'},
    --       lualine_c = {'filename'},
    --       lualine_x = {},
    --       lualine_y = {},
    --       lualine_z = {'tabs'}
    --     },
    --     extensions = {}
    --   }
    -- end
  }

  use {
    'kdheepak/tabline.nvim', after = { 'nvim-lualine/lualine.nvim' }, requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    -- config = function()
    --   require'tabline'.setup {
    --     -- Defaults configuration options
    --     enable = true,
    --     options = {
    --     -- If lualine is installed tabline will use separators configured in lualine by default.
    --     -- These options can be used to override those settings.
    --       section_separators = {'', ''},
    --       component_separators = {'', ''},
    --       max_bufferline_percent = 66, -- set to nil by default, and it uses vim.o.columns * 2/3
    --       show_tabs_always = false, -- this shows tabs only when there are more than one tab or if the first tab is named
    --       show_devicons = true, -- this shows devicons in buffer section
    --       show_bufnr = false, -- this appends [bufnr] to buffer section,
    --       show_filename_only = false, -- shows base filename only instead of relative path in filename
    --       modified_icon = "+ ", -- change the default modified icon
    --       modified_italic = false, -- set to true by default; this determines whether the filename turns italic if modified
    --     }
    --   }
    --   vim.cmd[[
    --     set guioptions-=e " Use showtabline in gui vim
    --     set sessionoptions+=tabpages,globals " store tabpages and globals in session
    --   ]]
    -- end
  }

  use {
    'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' },
    -- config = function() require('gitsigns').setup() end
    -- config = function()
    --   require('gitsigns').setup {
    --     signs = {
    --       add          = {hl = 'GitSignsAdd'   , text = '│', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
    --       change       = {hl = 'GitSignsChange', text = '│', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
    --       delete       = {hl = 'GitSignsDelete', text = '_', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    --       topdelete    = {hl = 'GitSignsDelete', text = '‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    --       changedelete = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
    --     },
    --     signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
    --     numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
    --     linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
    --     word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
    --     watch_gitdir = {
    --       interval = 1000,
    --       follow_files = true
    --     },
    --     attach_to_untracked = true,
    --     current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
    --     current_line_blame_opts = {
    --       virt_text = true,
    --       virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    --       delay = 1000,
    --       ignore_whitespace = false,
    --     },
    --     current_line_blame_formatter_opts = {
    --       relative_time = false
    --     },
    --     sign_priority = 6,
    --     update_debounce = 100,
    --     status_formatter = nil, -- Use default
    --     max_file_length = 40000,
    --     preview_config = {
    --       -- Options passed to nvim_open_win
    --       border = 'single',
    --       style = 'minimal',
    --       relative = 'cursor',
    --       row = 0,
    --       col = 1
    --     },
    --     yadm = {
    --       enable = false
    --     },
    --     on_attach = function(bufnr)
    --       local gs = package.loaded.gitsigns

    --       local function map(mode, l, r, opts)
    --         opts = opts or {}
    --         opts.buffer = bufnr
    --         vim.keymap.set(mode, l, r, opts)
    --       end

    --       -- Navigation
    --       map('n', ']c', "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", {expr=true})
    --       map('n', '[c', "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", {expr=true})

    --       -- Actions
    --       map({'n', 'v'}, '<leader>hs', ':Gitsigns stage_hunk<CR>')
    --       map({'n', 'v'}, '<leader>hr', ':Gitsigns reset_hunk<CR>')
    --       map('n', '<leader>hS', gs.stage_buffer)
    --       map('n', '<leader>hu', gs.undo_stage_hunk)
    --       map('n', '<leader>hR', gs.reset_buffer)
    --       map('n', '<leader>hp', gs.preview_hunk)
    --       map('n', '<leader>hb', function() gs.blame_line{full=true} end)
    --       map('n', '<leader>tb', gs.toggle_current_line_blame)
    --       map('n', '<leader>hd', gs.diffthis)
    --       map('n', '<leader>hD', function() gs.diffthis('~') end)
    --       map('n', '<leader>td', gs.toggle_deleted)

    --       -- Text object
    --       map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
    --     end
    --   }
    -- end
  }

end)

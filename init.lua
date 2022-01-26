-----------------------------------------------------------
-- https://github.com/nanotee/nvim-lua-guide
-----------------------------------------------------------

require('plugins')

-----------------------------------------------------------
-- Neovim API aliases
-----------------------------------------------------------
--local map = vim.api.nvim_set_keymap  -- set global keymap
local cmd = vim.cmd                    -- execute Vim commands
local exec = vim.api.nvim_exec         -- execute Vimscript
local fn = vim.fn                      -- call Vim functions
local g = vim.g                        -- global variables
local opt = vim.opt                    -- global/buffer/windows-scoped options

-----------------------------------------------------------
-- General
-----------------------------------------------------------
g.mapleader = ','             -- change leader to a comma
opt.mouse = 'a'               -- enable mouse support
opt.clipboard = 'unnamedplus' -- copy/paste to system clipboard
opt.swapfile = false          -- don't use swapfile

-----------------------------------------------------------
-- Startup
-----------------------------------------------------------
cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]]

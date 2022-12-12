-- HELPERS ----------------------------------------------------
local api = vim.api
local cmd = vim.cmd   -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn     -- to call Vim functions e.g. fn.bufnr()
local g = vim.g       -- a table to access global variables
local km = vim.keymap -- key bindings
local scopes = {o = vim.o, b = vim.bo, w = vim.wo}
local opt = vim.opt
-- Set CMD ----------------------------------------------------
cmd "syntax enable"
cmd "syntax on"
cmd "set number"
-- WSL yank to clip
cmd [[
  let s:clip = '/mnt/c/Windows/System32/clip.exe'  " change this path according to your mount point
  if executable(s:clip)
      augroup WSLYank
          autocmd!
          autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
      augroup END
  endif
]]

-- Remap leader and local leader to <Space>
api.nvim_set_keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })
g.mapleader = " "
g.maplocalleader = " "
-- Buffer key mapping
km.set('n', 'gb', '<Cmd>bn<CR>')
km.set('n', 'gB', '<Cmd>bp<CR>')
-- Tab pages key binding
km.set('n', 'gn', '<Cmd>tabnew<CR>') -- new tab
km.set('n', 'gc', '<Cmd>tabclose<CR>') -- close tab
km.set('n', 'gt', '<Cmd>tabn<CR>') -- go to next tab (default gt)
km.set('n', 'gT', '<Cmd>tabp<CR>') -- go to previous tab (default gT)
km.set('n', 'g1', '<Cmd>tabn 1<CR>')
km.set('n', 'g2', '<Cmd>tabn 2<CR>')
km.set('n', 'g3', '<Cmd>tabn 3<CR>')
km.set('n', 'g4', '<Cmd>tabn 4<CR>')
km.set('n', 'g5', '<Cmd>tabn 5<CR>')
km.set('n', 'g6', '<Cmd>tabn 6<CR>')
km.set('n', 'g7', '<Cmd>tabn 7<CR>')
km.set('n', 'g8', '<Cmd>tabn 8<CR>')
km.set('n', 'g9', '<Cmd>tabn 9<CR>')

-- Better Netrw
g.netrw_banner = 0 -- Hide banner
g.netrw_browse_split = 4 -- Open in previous window
g.netrw_altv = 1 -- Open with right splitting
g.netrw_liststyle = 3 -- Tree-style view
g.netrw_list_hide = (vim.fn["netrw_gitignore#Hide"]()) .. [[,\(^\|\s\s\)\zs\.\S\+]] -- use .gitignore

-- Options ---------------------------------------------
opt.termguicolors = true -- Enable colors in terminal
opt.hlsearch = true --Set highlight on search
opt.number = true --Make line numbers default
--opt.relativenumber = true --Make relative number default
--opt.mouse = "a" --Enable mouse mode
opt.breakindent = true --Enable break indent
opt.undofile = true --Save undo history
opt.ignorecase = true --Case insensitive searching unless /C or capital in search
opt.smartcase = true -- Smart case
opt.smarttab = true -- Smart tab
opt.expandtab = true -- Insert spaces for tab
opt.updatetime = 250 --Decrease update time
opt.signcolumn = "yes" -- Always show sign column
opt.clipboard = "unnamedplus" -- Access system clipboard


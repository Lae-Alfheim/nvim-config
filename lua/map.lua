-- Define Keymaps {{{
local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end
-- }}}


-- set leader
map('', '<SPACE>', '<nop>')
vim.g.mapleader = " "
vim.g.localleader = "," -- local leader

-- Remap control c to esc
map('i', '<C-c>', '<esc>')

-- Disable arrow keys
map('', '<up>', '<nop>')
map('', '<down>', '<nop>')
map('', '<left>', '<nop>')
map('', '<right>', '<nop>')

-- Shift Lines
map('n', '<A-j>', ':m .+1<CR>==')
map('n', '<A-k>', ':m .-2<CR>==')
map('i', '<A-j>', '<Esc>:m .+1<CR>==gi')
map('i', '<A-k>', '<Esc>:m .-2<CR>==gi')

-- Leader keys
map('n', '<Leader>t', ':term<CR>')
map('n', '<Leader>s', ':split<CR>')
map('n', '<Leader>v', ':vsplit<CR>')
map('n', '<Leader>at', ':TagbarToggle<CR>')

-- Nvim Tree
map('n', '<S-t>', ':NvimTreeToggle<CR>')
map('n', '<C-t>', ':NvimTreeFindFile<CR>')

-- Other
map('n', '<S-w>', ':set wrap!<CR>')

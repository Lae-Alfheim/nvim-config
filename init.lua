-- set leader
vim.keymap.set('', '<SPACE>', '<Nop>')
vim.g.mapleader = " " -- leader key
vim.g.localleader = "  " -- local leader

-- load legacy options
vim.cmd([[
        so $HOME/.config/nvim/legacy.vim
]])

-- Packer {{{
-- Set packpath to point to where Packer is installed
local packer_path = vim.fn.stdpath('config') .. '/site'
local config_path = vim.fn.stdpath('config')
local config_files = config_path .. '/?.lua'
vim.o.packpath = vim.o.packpath .. ',' .. packer_path .. ',' .. config_path
-- Set package.path so the "require" statements below work
package.path = package.path .. ';' .. config_files
-- }}}

require('lua/plug')
require('lua/map')
require('lua/opt')

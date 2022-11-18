local fn = vim.fn

-- packer {{{
-- Automatically install packer
local install_path = fn.stdpath('config')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    print("Installing packer close and reopen Neovim...")
end
-- }}}

-- ZenMode {{{
require("zen-mode").setup({
  window = {
    width = .75 --.75 -- width will be 85% of the editor width
  }
})
-- }}}


return require('packer').startup(function()
        use 'rust-lang/rust.vim'
        use 'lervag/vimtex'
        use 'pdurbin/vim-tsv'
        use 'preservim/vim-markdown'

        use 'nvim-tree/nvim-tree.lua'

        use {'neoclide/coc.nvim', branch = 'release'}
        use 'preservim/tagbar'
        use 'sheerun/vim-polyglot'
        use 'rentalcustard/exuberant-ctags'

        --use 'luochenn1990/rainbow'
        use 'ntpeters/vim-better-whitespace'

        use 'neomake/neomake'
        --use 'terrortylor/nvim-commit'

        use "folke/zen-mode.nvim"

end)

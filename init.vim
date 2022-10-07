"=================     ===============     ===============   ========  ========
"\\ . . . . . . .\\   //. . . . . . .\\   //. . . . . . .\\  \\. . .\\// . . //
"||. . ._____. . .|| ||. . ._____. . .|| ||. . ._____. . .|| || . . .\/ . . .||
"|| . .||   ||. . || || . .||   ||. . || || . .||   ||. . || ||. . . . . . . ||
"||. . ||   || . .|| ||. . ||   || . .|| ||. . ||   || . .|| || . | . . . . .||
"|| . .||   ||. _-|| ||-_ .||   ||. . || || . .||   ||. _-|| ||-_.|\ . . . . ||
"||. . ||   ||-'  || ||  `-||   || . .|| ||. . ||   ||-'  || ||  `|\_ . .|. .||
"|| . _||   ||    || ||    ||   ||_ . || || . _||   ||    || ||   |\ `-_/| . ||
"||_-' ||  .|/    || ||    \|.  || `-_|| ||_-' ||  .|/    || ||   | \  / |-_.||
"||    ||_-'      || ||      `-_||    || ||    ||_-'      || ||   | \  / |  `||
"||    `'         || ||         `'    || ||    `'         || ||   | \  / |   ||
"||            .===' `===.         .==='.`===.         .===' /==. |  \/  |   ||
"||         .=='   \_|-_ `===. .==='   _|_   `===. .===' _-|/   `==  \/  |   ||
"||      .=='    _-'    `-_  `='    _-'   `-_    `='  _-'   `-_  /|  \/  |   ||
"||   .=='    _-'          '-__\._-'         '-_./__-'         `' |. /|  |   ||
"||.=='    _-'                                                     `' |  /==.||
"=='    _-'                        N E O V I M                         \/   `==
"\   _-'                                                                `-_   /

" Plugins {{{
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')
" Plug 'glepnir/dashboard-nvim'
" Plug 'tribela/vim-transparent' " backgound transparent
Plug 'preservim/nerdtree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/tagbar'
Plug 'sheerun/vim-polyglot' " Language pack for vim
Plug 'junegunn/goyo.vim'
Plug 'rentalcustard/exuberant-ctags'

Plug 'itchyny/lightline.vim'
Plug 'luochen1990/rainbow'
Plug 'ntpeters/vim-better-whitespace'

Plug 'preservim/vim-markdown'
Plug 'pdurbin/vim-tsv'

Plug 'neomake/neomake'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
" https://github.com/nvim-telescope/telescope.nvim#getting-started
Plug 'kyazdani42/nvim-web-devicons'
call plug#end()
" Plugins }}}

" Keymap {{{
"nmap - Display normal mode maps
"imap - Display insert mode maps
"vmap - Display visual and select mode maps
"smap - Display select mode maps
"xmap - Display visual mode maps
"cmap - Display command-line mode maps
"omap - Display operator pending mode maps

" set leader key
let mapleader = "\\"

" Move Lines
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi

" Spelling
nnoremap <leader>p :set spell!<CR>

" Remap C-c to <esc>
nmap <c-c> <esc>
imap <c-c> <esc>
vmap <c-c> <esc>
omap <c-c> <esc>

nnoremap <C-k> :winc k <CR>
nnoremap <C-j> :winc j <CR>
nnoremap <C-l> :winc l <CR>
nnoremap <C-h> :winc h <CR>

nnoremap <S-w> :set wrap!<CR>
nnoremap <C-t> :NERDTreeToggle <CR>
nnoremap <C-S-t> :Explore <CR>
"nnoremap <C-e> :TagbarJump <CR>

tnoremap <silent> <esc> <C-\><C-n>


nnoremap <Leader>at :TagbarToggle<CR>
nnoremap <Leader>n :set number relativenumber!<CR>
nnoremap <Leader>t :term<CR>
nnoremap <Leader>s :split<CR>
nnoremap <Leader>v :vsplit<CR>

nnoremap <Leader>xs :set ft=xxd<CR>
nnoremap <Leader>xx :%!xxd<CR>
nnoremap <Leader>xr :%!xxd -r<CR>
nnoremap <Leader>cc :set colorcolumn=64<CR>
nnoremap <Leader>cn :set colorcolumn=0<CR>
" Keymap }}}
" Neomake {{{
" When writing a buffer (no delay).
call neomake#configure#automake('w')
" Neomake }}}
" NERDTree {{{
" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | Explore | endif
let g:NERDTreeQuitOnOpen = 1 " makes nerdtree close when files is opened
" NERDTree }}}
" lightline {{{
set noshowmode
" add cocstatus into lightline
let g:lightline = {
        \ 'colorscheme': 'one',
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ],
        \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
        \ },
        \ 'component_function': {
        \   'cocstatus': 'coc#status'
        \ },
        \ }
" lightline }}}
" coc.nvim {{{
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"ap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <silent><expr> <c-O> coc#refresh()
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
"" CocInstall coc-prettier
"" CocInstall coc-jason coc-tsserver
"" CocInstall coc-clangd
" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
" coc.nvim }}}
" rainbow {{{
let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle
" rainbow }}}
" Tagbar {{{

" tagbar how to get ctags
"git clone https://github.com/universal-ctags/ctags.git
"cd ctags
"./autogen.sh
"./configure --prefix=/where/you/want # defaults to /usr/local
"make
"make install # may require extra privileges depending on where to install
" Tagbar }}}

" tabs {{{
" General tab settings
set tabstop=8       " number of visual spaces per TAB
set softtabstop=8   " number of spaces in tab when editing
set shiftwidth=8    " number of spaces to use for autoindent
set expandtab       " expand tab to spaces so that tabs are spaces

autocmd Filetype html setlocal ts=4 sts=4 sw=4 expandtab
autocmd Filetype javascript setlocal ts=4 sts=4 sw=4 expandtab
autocmd Filetype c setlocal ts=4 sts=4 sw=4 expandtab
autocmd Filetype cpp setlocal ts=4 sts=4 sw=4 expandtab
autocmd Filetype tsv setlocal ts=32 sts=32 sw=32 noexpandtab
autocmd Filetype make setlocal ts=8 sts=8 sw=8

" Enable tab to spaces conversion
let g:neoformat_basic_format_retab = 1
" tabs }}}

scriptencoding utf-8
let s:fontsize = 12
set foldmethod=marker

set spell spelllang=en_us
set spell!

set background=dark
source $HOME/.config/nvim/MinePink.vim

" set the side numbers to relative
set number relativenumber

" Don't make noise
set visualbell

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Function to trim extra whitespace in whole file
function! Trim()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun
command! -nargs=0 Trim call Trim()
set laststatus=2


" change fillchars for folding, vertical split, end of buffer, and message separator
set fillchars=fold:\ ,vert:\│,eob:\ ,msgsep:‾

" Split window below/right when creating horizontal/vertical windows
set splitbelow splitright

" Time in milliseconds to wait for a mapped sequence to complete,
" see https://unix.stackexchange.com/q/36882/221410 for more info
set timeoutlen=300
set updatetime=300 " no delays!

" Disable creating swapfiles, see https://stackoverflow.com/q/821902/6064933
set noswapfile
" Set up backup directory
"let g:backupdir=expand(stdpath('data') . '/backup//')
"let &backupdir=g:backupdir

" Set matching pairs of characters and highlight matching brackets
set matchpairs+=<:>,「:」,『:』,【:】,“:”,‘:’,《:》,{:},[:]

set number numberwidth=2 "relativenumber  " Show line number and relative line number

" File and script encoding settings for vim
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

" Break line at predefined characters
set linebreak
" Character to show before the lines that have been soft-wrapped
set showbreak=% "↪

" List all matches and complete till longest common string
set wildmode=list:longest

" Minimum lines to keep above and below cursor when scrolling
set scrolloff=8

set fileformats=unix,dos  " Fileformats to use for new files

" Ask for confirmation when handling unsaved or read-only files
set confirm

set visualbell noerrorbells  " Do not use visual and errorbells
set history=500  " The number of command and search history to keep

" Use list mode and customized listchars
set list listchars=tab:▸\ ,extends:❯,precedes:❮,nbsp:␣

" Auto-write the file based on some condition
set autowrite

" Persistent undo even after you close a file and re-open it
set undofile

" Do not show "match xx of xx" and other messages during auto-completion
set shortmess+=c

" Do not show search match count on bottom right (seriously, I would strain my
" neck looking at it). Using plugins like vim-anzu or nvim-hlslens is a better
" choice, IMHO.
set shortmess+=S

" Completion behaviour
" set completeopt+=noinsert  " Auto select the first completion entry
set completeopt+=menuone  " Show menu even if there is only one item
set completeopt-=preview  " Disable the preview window

set pumheight=10  " Maximum number of items to show in popup menu
set pumblend=10  " pseudo transparency for completion menu

set winblend=5  " pseudo transparency for floating window

" Insert mode key word completion setting
set complete+=kspell complete-=w complete-=b complete-=u complete-=t

set spelllang=en        " Spell languages
set spellsuggest+=9  " show 9 spell suggestions at most

" Align indent to next multiple value of shiftwidth. For its meaning,
" see http://vim.1045645.n5.nabble.com/shiftround-option-td5712100.html
set shiftround

set virtualedit=block  " Virtual edit is useful for visual block edit

" Correctly break multi-byte characters such as CJK,
" see https://stackoverflow.com/q/32669814/6064933
set formatoptions+=mM

set synmaxcol=200  " Text after this column number is not highlighted
set nostartofline

" Enable true color support. Do not set this option if your terminal does not
" support true colors! For a comprehensive list of terminals supporting true
" colors, see https://github.com/termstandard/colors and https://gist.github.com/XVilka/8346728.
set termguicolors

" Set up cursor color and shape in various mode, ref:
" https://github.com/neovim/neovim/wiki/FAQ#how-to-change-cursor-color-in-the-terminal
set guicursor=n-v-c:block-Cursor/lCursor,i-ci-ve:ver25-Cursor2/lCursor2,r-cr:hor20,o:hor20

set signcolumn=auto:2

" Remove certain character from file name pattern matching
set isfname-==
set isfname-=,

" diff options
set diffopt=
set diffopt+=vertical  " show diff in vertical position
set diffopt+=filler  " show filler for deleted lines
set diffopt+=closeoff  " turn off diff when one file window is closed
set diffopt+=context:3  " context for diff
set diffopt+=internal,indent-heuristic,algorithm:histogram

autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

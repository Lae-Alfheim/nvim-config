" Plugins {{{

"call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')
"
"Plug 'luochen1990/rainbow'
"
"call plug#end()

" Plugins }}}


" StatusLine {{{

function! GitBranch()
        return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
        let l:branchname = GitBranch()
        return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

set statusline=
set statusline+=%#PmenuSel#
set statusline+=%{StatuslineGit()}
set statusline+=%#LineNr#
set statusline+=\ %f " file path
set statusline+=%m
set statusline+=\ %{wordcount().words}\ words
set statusline+=%=
set statusline+=%#CursorColumn#
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%

" }}}
" Tabs {{{

autocmd Filetype html setlocal ts=4 sts=4 sw=4 expandtab
autocmd Filetype javascript setlocal ts=4 sts=4 sw=4 expandtab
autocmd Filetype c setlocal ts=4 sts=4 sw=4 expandtab
autocmd Filetype cpp setlocal ts=4 sts=4 sw=4 expandtab
autocmd Filetype tsv setlocal ts=32 sts=32 sw=32 noexpandtab
autocmd Filetype make setlocal ts=8 sts=8 sw=8

" tabs }}}

set spell spelllang=en_us

scriptencoding utf-8
let s:fontsize = 10

" set the side numbers to relative
set number relativenumber
set foldmethod=marker
set visualbell

" Don't make noise

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
set spell!

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

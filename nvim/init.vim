call plug#begin('~/.local/share/nvim/plugged')
  Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
  Plug 'mbbill/undotree'
  Plug 'rakr/vim-one'
  Plug 'dylanaraps/wal.vim'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-commentary'
  Plug 'jiangmiao/auto-pairs'
  Plug 'itchyny/lightline.vim'
  Plug 'jceb/vim-orgmode'
  Plug 'easymotion/vim-easymotion'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

  if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  else
    Plug 'Shougo/deoplete.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
  endif

  Plug 'kblin/vim-fountain'
  Plug 'zchee/deoplete-clang'
  Plug 'padawan-php/deoplete-padawan', { 'do': 'composer install' }
  Plug 'zchee/deoplete-jedi'
  Plug 'mattn/emmet-vim'
  Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
  Plug 'rstacruz/vim-closer'
  Plug 'neomake/neomake'
  Plug 'junegunn/limelight.vim'
  Plug 'junegunn/goyo.vim'

call plug#end()

" Gui Settings

" Render HTML arguments such as class, id, data ... as italic
highlight htmlArg gui=italic
highlight htmlArg cterm=italic

" Render comments in italic
highlight Comment gui=italic
highlight Comment cterm=italic

set t_8b=^[[48;2;%lu;%lu;%lum
set t_8f=^[[38;2;%lu;%lu;%lum

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors
set background=dark " for the dark version

let g:lightline = {
  \ 'colorscheme': 'one',
  \   'active': {
  \     'left':[ [ 'mode', 'paste' ],
  \              [ 'gitbranch', 'readonly', 'filename', 'modified' ]
  \     ]
  \   },
	\   'component': {
	\     'lineinfo': ' %3l:%-2v',
	\   },
  \   'component_function': {
  \     'gitbranch': 'fugitive#head',
  \   }
  \ }


let g:lightline.separator = {
	\   'left': '', 'right': ''
  \}
let g:lightline.subseparator = {
	\   'left': '', 'right': '' 
  \}

let g:one_allow_italics = 1 " I love italic for comments<Paste>
colorscheme one

" Fundamental settings
set scrolloff=5
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,gbk,cp936,latin-1
set fileformat=unix
set fileformats=unix,dos,mac
filetype on
filetype plugin on
filetype plugin indent on
syntax on
set t_Co=256
set foldcolumn=2
set clipboard+=unnamedplus
set smartindent
set expandtab         "tab to spaces
set tabstop=2         "the width of a tab
set shiftwidth=2      "the width for indent
set foldenable
set foldmethod=indent "folding by indent
set foldlevel=99
set ignorecase        "ignore the case when search texts
set smartcase         "if searching text contains uppercase case will not be ignored
set linebreak
set number           "line number
set cursorline       "hilight the line of the cursor
set autochdir



set showtabline=2
set guioptions-=e
" set cursorcolumn     "hilight the column of the cursor
" set nowrap           "no line wrapping

" Mappings

map j gj
map k gk

nnoremap ; :
vnoremap ; :
map ; :

nmap <c-s> :w<CR>
imap <c-s> <Esc>:w<CR>a

noremap! <C-BS> <C-w>
noremap! <C-h> <C-w>

" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap <Leader>F <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

" NERDTree
map <C-n> :NERDTreeToggle<CR>


" Package Settings

" Deoplete
let g:deoplete#sources#clang#libclang_path = '/usr/lib/libclang.so'
let g:deoplete#sources#clang#clang_header = '/usr/lib/clang'


" FZF
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

let g:fzf_layout = { 'down': '~30%' }

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

let g:fzf_history_dir = '~/.local/share/fzf-history'

" Automake
call neomake#configure#automake('w')

" Markdown
let g:markdown_folding = 1

let g:fzf_action = {
    \ 'ctrl-s': 'split',
    \ 'ctrl-v': 'vsplit'
    \ }
nnoremap <c-p> :FZF<cr>

let g:goyo_width = 120

function! s:goyo_enter()
  silent !tmux set status off
  silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  set noshowmode
  set noshowcmd
  set scrolloff=999
  Limelight
  set statusline=%f\ %m
  hi statusline ctermfg=white
endfunction

function! s:goyo_leave()
  silent !tmux set status on
  silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  set showmode
  set showcmd
  set scrolloff=5
  set background=dark
  colorscheme one
  " let g:airline_theme='one'
  Limelight!
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" Use deoplete.
let g:deoplete#enable_at_startup = 1


" Auto-save files
function s:MkNonExDir(file, buf)
    if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
        let dir=fnamemodify(a:file, ':h')
        if !isdirectory(dir)
            call mkdir(dir, 'p')
        endif
    endif
endfunction
augroup BWCCreateDir
    autocmd!
    autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
augroup END

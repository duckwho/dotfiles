  call plug#begin('~/.local/share/nvim/plugged')

" On-demand loading
  Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" color scheme
  Plug 'mbbill/undotree'
  Plug 'rakr/vim-one'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-fugitive'
""  Plug 'tpope/vim-endwise'
  Plug 'tpope/vim-commentary'
  Plug 'jiangmiao/auto-pairs'

  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

  Plug 'jceb/vim-orgmode'
  Plug 'easymotion/vim-easymotion'

  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  let g:fzf_action = {
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit'
      \ }
  nnoremap <c-p> :FZF<cr>

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
  "
  
  Plug 'junegunn/limelight.vim'
  "
  Plug 'junegunn/goyo.vim'


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
  " ...
endfunction

function! s:goyo_leave()
  silent !tmux set status on
  silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  set showmode
  set showcmd
  set scrolloff=5
  set background=dark
  colorscheme one
  let g:airline_theme='one'
  Limelight!
  " ...
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

"let g:goyo_callbacks = [function('GoyoBefore'), function('GoyoAfter')]
  
"  Plug 'vim-pandoc/vim-pandoc'
"  Plug 'vim-pandoc/vim-pandoc-syntax' 
"  Plug 'godlygeek/tabular'
"  Plug 'plasticboy/vim-markdown'


  call plug#end()

  " Render HTML arguments such as class, id, data ... as italic
  highlight htmlArg gui=italic
  highlight htmlArg cterm=italic

  " Render comments in italic
  highlight Comment gui=italic
  highlight Comment cterm=italic


  set t_8b=^[[48;2;%lu;%lu;%lum
  set t_8f=^[[38;2;%lu;%lu;%lum

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
"  if (empty($TMUX))
"   if (has("nvim"))
   "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
   let $NVIM_TUI_ENABLE_TRUE_COLOR=1
"   endif
   "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
   "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
   " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
"   if (has("termguicolors"))
      set termguicolors
"   endif
"  endif

  set background=dark " for the dark version
  " set background=light " for the light version
  "
  let g:one_allow_italics = 1 " I love italic for comments<Paste>
  colorscheme one
  let g:airline_theme='one'

  " Use deoplete.
  let g:deoplete#enable_at_startup = 1

  set scrolloff=5
" Fundamental settings
  set fileencoding=utf-8
  set fileencodings=ucs-bom,utf-8,gbk,cp936,latin-1
  set fileformat=unix
  set fileformats=unix,dos,mac
  filetype on
  filetype plugin on
  filetype plugin indent on
 " syntax on
" Some useful settings
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
" Lookings
  set number           "line number
  set cursorline       "hilight the line of the cursor
  set autochdir
"  set cursorcolumn     "hilight the column of the cursor
"  set nowrap           "no line wrapping
nnoremap ; :
"nnoremap : ;
vnoremap ; :
"vnoremap : ;
map ; :

map j gj
map k gk


map <space> <PageDown>
"map <NUL> <PageUp>
map <C-Space> <PageUp>



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


map <C-n> :NERDTreeToggle<CR>
let g:deoplete#sources#clang#libclang_path = '/usr/lib/libclang.so'
"let g:deoplete#sources#clang#std#cpp = 'c++14'
let g:deoplete#sources#clang#clang_header = '/usr/lib/clang'


" This is the default extra key bindings
let g:fzf_action = {
 \ 'ctrl-t': 'tab split',
 \ 'ctrl-x': 'split',
 \ 'ctrl-v': 'vsplit' }

" An action can be a reference to a function that processes selected lines
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

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~30%' }

" You can set up fzf window using a Vim command (Neovim or latest Vim 8 required)
"let g:fzf_layout = { 'window': 'enew' }
"let g:fzf_layout = { 'window': '-tabnew' }
"let g:fzf_layout = { 'window': '10split enew' }

" Customize fzf colors to match your color scheme
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

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'
" When writing a buffer.
call neomake#configure#automake('w')

" Plugin settings
 " Airline
"  let g:airline#extensions#tabline#enabled = 1
 let g:airline#extensions#wordcount#enabled = 1
"  let g:airline#extensions#tabline#buffer_idx_mode = 1
 let g:airline_powerline_fonts = 1
 if !exists('g:airline_symbols')
  let g:airline_symbols = {}
 endif


let g:markdown_folding = 1
set foldcolumn=2
set clipboard+=unnamedplus
nmap <c-s> :w<CR>
imap <c-s> <Esc>:w<CR>a

noremap! <C-BS> <C-w>
noremap! <C-h> <C-w>



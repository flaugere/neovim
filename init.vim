" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.local/share/nvim/plugged')

Plug 'junegunn/vim-easy-align'
Plug 'honza/vim-snippets'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/echodoc.vim'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'jistr/vim-nerdtree-tabs'
Plug 'Xuyuanp/nerdtree-git-plugin'
" Typescript
Plug 'mhartington/nvim-typescript'
" Linter
Plug 'neomake/neomake'
Plug 'leafgarland/typescript-vim'
" Status bar mods
Plug 'bling/vim-airline'
Plug 'airblade/vim-gitgutter'
" PHP
Plug 'padawan-php/deoplete-padawan', { 'do': 'composer install' }

" Initialize plugin system
call plug#end()

filetype plugin indent on

" CONFIG
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#tss#javascript_support = 1

let g:nerdtree_tabs_open_on_console_startup = 1
map <Leader>n <plug>NERDTreeTabsToggle<CR>
" leader
let g:mapleader = ","
let g:localmapleader = "\\"

" move the current line below
nnoremap <leader>- ddp

" move the current line above
nnoremap <leader>_ ddkP

" switch tab
nnoremap <S-right> :tabn<CR>
nnoremap <S-left> :tabp<CR>


" nerdtree window resize
let g:NERDTreeWinSize = 35

" show hidden files
let g:NERDTreeShowHidden=1

" single click to open nodes
let g:NERDTreeMouseMode=3

let g:NERDTreeChDirMode = 2                                                     "Always change the root directory
let g:NERDTreeMinimalUI = 1                                                     "Disable help text and bookmark title<Paste>

" ignored files
let g:NERDTreeIgnore=['\.swp$', '\~$']
nnoremap <c-n> :NERDTreeToggle<cr>

let g:ctrlp_user_command = {
    \ 'types': {
      \ 1: ['.git', 'cd %s && git ls-files'],
      \ 2: ['.hg', 'hg --cwd %s locate -I .'],
      \ },
    \ 'fallback': 'find %s -type f'
    \ }

" Mapping
map <Leader>n <plug>NERDTreeTabsToggle<CR>

" Neovim config
set showcmd             " Show (partial) command in status line.
set showmatch           " Show matching brackets.
set showmode            " Show current mode.
set ruler               " Show the line and column numbers of the cursor.
set number              " Show the line numbers on the left side.
set formatoptions+=o    " Continue comment marker in new lines.
set textwidth=0         " Hard-wrap long lines as you type them.
set expandtab           " Insert spaces when TAB is pressed.
set tabstop=2           " Render TABs using this many spaces.
set shiftwidth=2        " Indentation amount for < and > commands.

set noerrorbells        " No beeps.
set modeline            " Enable modeline.
set esckeys             " Cursor keys in insert mode.
set linespace=0         " Set line-spacing to minimum.
set nojoinspaces        " Prevents inserting two spaces after punctuation on a join (J)

set splitbelow          " Horizontal split below current.
set splitright          " Vertical split to right of current.

if !&scrolloff
  set scrolloff=3       " Show next 3 lines while scrolling.
endif
if !&sidescrolloff
  set sidescrolloff=5   " Show next 5 columns while side-scrolling.
endif
set nostartofline       " Do not jump to first character with page commands.
set noswapfile
set nobackup
set nowb

" Final command
autocmd InsertLeave * NeoSnippetClearMarkers                              "Remove unused markers for snippets
autocmd InsertEnter * :set nocul                                          "Remove cursorline highlight
autocmd InsertLeave * :set cul                                            "Add cursorline highlight in normal mode
autocmd FileType html,javascript,coffee,cucumber setlocal sw=2 sts=2 ts=2 "Set 2 indent for html
autocmd FileType php,javascript setlocal cc=80                            "Set right margin only for php and js
autocmd vimenter * NERDTree

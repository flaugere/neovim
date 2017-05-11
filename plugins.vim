call plug#begin($HOME.'/.local/share/nvim/plugged')

Plug 'junegunn/vim-easy-align'
Plug 'honza/vim-snippets'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/echodoc.vim'
Plug 'eugen0329/vim-esearch'
Plug 'yggdroot/indentline'
" NERD Tools
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'jistr/vim-nerdtree-tabs'
Plug 'scrooloose/nerdcommenter'
Plug 'Xuyuanp/nerdtree-git-plugin'
" Typescript
Plug 'mhartington/nvim-typescript'
" Linter
Plug 'neomake/neomake'
Plug 'leafgarland/typescript-vim'
" Status bar mods
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
" PHP
Plug 'padawan-php/deoplete-padawan', { 'do': 'composer install' }

" Initialize plugin system
call plug#end()

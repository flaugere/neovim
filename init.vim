filetype plugin indent on

let g:neovimDir = $HOME.'/.config/nvim'
let s:pluginDef = g:neovimDir.'/plugins.vim'
let s:pluginCustomDir = g:neovimDir.'/plugins/phpcsfixer.vim'
let s:pluginDir = $HOME.'/.local/share/nvim/plugged'

if !isdirectory(s:pluginDir)

    " Welcome message when plugins are not yet installed

    echom " "
    echom "Welcome"
    echom " > the neovim IDE for web dev <"
    echom " "
    echom "Checking dependencies :"
    if (!executable('node') && !executable('nodejs')) || !executable('npm')
        echom " [ERR] node.js and npm are required, please install them before continuing."
    	  echom " "
    else

        echom "  - nodejs   : ok"
        echom "  - npm      : ok"
        echom "  - eslint   : " . (executable('eslint')   ? "ok" : "no (optional)")
        echom "  - jsonlint : " . (executable('jsonlint') ? "ok" : "no (optional)")
        echom "  - csslint  : " . (executable('csslint')  ? "ok" : "no (optional)")
        echom " done."

        echom " "
        echom "We are going to install the plugins : "
        echom " 1. take a coffee"
        echom " 2. reload vim"
        echom " 3. Enjoy"
        echom " "

        exec ":source ".s:pluginDef

        "Install plugins on first run
        autocmd VimEnter * PlugInstall
    endif

else

  let g:mapleader = ","
  let g:localmapleader = "\\"

  exec ":source ".s:pluginDef
  exec ":source ".s:pluginCustomDir

  " CONFIG
  let g:deoplete#enable_at_startup = 1
  let g:deoplete#sources#tss#javascript_support = 1

  let g:nerdtree_tabs_open_on_console_startup = 1
  let g:airline_powerline_fonts = 1

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

  " CTRRP
  function! CtrlPCommand()
      let c = 0
      let wincount = winnr('$')
      " Don't open it here if current buffer is not writable (e.g. NERDTree)
      while !empty(getbufvar(+expand("<abuf>"), "&buftype")) && c < wincount
          exec 'wincmd w'
          let c = c + 1
      endwhile
      exec 'CtrlP'
  endfunction

  let g:ctrlp_cmd = 'call CtrlPCommand()'

  let g:ctrlp_user_command = {
      \ 'types': {
        \ 1: ['.git', 'cd %s && git ls-files'],
        \ 2: ['.hg', 'hg --cwd %s locate -I .'],
        \ },
      \ 'fallback': 'find %s -type f'
      \ }
  " Phpcsfixer
let g:php_cs_fixer_path = 'php-cs-fixer'
let g:php_cs_fixer_php_path = ''

"------ Mapping ------------
  map <Leader>n <plug>NERDTreeTabsToggle<CR>
  nnoremap <Tab> <Esc>
  " move the current line below
  nnoremap <leader>- ddp
  " move the current line above
  nnoremap <leader>_ ddkP
  " switch tab
  nnoremap <S-right> :tabn<CR>
  nnoremap <S-left> :tabp<CR>


  " Neovim config
  set showcmd             " Show (partial) command in status line.
  set showmatch           " Show matching brackets.
  set showmode            " Show current mode.
  set ruler               " Show the line and column numbers of the cursor.
  set number              " Show the line numbers on the left side.
  set formatoptions+=o    " Continue comment marker in new lines.
  set textwidth=0         " Hard-wrap long lines as you type them.
  set expandtab           " Insert spaces when TAB is pressed.
  set tabstop=4           " Render TABs using this many spaces.
  set shiftwidth=2        " Indentation amount for < and > commands.

  set noerrorbells        " No beeps.
  set modeline            " Enable modeline.
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
  set mouse=a

  " Final command
  autocmd InsertEnter * :set nocul                                          "Remove cursorline highlight
  autocmd InsertLeave * :set cul                                            "Add cursorline highlight in normal mode
  autocmd FileType html,javascript,coffee,cucumber setlocal sw=2 sts=2 ts=2 "Set 2 indent for html
  autocmd FileType php,javascript setlocal shiftwidth=4
  autocmd! BufReadPost,BufWritePost * Neomake
  autocmd VimEnter * if &filetype !=# 'gitcommit' | NERDTree | wincmd p
endif

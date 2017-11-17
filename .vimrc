set encoding=utf-8
set expandtab
set shiftwidth=2
set softtabstop=2
set t_Co=256
set nowrap
set autoindent
set smartindent
set smartcase
set visualbell
set noerrorbells
set autowrite
set mouse=a
set number
set clipboard=unnamed
set nocompatible
set hidden
set showtabline=1
set background=dark
set laststatus=2
set noshowmode
set backupdir=~/backup/
set directory=~/swap/
set foldmethod=marker
set foldmarker={,}
syntax on
filetype off

" Ctrl P Ignore Directories
set wildignore+=*/node_modules/**

" Theming Stuff
" colorscheme Tomorrow-Night-Eighties
colorscheme solarized

" Press F4 to toggle highlighting on/off, and show current value.
:noremap <F4> :set hlsearch! hlsearch?<CR>
highlight Search cterm=underline

set rtp+=/usr/local/opt/fzf
" set the runtime path to include Vundle and initialize
execute pathogen#infect()
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
"
" Utility Plugins
Plugin 'L9'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-eunuch'
Plugin 'https://github.com/godlygeek/tabular.git'

Plugin 'https://github.com/junegunn/fzf.vim.git'
" Git Tools
Plugin 'tpope/vim-fugitive'

" File & Window Management Plugins
Plugin 'szw/vim-ctrlspace'
Plugin 'https://github.com/rking/ag.vim.git'
"Plugin 'git://git.wincent.com/command-t.git'
Plugin 'https://github.com/majutsushi/tagbar.git'

Plugin 'https://github.com/scrooloose/nerdtree.git'
Plugin 'jistr/vim-nerdtree-tabs'
" Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Auto-Completion Plugins
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'} " HTML Code Expansion <C-E> and <C-n>
Plugin 'Valloric/YouCompleteMe'
Plugin 'mattn/emmet-vim'
" Plugin 'marijnh/tern_for_vim'
Plugin 'othree/html5.vim'
Plugin 'w0rp/ale'

" Snippets Plugin
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

" Use Tab For All Completion Needs
Plugin 'https://github.com/ervandew/supertab.git'

" Syntax and Code-Style Plugins
" Plugin 'https://github.com/scrooloose/syntastic.git'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'mxw/vim-jsx'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'https://github.com/hail2u/vim-css3-syntax.git'
Plugin 'pangloss/vim-javascript'
Plugin 'https://github.com/vim-scripts/SyntaxComplete.git'
Plugin 'https://github.com/tpope/vim-commentary.git'

" Tag Plugins
Plugin 'https://github.com/xolox/vim-easytags.git'
Plugin 'https://github.com/xolox/vim-misc.git'
" Automatic Closing of quotes, parenths, brackets.
Plugin 'Raimondi/delimitMate'

" Put this in vimrc or a plugin file of your own.
" " After this is configured, :ALEFix will try and fix your JS code with
" ESLint.
 let g:ale_fixers = {
 \   'javascript': ['eslint'],
 \   'jsx': ['stylelint']
 \}

" " Set this setting in vimrc if you want to fix files automatically on save.
" " This is off by default.
 let g:ale_fix_on_save = 1

" All of your Plugins must be added before the following line
call vundle#end()            " required

" Code Folding -- Made Available by vim-javascript-syntax
au FileType javascript call JavaScriptFold()
au FileType javascript.jsx call JavaScriptFold()

" YouCompleteMe and UltiSnips compatibility, with the helper of supertab
" (via http://stackoverflow.com/a/22253548/1626737)
let g:SuperTabDefaultCompletionType    = '<C-n>'
let g:SuperTabCrMapping                = 0
let g:UltiSnipsExpandTrigger           = '<tab>'
let g:UltiSnipsJumpForwardTrigger      = '<tab>'
let g:UltiSnipsJumpBackwardTrigger     = '<s-tab>'
let g:ycm_key_list_select_completion   = ['<C-j>', '<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<C-p>', '<Up>']
let g:UltiSnipsEditSplit="vertical"
" CSS Syntax Highlighting

augroup VimCSS3Syntax
    autocmd!
      autocmd FileType css setlocal iskeyword+=-
    augroup END
autocmd BufNewFile,BufRead *.scss set filetype=scss
autocmd FileType scss set omnifunc=csscomplete#CompleteCSS

filetype plugin indent on
let g:airline_theme='tomorrow'    

"easy escaping to normal mode
imap jj <esc>
let mapleader = ','
nmap <F8> :TagbarToggle<CR>
map <Leader>c :%s/class=/className=/g<CR>
map <Leader>s} :V/}<CR>

" Fast saves
nmap <leader>w :w!<cr>
map <Leader>k <Plug>(easymotion-k)

" Down is really the next line
nnoremap j gj
nnoremap k gk
nmap <F8> :TagbarToggle<CR>

" Tabularize mappings
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:\zs<CR>
vmap <Leader>a: :Tabularize /:\zs<CR>

" Familiar commands for file/symbol browsing
"map <D-p> :CtrlP<cr>
"map <C-r> :CtrlPBufTag<cr>
"map <Leader>t :CommandT<cr>
"map <F1> :CommandT<cr>

nmap ; :Buffers<CR>
nmap <Leader>t :Files<CR>
nmap <Leader>r :Tags<CR>

" Powerline Stuff

python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup
let g:Powerline_symbols = 'fancy'

" If you prefer the Omni-Completion tip window to close when a selection is
" " made, these lines close it on movement in insert mode or when leaving
" " insert mode
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
imap <C-c> <CR><Esc>O

" NERD TREE TOGGLE STUFF
map <Leader>n <plug>NERDTreeTabsToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

let g:jsx_ext_required = 0 " Allow JSX in normal JS files"



let g:used_javascript_libs = 'underscore,backbone,react,lodash'
" Easy Motion Mapping

let g:EasyMotion_leader_key = '<Leader>'

" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 0
" let g:syntastic_check_on_open=1
" let g:syntastic_check_on_wq = 0
" let g:syntastic_javascript_checkers = ['eslint']
" let g:syntastic_jsx_checkers = ['eslint']
" let g:syntastic_js_checkers = ['eslint']
" let g:syntastic_css_checkers = ['stylelint']
" let g:syntastic_scss_checkers = ['stylelint']
let g:indent_guides_auto_colors = 1

" CTRL SPACE STUFF
if executable("ag")
  let g:CtrlSpaceGlobCommand = 'ag -l --nocolor -g ""'
endif
let g:CtrlSpaceLoadLastWorkspaceOnStart = 1
let g:CtrlSpaceSaveWorkspaceOnSwitch = 1
let g:CtrlSpaceSaveWorkspaceOnExit = 0


  let g:user_emmet_settings = {
  \  'html' : {
  \    'quote_char' : "'", 
  \  }
  \}

" Command T Settings
"let g:CommandTInputDebounce = 200
"let g:CommandTFileScanner = "watchman"
"let g:CommandTWildIgnore = &wildignore . ",**/bower_components/*" . ",**/node_modules/*" . ",**/vendor/*"
"let g:CommandTMaxHeight = 40
"let g:CommandTMaxFiles = 500000
" aws s3 cp casual-gallery.jpg s3://weareglow-assets --profile glow_s3
"
let g:user_emmet_settings = {
      \  'javascript' : {
      \      'extends' : 'jsx',
      \  },
      \}

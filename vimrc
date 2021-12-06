" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages.

runtime! archlinux.vim

" do not load defaults if ~/.vimrc is missing
" let skip_defaults_vim=1

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'                                " lean & mean status/tabline for vim that's light as air (Replace powerline, vim-airline)
Plug 'skywind3000/asyncrun.vim'                               " Run Async Shell Commands in Vim 8.0 / NeoVim and Output to Quickfix Window
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}          " A tree explorer plugin for vim
Plug 'Xuyuanp/nerdtree-git-plugin',{'on': 'NERDTreeToggle'}   " A plugin of NERDTree showing git status
Plug 'tpope/vim-surround'                                     " quoting/parenthesizing made simple
Plug 'scrooloose/nerdcommenter'                               " Vim plugin for intensely orgasmic commenting
Plug 'jiangmiao/auto-pairs'                                   " Vim plugin, insert or delete brackets, parens, quotes in pair (Replace delimitMate)
Plug 'editorconfig/editorconfig-vim'                          " EditorConfig plugin for Vim
Plug 'mhinz/vim-signify'                                      " Show a diff using Vim its sign column (Replace vim-gitgutter)
Plug 'luochen1990/rainbow'                                    " Rainbow Parentheses Improved, shorter code, no level limit, smooth and fast, powerful configuration
Plug 'easymotion/vim-easymotion'                              " Vim motions on speed!
Plug 'godlygeek/tabular'                                      " Vim script for text filtering and alignment
Plug 'ntpeters/vim-better-whitespace'                         " Better whitespace highlighting for Vim (Replace vim-trailing-whitespace)
Plug 'tpope/vim-repeat'                                       " enable repeating supported plugin maps with '.'
Plug 'mbbill/undotree'                                        " The ultimate undo history visualizer for VIM (Replace Gundo)
Plug 'mhinz/vim-startify'                                     " The fancy start screen for Vim
Plug 'plasticboy/vim-markdown'                                " Markdown Vim Mode
Plug 'Shougo/echodoc.vim'                                     " Displays function signatures from completions in the command line
Plug 'sillybun/vim-autodoc'                                   " Add type hints automatically
Plug 'sillybun/vim-repl', {'do': './install.sh'}              " Open the interactive environment with the code you are writing
" Plug 'jremmen/vim-ripgrep'                                    " Use RipGrep in Vim and display results in a quickfix list
Plug 'milkypostman/vim-togglelist'                            " Functions to toggle the [Location List] and the [Quickfix List] windows
Plug 'lervag/vimtex'                                          " A modern vim plugin for editing LaTeX files
Plug 'ryanoasis/vim-devicons'                                 " Adds file type glyphs/icons to popular Vim plugins: NERDTree, vim-airline, Powerline, Unite, vim-startify and more
Plug 'blockloop/vim-swigjs'                                   " Swig vim syntax highlighting
Plug 'gisphm/vim-gitignore'                                   " Gitignore plugin for Vim
Plug 'tpope/vim-fugitive'                                     " A Git wrapper so awesome, it should be illegal

call plug#end()

let mapleader = ","

" set shortmess=atI   " Do not work?
set nocompatible
set number
set ruler
set noshowmode
set showcmd
set mouse=a
set wildmenu
set wildmode=longest:full,full
" set lazyredraw
set scrolloff=5
" set nobackup
" set noswapfile
set undofile
set backupdir=~/.cache/vim/backup//
set directory=~/.cache/vim/swap//
set undodir=~/.cache/vim/undo//
set autochdir
set errorbells
set visualbell
set history=1000
set autoread
"set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ %c:%l/%L%)\
set cmdheight=1
set laststatus=2

syntax enable
syntax on

set guifont=Source\ Code\ Pro\ Semi-Bold\ 14
set background=dark
let g:one_allow_italics = 1
set t_Co=256
" set termguicolors
colorscheme desert

set encoding=utf-8
" set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
" set termencoding=utf-8
" set fileencodings=utf-8,ucs-bom,cp936,gbk
" set fileencoding=utf-8

set backspace=2
set wrap
set textwidth=0
set cindent
set autoindent
set smartindent
set smartcase
set smarttab
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set hlsearch
set incsearch
set showmatch
set magic
set showcmd
set nofoldenable
" set foldmethod=manual
set cryptmethod=blowfish2
set complete-=i
set nrformats-=octal
set viminfo+=!
set iskeyword+=_,$,@,%,#,-
set whichwrap+=<,>,h,l
set report=0
" set confirm
" set clipboard+=unnamed
set pastetoggle=<F12>

filetype plugin indent on

nmap <leader>w :w!<cr>
nmap <leader>q :q<cr>
nmap <leader>x :x<cr>

cabbrev w!! w ! sudo tee >/dev/null "%"

nnoremap <space> za
nnoremap j gj
nnoremap k gk
nnoremap B ^
nnoremap E $
nnoremap q <nop>

noremap <silent> <Left> :bp<CR>
noremap <silent> <Right> :bn<CR>

map <C-A> ggVGY
map! <C-A> <Esc>ggVGY
vmap <C-c> "+y

noremap <silent><tab>m :tabnew<cr>
noremap <silent><tab>e :tabclose<cr>
noremap <silent><tab>n :tabn<cr>
noremap <silent><tab>p :tabp<cr>
noremap <silent><leader>t :tabnew<cr>
noremap <silent><leader>g :tabclose<cr>
noremap <silent><leader>1 :tabn 1<cr>
noremap <silent><leader>2 :tabn 2<cr>
noremap <silent><leader>3 :tabn 3<cr>
noremap <silent><leader>4 :tabn 4<cr>
noremap <silent><leader>5 :tabn 5<cr>
noremap <silent><leader>6 :tabn 6<cr>
noremap <silent><leader>7 :tabn 7<cr>
noremap <silent><leader>8 :tabn 8<cr>
noremap <silent><leader>9 :tabn 9<cr>
noremap <silent><leader>0 :tabn 10<cr>
noremap <silent><s-tab> :tabnext<CR>
inoremap <silent><s-tab> <ESC>:tabnext<CR>

" let g:lt_location_list_toggle_map = '<leader><leader>l'
" let g:lt_quickfix_list_toggle_map = '<leader><leader>q'

autocmd WinEnter * set cursorline
autocmd WinLeave * set nocursorline
autocmd InsertEnter * set cursorline
autocmd InsertLeave * set nocursorline

autocmd BufNewFile,BufRead *.sage,*.spyx,*.pyx setfiletype python
" autocmd FileType python set wrap
autocmd FileType vim set textwidth=0
autocmd FileType gitcommit,gitconfig,gitignore set noexpandtab
autocmd FileType json syntax match Comment +\/\/.\+$+



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""" NERDTree
map <F2> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeIgnore = ['\~$', '\.swp', '\.pyc', '__pycache__']


""" nerdcommenter
let g:NERDSpaceDelims = 1


""" Rainbow
let g:rainbow_active = 1


""" Easymoion
let g:EasyMotion_smartcase = 1
let g:EasyMotion_startofline = 0
map <leader> <Plug>(easymotion-prefix)
" map  <leader>f <Plug>(easymotion-jd-f)
" nmap <leader>f <Plug>(easymotion-overwin-f)
nmap <leader>s <Plug>(easymotion-overwin-f)
map <leader>L <Plug>(easymotion-bd-jk)
nmap <leader>L <Plug>(easymotion-overwin-line)
map / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map <leader>j <Plug>(easymotion-j)
map <leader>k <Plug>(easymotion-k)
map <leader>l <Plug>(easymotion-lineforward)
map <leader>h <Plug>(easymotion-linebackward)
map n <Plug>(easymotion-next)
map N <Plug>(easymotion-prev)


""" vim-better-whitespace
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1
let g:strip_whitelines_at_eof=1
let g:show_spaces_that_precede_tabs=1


""" tabular
nmap <leader>a= :Tabularize /=<CR>
vmap <leader>a= :Tabularize /=<CR>
nmap <leader>a" :Tabularize /"<CR>
vmap <leader>a" :Tabularize /"<CR>
nmap <leader>a: :Tabularize /:\zs<CR>
vmap <leader>a: :Tabularize /:\zs<CR>


""" vim-signify
let g:signify_vcs_list = ['git', 'hg', 'svn']
nmap <leader>gj <plug>(signify-next-hunk)
nmap <leader>gk <plug>(signify-prev-hunk)


""" airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1


""" undotree
nnoremap <F7> :UndotreeToggle<CR>


" noremap <leader>s :LeaderfLine<CR>
let g:Lf_CacheDirectory = expand('~/.vim/cache')
let g:Lf_RootMarkers = ['.root', '.project', '.root', '.svn', '.git']
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_ShowRelativePath = 0
let g:Lf_HideHelp = 1
let g:Lf_StlColorscheme = 'powerline'
let g:Lf_PreviewResult = {'Function':0, 'BufTag':0}


""" Auto Pairs
" let g:AutoPairsFlyMode = 1


""" asyncrun.vim
:let g:asyncrun_open = 6
let g:asyncrun_bell = 1
" nnoremap <F9> :call asyncrun#quickfix_toggle(6)<CR>

""" echodoc
let g:echodoc#enable_at_startup = 1

""" vim-gutentags
" let $GTAGSLABEL = 'native-pygments'
" let $GTAGSCONF = '/usr/share/gtags/gtags.conf'
" " let g:gutentags_define_advanced_commands = 1
" let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']
" let g:gutentags_modules = ['ctags', 'gtags_cscope']
" let g:gutentags_ctags_extra_args = ['--fields=+niazfksS', '--extra=+qf']
" let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
" let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
let g:gutentags_cache_dir = expand('~/.cache/vim/tags')
" let g:gutentags_auto_add_gtags_cscope = 0

autocmd FileType gitcommit,gitconfig,gitignore let g:gutentags_enabled=0

""" vim-repl
let g:sendtorepl_invoke_key = "<leader><leader>r"

""" vim-togglelist
let g:toggle_list_no_mappings = 1
nmap <script> <silent> <leader><leader>l :call ToggleLocationList()<CR>
nmap <script> <silent> <leader><leader>q :call ToggleQuickfixList()<CR>


""" vim-devicons
if has('gui_running')
    let g:webdevicons_enable = 1
else
    let g:webdevicons_enable = 0
endif

function! StartifyEntryFormat()
    return 'WebDevIconsGetFileTypeSymbol(absolute_path) ." ". entry_path'
endfunction

" Set up vim configure by myself
"""""""""""""""""""""""""""""""""""""""""
"" set up vundle
"""""""""""""""""""""""""""""""""""""""""
set nocompatible "" donot be compaible to plain VI
filetype off
""set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'ervandew/supertab'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'bling/vim-airline'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'Shougo/unite.vim'
Plugin 'klen/python-mode'
Plugin 'tikhomirov/vim-glsl'
Plugin 'jcfaria/Vim-R-plugin'
Plugin 'beyondmarc/opengl.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'majutsushi/tagbar'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'Raimondi/delimitMate'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
"Plugin 'roman/golden-ratio'
Plugin 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}
Plugin 'vim-scripts/a.vim'
Plugin 'vim-scripts/c.vim'
" The sparkup vim script is in a subdirectory of this repo called vim.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

" All of your Plugins must be added before the following line
call vundle#end()
filetype on      " check file type
filetype indent plugin on
"  Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
""""""""""""""""""""""""""""""""""""""""""""""""""""""
"basic vim settings"
""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nu           " display the line number
set nocp
set wildmenu     " Turn on wildmenu, useful on commandline completetion
set ruler        " Always show current position
set mouse=a      " use the mouse
set history=500  " record history
set textwidth=79 " set the text width
set colorcolumn=79
set backspace=2
set autochdir
set autoread 	 " auto read file after modified
set encoding=utf8
set cmdheight=2  " avoid create new cpp error from ycm, donot understand
syntax on        " syntax highlight
au FocusLost * silent! wa " autosave files when it loses the focus
""""""""""""""""""""""""""""""""""""""
"display closed view"
""""""""""""""""""""""""""""""""""""""
""au BufWinLeave * mkview
""au BufWinEnter * silent loadview
""""""""""""""""""""""""""""""""""""""
"time stamp"
""""""""""""""""""""""""""""""""""""""
:nnoremap <F7> "=strftime("// LastModified: %c")<CR>P
:inoremap <F7> <C-R>=strftime("%c")<CR>
""""""""""""""""""""""""""""""""""""""
"colorscheme for debian"
""""""""""""""""""""""""""""""""""""""
set background=dark
if has('gui_running')
	colorscheme solarized " candidate molokai desert tango2 two2tango solarized
	set guioptions-=m ""remove menubar
	set guioptions-=T ""remove toolbar
	"""remove the left side scroll bar and also fix bug that cursor disappear"
	set guioptions-=L
	set guioptions-=l
else 
	colorscheme oceandeep		
endif
set guifont=Monaco\ 15 ""Monospace\ 15
""""""""""""""""""""""""""""""""""""""
"indent match search"
""""""""""""""""""""""""""""""""""""""
set autoindent
set smartindent  
""set cindent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab

set ignorecase   " ignore case when searching
set smartcase

set incsearch    " search while typing
set hlsearch
set showmatch    " show the match result
"""""""""""""""""""""""""""""""""""""""""
"check spell & fold"
"""""""""""""""""""""""""""""""""""""""""
let mapleader= ","
nmap <silent> <leader>s :set spell!<CR>
set spelllang=en

set foldlevel=1
set foldnestmax=3
set foldmethod=syntax
set nofoldenable
"""""""""""""""""""""""""""""""""""""
" Ctags for vim
"""""""""""""""""""""""""""""""""""""
""Ctrl-Left_MouseClick - Go to definition
""Ctrl-Right_MouseClick - Jump back from definition 
""C-] - go to definition
""C-T - Jump back from the definition.
""C-W C-] - Open the definition in a horizontal split 
"" C-\ - Open the definition in a new tab
"" A-] - Open the definition in a vertical split
set tags+=./tags
set tags+=../tags
set tags+=~/.vim/tags/*
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
map <F9> :!ctags -R --sort=yes --c++-kinds=+pl --fields=+iaS --extra=+q .<CR>
""""""""""""""""""""""""""""""""""""""""""""""""
" YCM configure
""""""""""""""""""""""""""""""""""""""""""""""""
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_collect_identifiers_from_tag_files = 0
let g:ycm_complete_in_comments = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_complete_in_strings = 1
let g:ycm_seed_identifiers_with_syntax = 1  " feed ycm identifier with syntax keywords
let g:ycm_confirm_extra_conf=0
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gd :YcmCompleter GoToDeclaration<CR>
""""""""""""""""""""""""""""""""""""""""""""""""
" SuperTab settings
""""""""""""""""""""""""""""""""""""""""""""""""
let g:SuperTabDefaultCompletionType='context'
""""""""""""""""""""""""""""""""""""""""""""""""
" MiniBufExplorer settings
""""""""""""""""""""""""""""""""""""""""""""""""
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1 
let g:miniBufExplMapCTabSwitchBufs = 1 
let g:miniBufExplModSelTarget = 1
let g:miniBufExplMoreThanOne=0
" MiniBufExpl Colors
hi MBEVisibleActive guifg=#A6DB29 guibg=fg
hi MBEVisibleChangedActive guifg=#F1266F guibg=fg
hi MBEVisibleChanged guifg=#F1266F guibg=fg
hi MBEVisibleNormal guifg=#5DC2D6 guibg=fg
hi MBEChanged guifg=#CD5907 guibg=fg
hi MBENormal guifg=#808080 guibg=fg
nnoremap <C-k> <C-w><Up>
nnoremap <C-j> <C-w><Down>
nnoremap <C-l> <C-w><Right>
nnoremap <C-h> <C-w><Left>
""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDCommenter <leader>cc, <leader>cu, <leader>c<space>
" NERDTree settings
""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDTree_title="[NERDTree]"
let g:winManagerWindowLayout="NERDTree|TagList"
map <leader>n :NERDTreeToggle<CR>

nmap <F8> :TagbarToggle<CR>
""""""""""""""""""""""""""""""""""""""""""""""
" Unite 
""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>uf :Unite file
nnoremap <leader>ub :Unite buffer
nnoremap <leader>ua :Unite file buffer
""""""""""""""""""""""""""""""""""""""""""""""
" UltiSnips
""""""""""""""""""""""""""""""""""""""""""""""
let g:UltiSnipsExpandTrigger="<c-tab>"
let g:UltiSnipsListSnippets="<c-s-tab>"
""""""""""""""""""""""""""""""""""""""""""""""
" python-mode pymode
""""""""""""""""""""""""""""""""""""""""""""""
let g:pymode_options = 1
let g:pymode_indent = 1
let g:pymode_folding = 0        " folding make vim python frozen   
let g:pymode_rope_completion = 0
let g:pymode_lint = 1
let g:pymode_options_max_line_length = 79
""""""""""""""""""""""""""""""""""""""""""""""
" nerdcommenter
""""""""""""""""""""""""""""""""""""""""""""""
""<Leader>cc 注释一行
""<Leader>cu 取消注释一行
""<Leader>ca 切换注释模式 ／／ 或 /**／
""<Leader>cm 以block的最简方式注释一段代码
""<Leader>ci 以独立注释单行的方式 注释选中的每一行， 注释模式取决<Leader>ca
""<Leader>cs 以block的常规方式注释一段代码
""<Leader>cA 在行尾巴追加注释，注释模式取决于<Leader>ca
""""""""""""""""""""""""""""""""""""""""""""""
" easymotion
""""""""""""""""""""""""""""""""""""""""""""""
let g:EasyMotion_smartcase = 1
""""""""""""""""""""""""""""""""""""""""""""""
" cpp enhanced highlighting
""""""""""""""""""""""""""""""""""""""""""""""
let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_template_highlight = 1
""""""""""""""""""""""""""""""""""""""""""""""
" airline
""""""""""""""""""""""""""""""""""""""""""""""

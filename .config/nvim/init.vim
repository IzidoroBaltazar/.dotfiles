set encoding=utf-8
scriptencoding utf-8
" vim-plug (https://github.com/junegunn/vim-plug) settings 
" Automatically install vim-plug and run PlugInstall if vim-plug not found
"
"This parameter might be necessary behind Proxy
let $GIT_SSL_NO_VERIFY = 'true'

"autocmd FileType javascript set formatprg=prettier\ --stdin
"autocmd BufWritePre *.js :normal gggqG

if empty(glob('~/.config/nvim/autoload/plug.vim'))
    "if behind proxy use --insecure switch
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

call plug#begin('~/.config/nvim/plugged')
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }

Plug 'AndrewRadev/splitjoin.vim'
Plug 'alvan/vim-closetag'
Plug 'bronson/vim-visual-star-search'
Plug 'brookhong/cscope.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'dhruvasagar/vim-table-mode'
Plug 'ervandew/supertab'
Plug 'itchyny/lightline.vim'
Plug 'joshdick/onedark.vim'
Plug 'tell-k/vim-autopep8'

Plug 'fidian/hexmode'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/seoul256.vim'
Plug 'jnurmine/Zenburn'

Plug 'justinmk/vim-sneak'
Plug 'matze/vim-move'
Plug 'mbbill/undotree'
Plug 'mhartington/oceanic-next'
Plug 'nvie/vim-flake8'
Plug 'sheerun/vim-polyglot'
Plug 'scrooloose/nerdcommenter'
Plug 'sickill/vim-pasta'

Plug 'sts10/vim-mustard'
Plug 'sts10/vim-zipper'

Plug 'terryma/vim-multiple-cursors'
Plug 'terryma/vim-smooth-scroll'

Plug 'tmhedberg/matchit'

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'

Plug 'zah/nim.vim'

Plug 'vim-ruby/vim-ruby'
"Plug 'maksimr/vim-jsbeautify'
Plug 'w0rp/ale'
Plug 'python-mode/python-mode'
Plug 'integralist/vim-mypy'
Plug 'vim-syntastic/syntastic'
Plug 'wellle/targets.vim'
Plug 'neoclide/coc-tabnine'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'kana/vim-textobj-user'
Plug 'lucapette/vim-textobj-underscore' | Plug 'kana/vim-textobj-user'
Plug 'jceb/vim-textobj-uri'             | Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-indent'          | Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-line'            | Plug 'kana/vim-textobj-user'

Plug 'alaviss/nim.nvim'
Plug 'chienfuchen32/image.vim'

call plug#end()

let g:OS_name=system('uname -s')

let g:OS_dir_separator = '/'
let g:OS_cat_command = 'cat'
let g:OS_mkdir_command = 'mkdir -p'
"let g:OS_ctags_command = '/opt/exp/bin/ctags'
"if filereadable(g:OS_ctags_command) == 0
    let g:OS_ctags_command = 'ctags'
"endif

" What was the name that we were called as?
"
let vinvoke=fnamemodify($_, ":p")
let fullp=substitute(vinvoke, '^\(.*[/]\).*$', '\1', "")
"
" It's possible that $VIMRUNTIME does not exist.
" Let's see if there is a directory vimshare below where we were started
"
if isdirectory($VIMRUNTIME) == 0
    let vimshare=fullp . "vimshare"
    if isdirectory(vimshare) == 1
        let $VIMRUNTIME=vimshare . "/vim" . substitute(v:version, "50", "5", "")
        let &helpfile=vimshare . "/vim" . substitute(v:version, "50", "5", "") . "/doc/help.txt"
    endif
endif

let s:home_base_path=$HOME

"" ============================
"" =           Paths          =
"" ============================
"" replace all directory separators in runtimepath to OS specific
"let &runtimepath=substitute(&runtimepath, '[\/]', g:OS_dir_separator, 'g')

" =========================================
" = Project/Versioning system integration =
" =========================================
"guess used versioning system based on environment variables
let g:VCS_name="git"

"" ============================
"" =         Sessions         =
"" ============================
"" remove possible trailing slash before creating directory $HOME/.vim/sessions
let g:user_sessions_home = substitute($HOME, '[\/]$', '', '') . g:OS_dir_separator . '.vim' . g:OS_dir_separator . 'sessions'
let g:user_session_filename = 'session.vim'
silent! execute '!' . g:OS_mkdir_command . ' ' . g:user_sessions_home

""autocmd VimEnter * call LoadSession()
""autocmd VimLeave * call SaveSession()

function! SaveSession()
	execute 'mksession! ' . g:user_sessions_home . g:OS_dir_separator . g:user_session_filename
endfunction

function! LoadSession()
	"if argc() == 0
		if v:version > 700
			tabfirst
			tabonly
		endif
		execute 'source ' . g:user_sessions_home . g:OS_dir_separator . g:user_session_filename
	"endif
endfunction

"" allow backspacing over everything in insert mode
set backspace=indent,eol,start
set history=400		" keep 400 lines of command line history
set ruler			" show the cursor position all the time
set showcmd			" display incomplete commands
set incsearch		" do incremental searching
set tabstop=4
set shiftwidth=4
set number				" line numbers
set expandtab

set cindent
set autoindent

if has("mouse")
	set mouse=a				" use mouse in xterm to scroll
endif

set scrolloff=5 		" 5 lines before and after the current line when scrolling
set ignorecase			" ignore case
set smartcase			" but don't ignore it, when search string contains uppercase letters
"set hid 				" allow switching buffers, which have unsaved changes
set shiftwidth=4		" 4 characters for indenting
"set showmatch			" showmatch: Show the matching bracket for the last ')'?
"
set nowrap				" don't wrap by default
syn on
set confirm

set hlsearch

set nostartofline
""set shiftround
"
""set autoread
""set display+=uhex
set display+=lastline

set wildmode=longest,list,full

if has("wildmenu")
    set wildmenu
endif

"" tabs are forbidden in SR projects
"set cscopequickfix=s-,c-,d-,i-,t-,e-,f0,g0		" cscope will fill results into quickfix window (possible to open via :copen command, move with <F11><F12>)
"
"imap jj	<Esc> 
"
"" follow visual lines (instead of lines) - comes into play when line wrapping is on
"map <A-Down> gj
"map <A-Up> gk
"imap <A-Up> <C-o>gk
"imap <A-Down> <C-o>gj
"
""reselect visual selection after <,> movements
vnoremap < <gv
vnoremap > >gv
"" make Y behave like other capitals 
"map Y y$
"" force saving files that require root permission 
"cmap w!! %!sudo tee > /dev/null %

set showcmd             " Show (partial) command in status line.
set showmatch           " Show matching brackets.
set showmode " Show current mode.

set spelllang=en
set spellsuggest=5

set nospell
set spelllang=en

" ============================
" =          Folding         =
" ============================
set foldmethod=indent
set foldlevelstart=20

" ============================
" =Working with multiple tabs=
" ============================
" Tab navigation like Firefox.
nnoremap <C-S-tab> :tabprevious<CR>
nnoremap <C-tab>   :tabnext<CR>
nnoremap <C-t>     :tabnew<CR>
inoremap <C-S-tab> <Esc>:tabprevious<CR>i
inoremap <C-tab>   <Esc>:tabnext<CR>i
inoremap <C-t>     <Esc>:tabnew<CR>" Tab navigation like Firefox.
nnoremap <C-S-tab> :tabprevious<CR>
nnoremap <C-tab>   :tabnext<CR>
nnoremap <C-t>     :tabnew<CR>
inoremap <C-S-tab> <Esc>:tabprevious<CR>i
inoremap <C-tab>   <Esc>:tabnext<CR>i
inoremap <C-t>     <Esc>:tabnew<CR>
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
" navigating multiple tabs - works only in graphical modes (gVim)
nmap <C-Tab> :tabnext<Enter>
nmap <C-S-Tab> :tabprev<Enter>
imap <C-Tab> <C-o>:tabnext<Enter>
imap <C-S-Tab> <C-o>:tabprev<Enter>
vmap <C-Tab> <Esc>:tabnext<Enter>gv
vmap <C-S-Tab> <Esc>:tabprev<Enter>gv

" this works also in console
nmap <C-S-Right> :tabnext<Enter>
nmap <C-S-Left> :tabprev<Enter>
imap <C-S-Right> <C-o>:tabnext<Enter>
imap <C-S-Left> <C-o>:tabprev<Enter>
vmap <C-S-Right> <Esc>:tabnext<Enter>gv
vmap <C-S-Left> <Esc>:tabprev<Enter>gv

" simplified movement through windows
nmap <C-Up> <C-S-Up>
nmap <C-Down> <C-S-Down>
imap <C-Up> <C-S-Up>
imap <C-Down> <C-S-Down>
vmap <C-Up> <C-S-Up>
vmap <C-Down> <C-S-Down>

" If the current buffer has never been saved, it will have no name,
" call the file browser to save it, otherwise just save it.
command -nargs=0 -bar Update if &modified 
                           \|    if empty(bufname('%'))
                           \|        browse confirm write
                           \|    else
                           \|        confirm write
                           \|    endif
                           \|endif
nnoremap <silent> <C-S> :<C-u>Update<CR>

" Use CTRL-S for saving, also in Insert mode
noremap <C-S> :update<CR>
vnoremap <C-S> <C-C>:update<CR>
inoremap <C-S> <C-O>:update<CR>
  
"" F2 to save
nmap <F2> :w<Enter>
imap <F2> <C-o>:w<Enter>
vmap <F2> <Esc>:w<Enter>gv

"" F4 to switch between hex and ASCII editing
function! Fxxd()
	let c=getline(".")
	if c =~ '^[0-9a-f]\{8}:'
		:%!xxd -r
	else
		:%!xxd -g4
	endif
endfunction

nmap <F4> :call Fxxd()<Enter>
imap <F4> <C-o>:call Fxxd()<Enter>
vmap <F4> <Esc>:call Fxxd()<Enter>gv

function! DiffOrig()
	if &diff
		diffoff!
		wincmd o
	else
		let ftype = &filetype
		let actualfilename=expand('%:p')
		vert new
		setlocal bt=nofile
		r #
		let &titlestring = "saved copy" . " <-> " . actualfilename
		0d_
		exe "setlocal filetype=" . ftype
		diffthis | wincmd p | diffthis
	endif
endfunction

function! GitdiffToggle()
    if &diff
        diffoff!
        q
    else
        Gvdiff
    endif
:endfunction

set pastetoggle=<F7>

nmap <F8> :TagbarToggle<Enter>
imap <F8> <C-o>:TagbarToggle<Enter>
vmap <F8> <Esc>:TagbarToggle<Enter>gv

nmap <S-F8> :TlistToggle<Enter>
imap <S-F8> <C-o>:TlistToggle<Enter>
vmap <S-F8> <Esc>:TlistToggle<Enter>gv

nmap <S-F6> :call LoadSession()<Enter>
imap <S-F6> <C-o>:call LoadSession()<Enter>
vmap <S-F6> <Esc>:call LoadSession()<Enter>gv

nmap <S-F5> :call SaveSession()<Enter>
imap <S-F5> <C-o>:call SaveSession()<Enter>
vmap <S-F5> <Esc>:call SaveSession()<Enter>gv

" F10 to quit
nmap <F10> :q<Enter>
imap <F10> <C-o>:q<Enter>
vmap <F10> <Esc>:q<Enter>gv
"map ^_ gf

nmap <S-F10> :qa<Enter>
imap <S-F10> <C-o>:qa<Enter>
vmap <S-F10> <Esc>:qa<Enter>gv

"TODO show SCCS + show featured

if g:VCS_name == "git"
    " nmap <F2> :Pyclewn<CR>
    " imap <F2> <Esc>:Pyclewn<CR>

    nmap <F5> :call DiffOrig()<Enter>
    imap <F5> <C-o>:call DiffOrig()<Enter>
    vmap <F5> <Esc>:call DiffOrig()<Enter>gv

    " nmap <F5> :Gdiff<Enter>
    " imap <F5> <C-o>:Gdiff<Enter>
    " vmap <F5> <Esc>:Gdiff<Enter>gv

    nmap <F6> :call GitdiffToggle()<Enter>
    imap <F6> <C-o>:call GitdiffToggle()<Enter>
    vmap <F6> <Esc>:call GitdiffToggle()<Enter>gv

    " nmap <F6> :Gviff BRANCH<Enter>
    " imap <F6> <C-o>:Gvdiff BRANCH<Enter>
    " vmap <F6> <Esc>:Gvdiff BRANCH<Enter>gv

    nmap <F9> :Gblame<Enter>
    imap <F9> <C-o>:Gblame<Enter>
    vmap <F9> <Esc>:Gblame<Enter>gv
    
    nmap <S-F9> :Glog<Enter>
    imap <S-F9> <C-o>:Glog<Enter>
    vmap <S-F9> <Esc>:Glog<Enter>gv
endif

" common leader mappings
let mapleader = ','
" map <Leader>l :set invlist!<CR>
map <Leader>n :set nu!<CR>
map <Leader>N :set rnu!<CR>
map <Leader>I :set diffopt-=iwhite<CR>
map <Leader>i :set diffopt+=iwhite<CR>
map <Leader>a :Autopep8<CR>
map <Leader>s :set spell!<CR>

map <Leader>p :set paste!<CR>
map <Leader>m :call SwitchMouse()<CR>

" use leader to interact with the system clipboard
set clipboard+=unnamed
set clipboard+=unnamedplus
nnoremap <Leader>p "*]p
nnoremap <Leader>P "*]P

nnoremap <Leader>y ma^"*y$`a
nnoremap <Leader>c ^"*c$
nnoremap <Leader>d ^"*d$

vnoremap <Leader>y "*y
vnoremap <Leader>c "*c
vnoremap <Leader>d "*d

"CSCOPE mappings
nnoremap <leader>fa :call CscopeFindInteractive(expand('<cword>'))<CR>
nnoremap <leader>l :call ToggleLocationList()<CR>

" s: Find this C symbol
nnoremap  <leader>fs :call CscopeFind('s', expand('<cword>'))<CR>
" g: Find this definition
nnoremap  <leader>fg :call CscopeFind('g', expand('<cword>'))<CR>
" d: Find functions called by this function
nnoremap  <leader>fd :call CscopeFind('d', expand('<cword>'))<CR>
" c: Find functions calling this function
nnoremap  <leader>fc :call CscopeFind('c', expand('<cword>'))<CR>
" t: Find this text string
nnoremap  <leader>ft :call CscopeFind('t', expand('<cword>'))<CR>
" e: Find this egrep pattern
nnoremap  <leader>fe :call CscopeFind('e', expand('<cword>'))<CR>
" f: Find this file
nnoremap  <leader>ff :call CscopeFind('f', expand('<cword>'))<CR>
" i: Find files #including this file
nnoremap  <leader>fi :call CscopeFind('i', expand('<cword>'))<CR>

nnoremap <C-\> :call CscopeFind('g', expand('<cword>'))<Enter>

nmap <C-]> :call CscopeFind('g', expand('<cword>'))<Enter>
imap <C-]> <C-o> :call CscopeFind('g', expand('<cword>'))<Enter>
vmap <C-]> y<Esc> :call  CscopeFind('g', expand('<cword>'))<Enter>

nmap <C-b> :buffer 1<Enter>

"filetype plugin indent on
inoremap {<CR> {<CR>}<C-o>O

let g:python_host_prog = '/home/martin/anaconda3/envs/python2/bin/python'
let g:python3_host_prog = '/home/martin/anaconda3/envs/python3/bin/python3'

let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Theme
syntax enable
" colorscheme seoul256
colorscheme zenburn
set background=dark
set termguicolors

" Use deoplete.
"let g:deoplete#enable_at_startup = 1

let g:lightline = {
      \ 'colorscheme': 'seoul256',
      \ }

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height=2
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = { 'passive_filetypes': ['python'] }

let g:pymode_lint_checkers = ['pylint']
let g:pymode_options_max_line_length=120
let g:pymode_rope = 0

let g:vdebug_options = {}
let g:vdebug_options["port"] = 9000
let g:vdebug_options["break_on_open"] = 0
let g:editorconfig_Beautifier = '~/.config/nvim/.editorconfig'

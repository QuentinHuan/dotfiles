set nocompatible

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
      silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
        autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif

call plug#begin('~/.vim/modules')

" Assorted scripts, modified tomorrow night colorscheme
Plug 'wjakob/wjakob.vim'

" Airline status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" NetRW alternative
Plug 'justinmk/vim-dirvish'

" Linting / compilation / autocompletion
" Plug 'dense-analysis/ale'

" Quick motions that search for 2 characters
Plug 'justinmk/vim-sneak'

" Version control annotations
Plug 'mhinz/vim-signify'

" Automatic generation of closing braces etc
Plug 'Raimondi/delimitMate'

" Dispatch build jobs asynchronously
Plug 'tpope/vim-dispatch'

" Easily search for, substitute, and abbreviate multiple variants of a word
Plug 'tpope/vim-abolish'

" Fast recursive file search
Plug 'junegunn/fzf'

" Easy alignment of tables etc.
Plug 'junegunn/vim-easy-align'

" The silver searcher integration
Plug 'mileszs/ack.vim', { 'on': 'Ack' }

" The silver searcher integration
Plug 'mbbill/undotree'

" Command to temporily maximize a buffer
Plug 'szw/vim-maximizer'

" Adapt indentation behavior for Python files
Plug 'Vimjas/vim-python-pep8-indent'

" Git integration
Plug 'tpope/vim-fugitive'

" Don't recompute folds so often
Plug 'Konfekt/FastFold'

" GLSL syntax highlighting
Plug 'tikhomirov/vim-glsl'

" tmux intergration
Plug 'christoomey/vim-tmux-navigator'

" Easily comment/uncomment code
Plug 'scrooloose/nerdcommenter', { 'on': '<plug>NERDCommenterToggle' }

Plug 'lervag/vimtex'

" Plug 'benknoble/vim-racket'

" Initialize plugin system
call plug#end()

" Replace colon and semicolon
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

" Use Q for formatting the current paragraph (or selection)
vnoremap Q gq
nnoremap Q gqap

" Fast recursive file search
if getcwd() =~ ".*/build"
    nnoremap <m-p> :call fzf#run(fzf#wrap({'dir': '..'}))<cr>
else
    nnoremap <m-p> :FZF<cr>
endif

" Core settings of VIM
set encoding=utf-8             " use UTF-8 (default latin1)
set autoread                   " auto-reload modified files (with no local changes)
set undolevels=65536           " lots of undo (default 1000)
set history=1024               " lots of history (default 20)
set mouse=                     " enable mouse (set mouse= to disable mouse)
set ttymouse=xterm2            " enable mouse resizing of splits
" set hidden                     " allow un-saved buffers in background
set lazyredraw                 " no redraws in macros
set title                      " change terminal title
set nostartofline              " don't move cursor when switching buffers/files
set ttyfast                    " smoother changes
set backspace=indent,eol,start " Make backspace behave more like in other editors
set nojoinspaces               " Don't insert two spaces after a period when joining lines
set confirm                    " dialog when :q, :w, :x, :wq fails
set splitbelow                 " Open splits below (more natural), :sp makes a split
set splitright                 " Similar to the above (for vsplit)
set display+=lastline          " Show as much as possible of the last line if it doesn't fit
set nrformats-=octal           " Don't interpret numbers with leading zero as octal
set formatoptions+=j           " Delete comment character when joining commented lines
set tabpagemax=50              " Increase tab limit (default = 10)
set sessionoptions-=options    " Don't store options in sessions and views, since these
set viewoptions-=options       " can be quite difficult to track down.
set signcolumn=yes             " Always show the sign column to avoid 'popping'
let mapleader=","              " Map the leader key to comma

" Control what extra information is shown
set noshowmode                 " don't show the mode (vim-airline already does so)
set showcmd                    " show state of keyboard input
set showmatch                  " show brace match
set matchtime=2                " when writing braces, only briefly flash the opening one (200ms)
set report=1                   " always report how many occurrences were changed by search/replace etc
set ruler                      " show position in bottom right
set winminheight=0             " allow to collapse down windows to their status line only
set laststatus=2               " Always show status bar

" Tabs, wrapping, folding, and indentation
set autoindent                 " automatic indentation
set copyindent                 " copy the previous indentation on autoindenting
set tabstop=4                  " Number of spaces that a <Tab> in the file counts for (default 8)
set shiftwidth=4               " Number of spaces to use for each step of (auto)indent.
set smarttab                   " insert tabs on the start of a line according to
                               " shiftwidth, not tabstop
set expandtab                  " Expand tabs to spaces
set textwidth=0                " no hard wrapping by default 
set wrap
set foldenable
set foldmethod=syntax          " fold using indentation by default
set foldminlines=8             " require a medium size to fold
set foldnestmax=3              " max 3 fold levels for syntax/indent folding
set foldcolumn=0

" Appearance
set number                     " enable line numbers
set scrolloff=3                " keep 3 lines below and above cursor
set sidescrolloff=5            " keep 5 columns to the left and right
set linebreak                  " show wrap at word boundaries
set showbreak=\ ↪\             " prefix wrap with ↪

" Autocompletion
set wildmenu                   " completion with menu
set wildmode=full              " show list with navigation
set wildignore=*~,*.o,*.obj,*.pyc,*.bak,*.swp,.git,*.orig
set completeopt=menuone,noselect " Completion with a menu
set complete-=i                " Don't parse headers in autocompletions

" Open 'tab completion' with Ctrl-Space
inoremap <Nul> <C-n>

" Navigate tab completion with PageDown (Ctrl-J) and PageUp (Ctrl-K)
inoremap <expr> <PageUp>   ((pumvisible())?("\<C-p>"):("\<PageUp>"))
inoremap <expr> <PageDown> ((pumvisible())?("\<C-n>"):("\<PageDown>"))

" Searching
set incsearch                  " incremental search
set hlsearch                   " enable search highlighting

" Store swap and backup files in a central location
set backupdir=/var/tmp,/tmp
set directory=/var/tmp,/tmp
set writebackup
set backup

" Spell checking
set spelllang=en
set spelllang+=fr
exec 'set spellfile='. $TERM_TOOLS . '/config/spell.en.utf-8.add'

" Use OS clipboard
if has('unix') && system('uname') == 'Linux\n'
    set clipboard=unnamedplus  " Share X windows clipboard.
else
    set clipboard=unnamed      " Share system clipboard.
endif

" Be quiet
set noerrorbells visualbell t_vb=  " No bell
au GUIEnter * set visualbell t_vb= " No bell in GUI mode

" Tell vim to remember certain things when we exit
"  '50  :  marks will be remembered for up to 50 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :50  :  up to 20 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
" set viminfo='50,\"100,:50,%

" Syntax highlighting
let &t_ut=''          " Fix background color rendering
set t_Co=256          " Assume a 256 color terminal
let &t_ZH.="\e[3m"    " Comments in italics..
let &t_ZR.="\e[23m"

if filereadable(expand("$HOME/.vim/modules/wjakob.vim/colors/tomorrow-night.vim"))
    colorscheme tomorrow-night
endif

hi Folded ctermfg=248 ctermbg=237 guibg=#3a3a3a guifg=#a8a8a8
hi Comment cterm=italic

" Change cursor style depending on mode
let &t_SI.="\e[6 q" " SI = INSERT mode (1=block, 4=underscore, 6=bar)
let &t_SR.="\e[4 q" " SR = REPLACE mode
let &t_EI.="\e[2 q" " EI = NORMAL mode

" Decode Alt + key combinations from terminal escape sequence
for i in range(0, 25)
   let ch_l = nr2char(char2nr('a') + i)
   execute "set <A-" . ch_l . ">=\e" . ch_l
   execute "inoremap <A-" . ch_l . "> " . ch_l

   if i != 15
       " For all characters except Alt-P which causes some issues
       let ch_u = nr2char(char2nr('A') + i)
       execute "set <A-" . ch_u . ">=\e" . ch_u
       execute "inoremap <A-" . ch_u . "> " . ch_u
    end
endfor

for i in range(0, 9)
   let ch = nr2char(char2nr('0') + i)
   execute "set <A-" . ch . ">=\e" . ch
   execute "inoremap <A-" . ch . "> " . ch
endfor

execute "set <A-.>=\e."
execute "set <A-,>=\e,"

" .. and adjust timeouts for this to work properly
set timeout timeoutlen=1000 ttimeoutlen=25
nnoremap <silent> <A-q> :wincmd c<CR>  " close
nnoremap <silent> <A-f> :MaximizerToggle<CR>
let g:maximizer_set_default_mapping = 0

" Move to next / previous buffer
nnoremap <nowait><silent> [ :bp<CR>
nnoremap <nowait><silent> ] :bn<CR>

function! MakeBracketMaps()
    nnoremap <nowait><silent><buffer> [ :bp<CR>
    nnoremap <nowait><silent><buffer> ] :bn<CR>
endfunction

augroup bracketmaps
    autocmd!
    autocmd BufEnter * call MakeBracketMaps()
augroup END

" After a search, press enter/space to disable highlighting
nnoremap <silent> <expr> <cr> &buftype ==# 'quickfix' ? "\<cr>" : ':noh <cr>'

" Toggle folds with the spacebar
nnoremap <silent> <expr> <space> 'za'

" Get rid of old habits (cursor keys disabled)
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

" Move by displayed lines, not physical lines (relevant when lines wrap)
nnoremap j gj
nnoremap k gk

" Re-adjust windows on window resize
au VimResized * wincmd =

" Remove the toolbar if we're running under a GUI
if has("gui_running")
  set guioptions=-t
endif

" Jump to last known line when opening a file (change ' to ` to do column too)
au BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g'\"" |
  \   if foldlevel('.') > 0 |
  \     exe "normal zO" |
  \   endif |
  \ endif

" Spell-check text files
au FileType text,tex,plaintex,html,rst,markdown,gitcommit setlocal spell

" Highlight repeated words
au FileType text,tex,plaintex,html syn match TmlDoubleWords /\c\<\(\S\+\)\_s\+\1\ze\_s/ containedin=ALL
au FileType text,tex,plaintex,html hi link TmlDoubleWords WarningMsg

" GLSL syntax highlighting
au BufNewFile,BufRead *.frag setlocal filetype=glsl
au BufNewFile,BufRead *.vert setlocal filetype=glsl
au BufNewFile,BufRead *.geo  setlocal filetype=glsl

" Powerline -- fancy status line
let g:airline_powerline_fonts = 1
let g:airline_skip_empty_sections = 1
let g:airline#extensions#wordcount#enabled = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline_extensions = ['tabline']

" Enhanced 'f', 's', 't' search using vim-sneak
let g:sneak#label = 1
let g:sneak#s_next = 0
let g:sneak#f_reset = 1
let g:sneak#t_reset = 1
let g:sneak#prompt = '> '
let g:sneak#absolute_dir = 0

nmap s <Plug>Sneak_s
nmap S <Plug>Sneak_S
xmap s <Plug>Sneak_s
xmap S <Plug>Sneak_S
omap s <Plug>Sneak_s
omap S <Plug>Sneak_S

nmap f <Plug>Sneak_f
nmap F <Plug>Sneak_F
xmap f <Plug>Sneak_f
xmap F <Plug>Sneak_F
omap f <Plug>Sneak_f
omap F <Plug>Sneak_F

nmap t <Plug>Sneak_t
nmap T <Plug>Sneak_T
xmap t <Plug>Sneak_t
xmap T <Plug>Sneak_T
omap t <Plug>Sneak_t
omap T <Plug>Sneak_T

nmap <expr> N sneak#is_sneaking() ? '<Plug>Sneak_,' : 'N'
nmap <expr> n sneak#is_sneaking() ? '<Plug>Sneak_;' : 'n'

highlight Sneak cterm=bold ctermbg=71 ctermfg=255
highlight SneakLabel cterm=bold ctermbg=71 ctermfg=255

" Insert mode -- don't create/close folds when typing
aug NoInsertFolding
    au!
    au InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
    au InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif
aug END

" Git version control annotations
let g:signify_vcs_cmds = { 'git': 'git diff --no-color --no-ext-diff -U0 -- %f' }
let g:signify_vcs_cmds_diffmode = { 'git': 'git show HEAD:./%f' }
let g:signify_sign_show_count = 0
set updatetime=100
nmap <leader>j <plug>(signify-next-hunk)
nmap <leader>k <plug>(signify-prev-hunk)
nmap <leader>J 9999<leader>j
nmap <leader>K 9999<leader>k
highlight SignifySignAdd    ctermfg=green
highlight SignifySignDelete ctermfg=red
highlight SignifySignChange ctermfg=yellow

" <leader>l to format C++ (visual and normal mode)
au FileType cpp nnoremap <silent> <buffer> <leader>l 1GVG:py3f $TERM_TOOLS/config/clang-format.py<cr>
au FileType cpp vnoremap <silent> <buffer> <leader>l :py3f $TERM_TOOLS/config/clang-format.py<cr>
au FileType cuda nnoremap <silent> <buffer> <leader>l 1GVG:py3f $TERM_TOOLS/config/clang-format.py<cr>
au FileType cuda vnoremap <silent> <buffer> <leader>l :py3f $TERM_TOOLS/config/clang-format.py<cr>

au BufNewFile,BufRead *.mm set filetype=cpp

" Delete trailing white space
fun! DeleteTrailingWS()
    let l:winview = winsaveview()
    %s/\s\+$//ge
    call winrestview(l:winview)
endfun
noremap <silent> <leader>dw <esc>:call DeleteTrailingWS()<cr>

" C++: warn about space errors (tabs, trailing spaces)
let c_space_errors = 1

" C++: Convenient key binding for delimitMate
au FileType cpp inoremap <buffer> {<CR> {<CR>}<C-o>O

au BufNewFile,BufRead mitsuba.conf set syntax=jsonc

au Syntax cpp syn keyword cType Float
au Syntax cpp syn keyword cType Spectrum

" Smart indent when entering insert mode with i on empty lines
function! IndentWithI()
    if len(getline('.')) == 0 && line('.') != line('$')
        return "\"_ddO"
    else
        return "i"
    endif
endfunction

nnoremap <expr> i IndentWithI()

" SCons* files are Python scripts
au BufRead,BufNewFile SCons* setlocal filetype=python
au BufNewFile,BufRead *.html setlocal filetype=htmldjango

" Different indentation settings for CMake
au FileType cmake setlocal tabstop=2 shiftwidth=2

set makeprg='ninja'

" Build system -- run make/ninja and don't prompt for ENTER
let g:dispatch_no_maps = 1 " We want to set up our own keybindings
nnoremap <silent> <Leader>m :update<CR>:Make<CR>
au BufEnter *.tex nnoremap <silent> <buffer> <Leader>m :Dispatch! make<CR>
au BufEnter *.py nnoremap <silent> <buffer> <Leader>t :Dispatch bash -c "export COLUMNS=30; pytest -q --color=no --tb=short %"<CR>

" Asynchronous linter
" let g:ale_linters = {
" \   'cpp': ['clangd'],
" \   'python': ['pycodestyle', 'pyflakes']
" \}
"
" let g:ale_completion_enabled = 1
" let g:ale_virtualenv_dir_names = []
" let g:ale_cache_executable_check_failures = 1
"
" let g:ale_pattern_options = {
" \   '.*\.tex$': {'ale_enabled': 0}
" \}
"
" nnoremap <silent> D :ALEGoToDefinition<CR>
" nnoremap <silent> R :ALEFindReferences<CR>

" TeX settings
let g:tex_conceal="abmg"
let g:tex_fold_enabled=1
let g:tex_comment_nospell=1
let g:tex_no_error=1

au BufEnter *.tex setlocal conceallevel=2 ft=tex nowrap foldmethod=manual

nnoremap <silent> <leader>t :Dispatch!/Applications/Skim.app/Contents/SharedSupport/displayline -g <C-r>=line('.')<cr> *.pdf %<<CR>

" Debug highlighting groups
function! SynStack ()
    for i1 in synstack(line("."), col("."))
        let i2 = synIDtrans(i1)
        let n1 = synIDattr(i1, "name")
        let n2 = synIDattr(i2, "name")
        echo n1 "->" n2
    endfor
endfunction
nnoremap <leader>q :call SynStack()<CR>

" Vim fugitive
set diffopt=vertical " Split diffs side-by-side
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gr :Gread<CR>
nnoremap <leader>gw :Gwrite<CR><CR>
nnoremap <leader>gc :Gcommit -v -q<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gl :Glog<CR>

" Make a markdown file by default
autocmd VimEnter {} setlocal ft=txt

" tmux integration
let g:tmux_navigator_no_mappings = 1

" undo tree
nnoremap <silent> U :UndotreeToggle<CR>

" Seamlessly move around using Alt + navigation keys
nnoremap <silent> <A-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <A-j> :TmuxNavigateDown<cr>
nnoremap <silent> <A-k> :TmuxNavigateUp<cr>
nnoremap <silent> <A-l> :TmuxNavigateRight<cr>

nnoremap <silent> <A-.> :vsplit<cr>
nnoremap <silent> <A-,> :split<cr>

" Comments
let NERDCreateDefaultMappings=0
let NERDCommentEmptyLines=1
let NERDSpaceDelims=1
let NERDTrimTrailingWhitespace=1
let NERDDefaultNesting=0
let NERDDefaultAlign='left'
nmap <leader><leader> <plug>NERDCommenterToggle
vmap <leader><leader> <plug>NERDCommenterToggle

" Easy-align plugin
nmap <leader>a <Plug>(EasyAlign)
xmap <leader>a <Plug>(EasyAlign)

set cursorline

" This is necessary for VimTeX to load properly. The "indent" is optional.
" Note: Most plugin managers will do this automatically!
filetype plugin indent on

" This enables Vim's and neovim's syntax-related features. Without this, some
" VimTeX features will not work (see ":help vimtex-requirements" for more
" info).
" Note: Most plugin managers will do this automatically!
syntax enable

" Viewer options: One may configure the viewer either by specifying a built-in
" viewer method:
let g:vimtex_view_method = 'zathura'


" VimTeX uses latexmk as the default compiler backend. If you use it, which is
" strongly recommended, you probably don't need to configure anything. If you
" want another compiler backend, you can change it as follows. The list of
" supported backends and further explanation is provided in the documentation,
" see ":help vimtex-compiler".
" let g:vimtex_compiler_method = 'latexrun'
let g:vimtex_compiler_latexmk = {
    \ 'options' : [
    \   '-pdf',
    \   '-shell-escape',
    \   '-verbose',
    \   '-file-line-error',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
    \ ],
    \}

" Most VimTeX mappings rely on localleader and this can be changed with the
" following line. The default is usually fine and is the symbol "\".
" let maplocalleader = ","

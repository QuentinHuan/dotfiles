local vim = vim
local Plug = vim.fn['plug#']

-- --------------------------------------
--               PLUGINS
-- --------------------------------------
vim.call('plug#begin')

-- Color theme
Plug ('rebelot/kanagawa.nvim')

-- Status bar
Plug ('nvim-lualine/lualine.nvim')

-- Parser and syntax coloring
Plug ('nvim-treesitter/nvim-treesitter')

-- Fuzzy finder
Plug ('nvim-lua/plenary.nvim')
Plug ('nvim-telescope/telescope.nvim', { ['tag'] = '0.1.8' })
Plug ('BurntSushi/ripgrep')

-- Linting / compilation / autocompletion
Plug ('dense-analysis/ale')


-- tmux integration
Plug ('christoomey/vim-tmux-navigator')

-- Command to temporily maximize a buffer
Plug ('szw/vim-maximizer')

-- Haskell tools
-- Plug ('MrcJkb/haskell-tools.nvim')
Plug ('neovimhaskell/haskell-vim') -- better syntax coloring
Plug ('alx741/vim-hindent') -- auto indent on save

-- Snippets
Plug ('SirVer/ultisnips')
Plug ('honza/vim-snippets')

-- Easy comment/uncomment
Plug ('scrooloose/nerdcommenter', { ['on'] = '<plug>NERDCommenterToggle' });

-- Latex integration
Plug ('lervag/vimtex')
Plug ('PatrBal/vim-textidote')

-- Plug ('bfrg/vim-c-cpp-modern')
vim.call('plug#end')

-- --------------------------------------
--              Color Scheme
-- --------------------------------------

-- Status bar color
require('lualine').setup {
  options = { theme  = "auto" },
}
vim.cmd("set noshowmode") -- don't show the mode (lightline already does it)

-- Main color scheme
vim.cmd("colorscheme kanagawa")


-- --------------------------------------
--         Core settings of VIM
-- --------------------------------------
-- Replace colon and semicolon
vim.cmd("nnoremap ; :")
vim.cmd("nnoremap : ;")
vim.cmd("vnoremap ; :")
vim.cmd("vnoremap : ;")

-- core settings
vim.cmd("set encoding=utf-8")             -- use UTF-8 (default latin1)
vim.cmd("set autoread")                   -- auto-reload modified files (with no local changes)
vim.cmd("set undolevels=65536")           -- lots of undo (default 1000)
vim.cmd("set history=1024")               -- lots of history (default 20)
vim.cmd("set lazyredraw")                 -- no redraws in macros
vim.cmd("set title")                      -- change terminal title
vim.cmd("set nostartofline")              -- don't move cursor when switching buffers/files
vim.cmd("set ttyfast")                    -- smoother changes
vim.cmd("set backspace=indent,eol,start") -- Make backspace behave more like in other editors
vim.cmd("set nojoinspaces")               -- Don't insert two spaces after a period when joining lines
vim.cmd("set confirm")                    -- dialog when :q, :w, :x, :wq fails
vim.cmd("set splitbelow")                 -- Open splits below (more natural), :sp makes a split
vim.cmd("set splitright")                 -- Similar to the above (for vsplit)
vim.cmd("set display+=lastline")          -- Show as much as possible of the last line if it doesn't fit
vim.cmd("set nrformats-=octal")           -- Don't interpret numbers with leading zero as octal
vim.cmd("set formatoptions+=j")           -- Delete comment character when joining commented lines
vim.cmd("set tabpagemax=50")              -- Increase tab limit (default = 10)
vim.cmd("set sessionoptions-=options")    -- Don't store options in sessions and views, since these
vim.cmd("set viewoptions-=options")       -- can be quite difficult to track down.
vim.cmd("set signcolumn=yes")             -- Always show the sign column to avoid 'popping'
vim.cmd( "let mapleader=','")             -- Map the leader key to comma
vim.cmd("set hidden")                     -- allow un-saved buffers in background

-- Control what extra information is shown
vim.cmd("set noshowmode")                 -- don't show the mode (vim-airline already does so)
vim.cmd("set showcmd")                    -- show state of keyboard input
vim.cmd("set showmatch")                  -- show brace match
vim.cmd("set matchtime=2")                -- when writing braces, only briefly flash the opening one (200ms)
vim.cmd("set report=1")                   -- always report how many occurrences were changed by search/replace etc
vim.cmd("set ruler")                      -- show position in bottom right
vim.cmd("set winminheight=0")             -- allow to collapse down windows to their status line only
vim.cmd("set laststatus=2")               -- Always show status bar


-- Tabs, wrapping, folding, and indentation
vim.cmd("set autoindent")                 -- automatic indentation
vim.cmd("set copyindent")                 -- copy the previous indentation on autoindenting
vim.cmd("set tabstop=4")                  -- Number of spaces that a <Tab> in the file counts for (default 8)
vim.cmd("set shiftwidth=4")               -- Number of spaces to use for each step of (auto)indent.
vim.cmd("set smarttab")                   -- insert tabs on the start of a line according to shiftwidth, not tabstop
vim.cmd("set expandtab")                  -- Expand tabs to spaces
vim.cmd("set textwidth=0")                -- no hard wrapping by default 
vim.cmd("set wrap")
vim.cmd("set foldenable")
vim.cmd("set foldmethod=syntax")          -- fold using indentation by default
vim.cmd("set foldminlines=8")             -- require a medium size to fold
vim.cmd("set foldnestmax=3")              -- max 3 fold levels for syntax/indent folding
vim.cmd("set foldcolumn=0")


-- Appearance
vim.cmd("set number")                     -- enable line numbers
vim.cmd("set scrolloff=3")                -- keep 3 lines below and above cursor
vim.cmd("set sidescrolloff=5")            -- keep 5 columns to the left and right
vim.cmd("set linebreak")                  -- show wrap at word boundaries
vim.cmd([[set showbreak="\ ↪\"]])             -- prefix wrap with ↪
vim.cmd("set cursorline")                 -- set cursor line to make it easier to see

-- Autocompletion
vim.cmd("set wildmenu")                   -- completion with menu
vim.cmd("set wildmode=full")              -- show list with navigation
vim.cmd("set wildignore=*~,*.o,*.obj,*.pyc,*.bak,*.swp,.git,*.orig")
vim.cmd("set completeopt=menuone,noselect") -- Completion with a menu
vim.cmd("set complete-=i")                -- Don't parse headers in autocompletions

-- Store swap and backup files in a central location
vim.cmd("set backupdir=/var/tmp,/tmp")
vim.cmd("set directory=/var/tmp,/tmp")
vim.cmd("set writebackup")
vim.cmd("set backup")

-- Spell checking
vim.cmd("set spelllang=en")
vim.cmd("set spelllang+=fr")
vim.cmd("exec 'set spellfile='. $TERM_TOOLS . '/config/spell.en.utf-8.add'")

-- Use OS clipboard
vim.cmd("set clipboard=unnamedplus")  -- Share X windows clipboard.

-- Be quiet
vim.cmd("set noerrorbells visualbell t_vb= ") -- No bell
vim.cmd("au GUIEnter * set visualbell t_vb= ")-- No bell in GUI mode

-- Comments in italics..
vim.cmd([[let &t_ZH.="\e[3m"]])    
vim.cmd([[let &t_ZR.="\e[23m"]])
vim.cmd("hi Comment cterm=italic")

-- Toggle folds with the spacebar
vim.cmd([[nnoremap <silent> <expr> <space> 'za']])


-- Move by displayed lines, not physical lines (relevant when lines wrap)
vim.cmd("nnoremap j gj")
vim.cmd("nnoremap k gk")

-- After a search, press enter/space to disable highlighting
vim.cmd([[nnoremap <silent> <expr> <cr> &buftype ==# 'quickfix' ? "\<cr>" : ':noh <cr>']])

-- Syntax and indent
vim.cmd("syntax on")
vim.cmd("filetype plugin indent on")

-- --------------------------------------
--         Tmux style navigation
-- --------------------------------------
-- tmux integration
vim.cmd("let g:tmux_navigator_no_mappings = 1")

-- Seamlessly move around using Alt + navigation keys
vim.cmd("nnoremap <silent> <A-h> :TmuxNavigateLeft<cr>")
vim.cmd("nnoremap <silent> <A-j> :TmuxNavigateDown<cr>")
vim.cmd("nnoremap <silent> <A-k> :TmuxNavigateUp<cr>")
vim.cmd("nnoremap <silent> <A-l> :TmuxNavigateRight<cr>")
-- Split
vim.cmd("nnoremap <silent> <A-.> :vsplit<cr>")
vim.cmd("nnoremap <silent> <A-,> :split<cr>")
-- Close windows
vim.cmd("nnoremap <silent> <A-q> :wincmd c<CR>")  
vim.cmd("nnoremap <silent> <A-f> :MaximizerToggle<CR>")
vim.cmd("let g:maximizer_set_default_mapping = 0")
-- --------------------------------------
--              Fuzzy finder
-- --------------------------------------
-- Telescope fuzzy finder key bindings
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

-- --------------------------------------
--  Tree sitter parsing and syntax coloring
-- --------------------------------------

require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the listed parsers MUST always be installed)
  ensure_installed = { "c", "cpp", "haskell", "python", "bash", "cmake", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  -- List of parsers to ignore installing (or "all")
  -- ignore_install = { "javascript" },

  highlight = {
    enable = true,

    disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
    end,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}


-- --------------------------------------
--         Asynchronous linter
-- --------------------------------------
vim.cmd([[let g:ale_linters = {
    \   'cpp': ['clangd'],
    \   'python': ['pycodestyle', 'pyflakes'],
    \   'haskell': ['stack_build', 'stack_ghc']
    \}]])

vim.cmd("let g:ale_completion_enabled = 1")
vim.cmd("let g:ale_virtualenv_dir_names = []")
vim.cmd("let g:ale_cache_executable_check_failures = 1")

vim.cmd("nnoremap D :ALEGoToDefinition<CR>")
vim.cmd("nnoremap R :ALEFindReferences<CR>")
-- USEFULL ?
-- vim.cmd([[let g:ale_pattern_options = {
--     \   '.*\.tex$': {'ale_enabled': 0}
--     \}]])


-- --------------------------------------
--             Haskell config 
-- --------------------------------------
-- Haskell config
vim.cmd("let g:haskell_enable_quantification = 1")    -- to enable highlighting of `forall`
vim.cmd("let g:haskell_enable_recursivedo = 1")      -- to enable highlighting of `mdo` and `rec`
vim.cmd("let g:haskell_enable_arrowsyntax = 1")       -- to enable highlighting of `proc`
vim.cmd("let g:haskell_enable_pattern_synonyms = 1") -- to enable highlighting of `pattern`
vim.cmd("let g:haskell_enable_typeroles = 1")        -- to enable highlighting of type roles
vim.cmd("let g:haskell_enable_static_pointers = 1")  -- to enable highlighting of `static`
vim.cmd("let g:haskell_backpack = 1")                -- to enable highlighting of backpack keywords
vim.cmd("let g:haskell_classic_highlighting = 0")
vim.cmd("let g:haskell_indent_disable = 1")

-- Hindent (auto indent on save)
vim.cmd("let g:hindent_indent_size = 4")

--------------------
--  Latex config  --
--------------------
vim.cmd([[let g:vimtex_view_method = 'zathura']])
vim.cmd([[let g:vimtex_compiler_latexmk = {
    \ 'options' : [
    \   '-pdf',
    \   '-shell-escape',
    \   '-verbose',
    \   '-file-line-error',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
    \ ],
    \}
    ]])

-- TeX settings
vim.cmd([[let g:tex_conceal="abmg"]])
vim.cmd([[let g:tex_fold_enabled=1]])
vim.cmd([[let g:tex_comment_nospell=1]])
vim.cmd([[let g:tex_no_error=1]])
vim.cmd([[au BufEnter *.tex setlocal conceallevel=2 ft=tex foldmethod=indent]])

-- --------------------------------------
--             Various thingy
-- --------------------------------------

-- Flash yanked text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  callback = function()
    vim.highlight.on_yank()
  end,
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
})

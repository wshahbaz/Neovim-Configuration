"PRE-ESSENTIALS"
    set nocompatible                        "use vim settings rather than vi settings"
    set history=200                       "set cmdline history to 200 lines
    filetype plugin on                      "enable plugins per filetype

"PLUG INS"
call plug#begin('$XDG_CONFIG_HOME/nvim/plugged')
	Plug 'kyoz/purify', { 'rtp': 'vim' }        		"Purity colour schemes
    Plug 'jiangmiao/auto-pairs'                         "auto close brackets
    Plug 'vim-airline/vim-airline'                      "Airline bar at the bottom
    Plug 'vim-airline/vim-airline-themes'               "Arline colour themes
    Plug 'lilydjwg/colorizer'                           "Shows actual colours of colours
    Plug 'tpope/vim-eunuch'                             "L" "Vim sugar for unix commands
    Plug 'tpope/vim-fugitive'                           "L" "Git support
    Plug 'airblade/vim-gitgutter'                       "Show and handle git changes
    Plug 'frazrepo/vim-rainbow'                         "highlight brackets
    "Plug 'dhruvasagar/vim-table-mode'                  "for creating tables easily - only use when needed
    "Plug 'chrisbra/csv.vim'                            "Plugin for CSVs
    Plug 'preservim/nerdtree'                           "L" "File explorer
    Plug 'ctrlpvim/ctrlp.vim'                           "L" "status bar fuzzy finder
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } "L" "fuzzy finder
    Plug 'junegunn/fzf.vim'                             "L" "fuzzy finder config
    Plug 'tpope/vim-projectionist'                      "L" "granular project configuration
    Plug 'tomtom/tcomment_vim'                          "L" "Vim Commenter
    Plug 'terryma/vim-multiple-cursors'                 "L" "Vim multicursor functionality
    Plug 'tpope/vim-surround'                           "L" "Vim outer bracket/quoting support
    Plug 'easymotion/vim-easymotion'                    "L" "Easy traversal of searches
    Plug 'tpope/vim-unimpaired'                         "L" "Lots of useful key bindings with bracket leaders
    Plug 'tpope/vim-repeat'                             "Allows repeating vim-srrounds, vim-unimpaired
    Plug 'majutsushi/tagbar'                            "L" "ctags browser
    "Plug 'powerline/powerline'                         "L" "Very powerful customizeable setup bar
    "Plug 'jmcantrell/vim-virtualenv'                   "L" "Setup virtual envs for PYthon -> integrateable"
    Plug 'jlanzarotta/bufexplorer'                      "L" "Buffer explorer

call plug#end()

"EDITING LOOKS"

	"SPACING
	set ai                                  "auto-indent
	set ts=4                                "tab stop
	set shiftwidth=4                        "levels of indentation
	set cindent                             "c autoindenting
	set softtabstop=4 						"see multiple spaces as tabstops
	set expandtab							"converts tabs to white space

	"TEXT
	colorscheme purify                      "colorscheme
    syntax enable                           "enable syntax highlighting
    syntax on                               "turn on for Purify plug-in
    set display+=lastline                   "try to show paragraph's last line"

	"OTHER FORMATTING
	set number relativenumber                                  "numbering
	set incsearch                           "incremental search
	set hlsearch                            "highlight search
	set ic                                  "ignore case while searching
    set smartcase                           "automatically switch to case-sensitive on uppercase added"
    set ruler                               "show line number and column"

	"CODING
    set showmatch							"show matching brackets

    "WINDOW
    set cmdheight=1                 " use a status bar that is 1 rows high
    set showcmd                     " show cmd in last line of screen"
    set updatetime=400              " Update every 400ms
        "Make help windows open vsplits
        augroup vimrc_help
            autocmd!
            autocmd BufEnter *.txt if &buftype == 'help' | wincmd L | endif
        augroup END

    "Plugins"
        "Airline
            let g:airline_theme='powerlineish'       "airline theme
            let g:airline_powerline_fonts=1         "font type"
            let g:airline#extensions#tabline#enabled = 1

        "Vim-GitGutter
            let g:gitgutter_max_signs = 200
            highlight GitGutterAdd ctermfg=2
            highlight GitGutterDelete ctermfg=1
            highlight GitGutterChange ctermfg=3
            highlight GitGutterChangeDelete ctermfg=4

        "Vim-Rainbow
            let g:rainbow_active=1

        "NERD Tree
            autocmd StdinReadPre * let s:std_in=1
            autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif


"FUNCTIONALITY"

    "WORKFLOW
    set splitright      "split panes from right
    set hidden                              "keep changes in buffers after switching
    set laststatus=2                        "always show status bar"
    set noerrorbells                        "no beep on errors"
    set visualbell                          "flash screen instead of beeping on errors"

    "TRAVERSAL
    set whichwrap+=<,>,h,l,[,]      "wrap traversal
    set mouse-=a                        "disable mouse
    set scrolloff=1                                 "number of lines to keep cursor from edge while scrolling vertically"
    set sidescrolloff=5                             "number of lines to keep cursor from edge while scrolling horizontally"

    "FORMATTING"
    autocmd BufWritePre * :%s/\s\+$//e      "eliminate trailing whitespace
    set listchars=tab:!·,trail:·                "show tabs spacing cleanly when `set list` enabled"
    set linebreak                               "vaoid wrapping line in middle of word"

    "CODING
    set path+=**                                "recursively search in sybfolders"
    set wildmode=longest,list,full                   "set wildmode, with tab completion and traversal"
    set foldmethod=indent                       "fold code by indent"
    set nofoldenable                            "disable folding by default"
    autocmd Filetype * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
    set clipboard=unnamedplus                   "copy and paste text from vim into other windows"

"KEY BINDINGS

    "FLOW"
        "Vim-Gitgutter"
            nmap ]h <Plug>(GitGutterNextHunk)
            nmap [h <Plug>(GitGutterPrevHunk)
            nmap ghs <Plug>(GitGutterStageHunk)
            nmap ghu <Plug>(GitGutterUndoHunk)
            nmap ghp <Plug>(GitGutterPreviewHunk)

        "Vim-Easy Motion"
            map  <Leader>f <Plug>(easymotion-bd-f)
            nmap <Leader>f <Plug>(easymotion-overwin-f)
            nmap <Leader>s <Plug>(easymotion-overwin-f2)
            map <Leader>L <Plug>(easymotion-bd-jk)
            nmap <Leader>L <Plug>(easymotion-overwin-line)
            map  <Leader>w <Plug>(easymotion-bd-w)
            nmap <Leader>w <Plug>(easymotion-overwin-w)

    "MAPPINGS"
        "NERD TREE
            map <C-n> :NERDTreeToggle<CR>

        "Vim-Unimpaired
            nmap < [
            nmap > ]
            omap < [
            omap > ]
            xmap < [
            xmap > ]

    "CODING"
        "Vim-Multi-Cursors
            let g:multi_cursor_start_word_key='mc'

        "Tagbar
            nmap <Leader>t :TagbarToggle<CR>

    "ADDITIONAL
        "LAST Vim-Repeat
            silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)


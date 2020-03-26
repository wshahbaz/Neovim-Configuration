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
    Plug 'lilydjwg/colorizer'                           "Shows colours of colours
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
	set cursorline                          "highlight focused line
    set ruler                               "show line number and column"

	"CODING
    set showmatch							"show matching brackets

    "WINDOW
    set cmdheight=2                 " use a status bar that is 1 rows high
    set showcmd                     " show cmd in last line of screen"


    "Airline
        let g:airline_theme='powerlineish'       "airline theme
        let g:airline_powerline_fonts=1         "font type"
        let g:airline#extensions#tabline#enabled = 1

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


    "MAPPINGS"


    "CODING"

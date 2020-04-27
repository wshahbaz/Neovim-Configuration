"PRE-ESSENTIALS"
    set nocompatible                                        "use vim settings rather than vi settings"
    set history=200                                         "set cmdline history to 200 lines
    filetype plugin indent on                                      "enable plugins per filetype

"PLUG INS"
call plug#begin('$XDG_CONFIG_HOME/nvim/plugged')
	  Plug 'kyoz/purify', { 'rtp': 'vim' }        		    "Purity colour schemes
    Plug 'pangloss/vim-javascript'
    Plug 'elzr/vim-json'
    Plug 'jiangmiao/auto-pairs'                             "auto close brackets
    Plug 'vim-airline/vim-airline'                          "Airline bar at the bottom
    Plug 'vim-airline/vim-airline-themes'                   "Arline colour themes
    Plug 'lilydjwg/colorizer'                               "Shows actual colours of colours
    Plug 'tpope/vim-eunuch'                                 "L" "Vim sugar for unix commands
    Plug 'tpope/vim-fugitive'                               "L" "Git support
    Plug 'airblade/vim-gitgutter'                           "Show and handle git changes
    Plug 'frazrepo/vim-rainbow'                             "highlight brackets
    Plug 'dhruvasagar/vim-table-mode'                      "for creating tables easily - only use when needed
    "Plug 'chrisbra/csv.vim'                                "Plugin for CSVs
    Plug 'preservim/nerdtree'                               "L" "File explorer
    Plug 'ctrlpvim/ctrlp.vim'                               "L" "status bar fuzzy finder
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }     "L" "fuzzy finder
    Plug 'junegunn/fzf.vim'                                 "L" "fuzzy finder config
    Plug 'tpope/vim-projectionist'                          "L" "granular project configuration
    Plug 'tomtom/tcomment_vim'                              "L" "Vim Commenter
    Plug 'terryma/vim-multiple-cursors'                     "L" "Vim multicursor functionality
    Plug 'tpope/vim-surround'                               "L" "Vim outer bracket/quoting support
    Plug 'easymotion/vim-easymotion'                        "L" "Easy traversal of searches
    Plug 'tpope/vim-unimpaired'                             "L" "Lots of useful key bindings with bracket leaders
    Plug 'tpope/vim-repeat'                                 "Allows repeating vim-srrounds, vim-unimpaired
    Plug 'majutsushi/tagbar'                                "L" "ctags browser
    "Plug 'powerline/powerline'                             "L" "Very powerful customizeable setup bar
    "Plug 'jmcantrell/vim-virtualenv'                       "L" "Setup virtual envs for PYthon -> integrateable"
    Plug 'jlanzarotta/bufexplorer'                          "L" "Buffer explorer
    Plug 'dense-analysis/ale'                               "L" "Linting and syntax checking
    Plug 'ycm-core/YouCompleteMe'                           "L" "Autocompleter
    "Plug 'davidhalter/jedi-vim'                             "L" "Python autocompletion engine

call plug#end()

"EDITING LOOKS"
	"SPACING
	set ai                                  "auto-indent
	set ts=2                                "tab stop
	set shiftwidth=2                        "levels of indentation
	set cindent                             "c autoindenting
	set softtabstop=2 						"see multiple spaces as tabstops
	set expandtab							"converts tabs to white space

	"TEXT
  	colorscheme purify                      "colorscheme
    syntax enable                           "enable syntax highlighting
    syntax on                               "turn on for Purify plug-in
    set display+=lastline                   "try to show paragraph's last line"

	"OTHER FORMATTING
	set number relativenumber               "numbering
	set incsearch                           "incremental search
	set hlsearch                            "highlight search
	set ic                                  "ignore case while searching
    set smartcase                           "automatically switch to case-sensitive on uppercase added"
    set ruler                               "show line number and column"

	"CODING
    set showmatch							"show matching brackets

    "WINDOW
    set cmdheight=1                         "use a status bar that is 1 rows high
    set showcmd                             "show cmd in last line of screen"
    set updatetime=400                      "Update every 400ms
    "Make help windows open vsplits
    augroup vimrc_help
        autocmd!
        autocmd BufEnter *.txt if &buftype == 'help' | wincmd L | endif
    augroup END

    "Plugins"
        "Airline
            let g:airline_theme='powerlineish'                  "airline theme
            let g:airline_powerline_fonts=1                     "font type"
            let g:airline#extensions#tabline#enabled = 1        "automatically display all buffers when one tab open

        "Vim-GitGutter
            let g:gitgutter_max_signs=200                       "maximum number of change signs before disabling
            highlight GitGutterAdd ctermfg=2                    "sets the colour of added lines to gree"
            highlight GitGutterDelete ctermfg=1                 "sets sets the colour of deleted lines to red
            highlight GitGutterChange ctermfg=3                 "sets the colour of changed lines to yellow
            highlight GitGutterChangeDelete ctermfg=4           "sets the colour of changed+deleted lines to purple

        "Vim-Rainbow
            let g:rainbow_active=1                              "enables rainbow bracket matching globally

        "NERD Tree
            "open nerd tree when opening folder and make it tab-specific
            autocmd StdinReadPre * let s:std_in=1
            autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

        "vim-json
          "override previous settings
          hi! def link jsonKeyword Identifier
          au BufRead,BufNewFile,BufReadPost *.json set syntax=json

"FUNCTIONALITY"
    "WORKFLOW
    set splitright                              "split panes from right
    set hidden                                  "keep changes in buffers after switching
    set laststatus=2                            "always show status bar"
    set noerrorbells                            "no beep on errors"
    set visualbell                              "flash screen instead of beeping on errors"

    "TRAVERSAL
    set whichwrap+=<,>,h,l,[,]                  "wrap traversal
    set mouse-=a                                "disable mouse
    set scrolloff=1                             "number of lines to keep cursor from edge while scrolling vertically"
    set sidescrolloff=5                         "number of lines to keep cursor from edge while scrolling horizontally"

    "FORMATTING"
    autocmd BufWritePre * :%s/\s\+$//e          "eliminate trailing whitespace
    set listchars=tab:!·,trail:·                "show tabs spacing cleanly when `set list` enabled"
    set linebreak                               "vaoid wrapping line in middle of word"

    "CODING
    set path+=**                                "recursively search in sybfolders"
    set wildmode=longest,list,full              "set wildmode, with tab completion and traversal"
    set foldmethod=indent                       "fold code by indent"
    set nofoldenable                            "disable folding by default"
    "Disable auto-commenting after comment line
    autocmd Filetype * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
    set clipboard=unnamedplus                   "copy and paste text from vim into other windows"

        "YouCompleteMe
        let g:ycm_python_interpreter_path = ''                  "ycm's python interpreter path gvar
        let g:ycm_python_sys_path = []                          "ycm's python sys path gvar
        "extra config data for ycm
        let g:ycm_extra_conf_vim_data = [
         \  'g:ycm_python_interpreter_path',
         \  'g:ycm_python_sys_path',
         \]
        "ycm's global conf abs filepath (for me)
        let g:ycm_global_ycm_extra_conf = '$XDG_CONFIG_HOME/nvim/special_config/.ycm_extra_conf.py'
        "ycm's python interpreter (can't handle pyenv configs)
        let g:python3_host_prog = '/Users/wshahbaz/.pyenv/versions/py3nvim/bin/python'

        "ALE
        "set which files use which fixers
        let g:ale_fixers = {
        \   'javascript': ['prettier', 'eslint'],
        \}
        let g:ale_fix_on_save = 1                               "Enable ale-fix on save
        let g:ale_completion_enabled = 1                        "Enable autocompleters where applicable"
        set completeopt+=noinsert                               "Be less aggressive with the autocomplete"

"KEY BINDINGS
    "FLOW"
        "Vim-Gitgutter
            nmap ]h <Plug>(GitGutterNextHunk)                       "go to next hunk of changes
            nmap [h <Plug>(GitGutterPrevHunk)                       "go to prev hunk of changes
            nmap ghs <Plug>(GitGutterStageHunk)                     "stage current hunk
            nmap ghu <Plug>(GitGutterUndoHunk)                      "undo staging current hunk
            nmap ghp <Plug>(GitGutterPreviewHunk)                   "preview hunks changes

        "Vim-Easy Motion"
            map  <Leader>f <Plug>(easymotion-bd-f)                  "<Leader>f{char} to move to {char}
            nmap <Leader>f <Plug>(easymotion-overwin-f)             "<Leader>f{char} to move to {char}
            nmap <Leader>s <Plug>(easymotion-overwin-f2)            "<Leader>s{char}{char} to move to {char}{char}
            map <Leader>L <Plug>(easymotion-bd-jk)                  "Move to line
            nmap <Leader>L <Plug>(easymotion-overwin-line)          "Move to lines
            map  <Leader>w <Plug>(easymotion-bd-w)                  "Move to word
            nmap <Leader>w <Plug>(easymotion-overwin-w)             "Move to word

    "MAPPINGS"
        "NERD TREE
            map <C-n> :NERDTreeToggle<CR>                           "Toggle NERD Tree

        "Vim-Unimpaired
            nmap < [                                                "leaders for unimpaired
            nmap > ]                                                "leaders for unimpaired
            omap < [                                                "leaders for unimpaired
            omap > ]                                                "leaders for unimpaired
            xmap < [                                                "leaders for unimpaired
            xmap > ]                                                "leaders for unimpaired

    "CODING"
        "Vim-Multi-Cursors
            let g:multi_cursor_start_word_key='mc'                  "Enable multi Cursors with mc

        "Tagbar
            nmap <Leader>t :TagbarToggle<CR>                        "Toggle Tagbar

    "ADDITIONAL
        "LAST Vim-Repeat
            silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)   "Allow vim-repeat to function for predefined behavior


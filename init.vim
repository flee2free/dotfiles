call plug#begin("~/.config/nvim/plugged")
Plug 'preservim/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'Xuyuanp/nerdtree-git-plugin' " todo: test this
Plug 'preservim/nerdcommenter'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'sheerun/vim-polyglot'
Plug 'Chiel92/vim-autoformat'

" Themes
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'mhinz/vim-startify'

" Briefly highlight which text was yanked.
Plug 'machakann/vim-highlightedyank'

" Automatically set 'shiftwidth' + 'expandtab' (indention) based on file type.
Plug 'tpope/vim-sleuth'

" Tags
Plug 'alvan/vim-closetag' " todo: goto the repo to configure
Plug 'tpope/vim-surround'

" https://github.com/Raimondi/delimitMate/blob/master/doc/delimitMate.txt
Plug 'Raimondi/delimitMate'

" Motions -- even the basic config looks so freaking awesome
" https://github.com/easymotion/vim-easymotion
Plug 'easymotion/vim-easymotion'
Plug 't9md/vim-choosewin'
Plug 'psliwka/vim-smoothie'
Plug 'jdhao/better-escape.vim'

" Writing
Plug 'vimwiki/vimwiki'
Plug 'Alok/notational-fzf-vim'
Plug 'ferrine/md-img-paste.vim'

Plug 'junegunn/goyo.vim'
Plug 'mattn/calendar-vim'
Plug 'junegunn/limelight.vim'

Plug 'Yggdroot/indentLine'

" todo: coc-vim, coc-pair
" https://freshman.tech/vim-javascript/
" https://github.com/BrodieRobertson/dotfiles/blob/master/config/nvim/plugconfig/coc.vim
Plug 'tbabej/taskwiki'
Plug 'plasticboy/vim-markdown'

call plug#end()

if exists('+termguicolors')
  let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

syntax on

" https://arisweedler.medium.com/tab-settings-in-vim-1ea0863c5990
" https://github.com/AriSweedler/dotfiles/blob/master/.vim/vimrc
set tabstop=4       " Size of a hard tabstop (ts)
set softtabstop=4   " Sets the number of columns for a Tab
set shiftwidth=4    " Size of an indentation (sw)
set expandtab       " Expand Tab to Spaces
set autoindent      " Copy indent from current line when starting a new line (ai)
set copyindent
set smartindent
set number
    :set number relativenumber
    :set textwidth=80

" https://til.hashrocket.com/posts/f5531b6da0-backspace-options
set backspace=indent,eol,start " allow backspacing over these items
set hlsearch  " highlight search (highlight matches)
set incsearch " incremental search (highlight as we type the search query)

set ignorecase
set smartcase
set showcmd

set nowritebackup
set noswapfile
set nobackup
set breakindent
set hidden
set updatetime=250
set mouse=a
set noshowmode

" Easy Save (ctrl s messes up SSH)
" https://stackoverflow.com/questions/3446320
nmap <c-s> :w<CR>
imap <c-s> <Esc>:w<CR>a

" Clear highlighting for search terms
noremap <silent> <C-_> :nohlsearch<CR>
inoremap <silent> <C-_> <C-o>:nohlsearch<CR>

" Better Escape
let g:better_escape_shortcut = ['hh']
let g:better_escape_interval = 120

" Show help pane in Vertical
cabbrev help vert help
cabbrev h vert h

" Auto Format, this is also used by TaskWiki
let g:python3_host_prog="/usr/local/bin/python3"

" Delimit Pair
let delimitMate_matchpairs = "(:),[:],{:},<:>"

" Keep cursor at the bottom of the visual selection after you yank it
vmap y ygv<Esc>

" Make tab go to the matching pair item (love this feature)
nnoremap <Tab> %

" Disables automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Toggle Number Line
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END

" Map yanked to clipboard
set clipboard=unnamedplus

" Always show line number in Vim Help
autocmd FileType help  setlocal number

" ChooseWin
nmap - <Plug>(choosewin)

" Automatically deletes all trailing whitespace on save.
autocmd BufWritePre * %s/\s\+$//e

" ============================
" Make inner change text motions extendeded (*nixcasts)
" ============================

let items = [ "<bar>", "\\", "/", ":", ".", "*", "_" ]
for item in items
   exe "nnoremap yi".item." T".item."yt".item
   exe "nnoremap ya".item." F".item."yf".item
   exe "nnoremap ci".item." T".item."ct".item
   exe "nnoremap ca".item." F".item."cf".item
   exe "nnoremap di".item." T".item."dt".item
   exe "nnoremap da".item." F".item."df".item
   exe "nnoremap vi".item." T".item."vt".item
   exe "nnoremap va".item." F".item."vf".item
endfor

" ============================
" Code Folding
" ============================

set foldmethod=indent
set foldlevel=99
nnoremap <Space><Space> za

" ============================
" Indent Guides
" ============================

let g:indentLine_color_gui = '#777777'
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_setConceal = 1
let g:indentLine_conceallevel = 1
let g:indentLine_concealcursor = ""

" ============================
" FZF - Fuzzy Search
" ============================

map <C-f> <Esc><Esc>:Files!<CR>
inoremap <C-f> <Esc><Esc>:BLines!<CR>
map <C-g> <Esc><Esc>:BCommits!<CR>

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}

" Map a few common things to do with FZF.
let mapleader = ","
nnoremap <silent> <Leader><Enter> :Buffers<CR>
nnoremap <silent> <Leader>l :Lines<CR>

" let $BAT_THEME = 'gruvbox-light'
let $BAT_THEME = 'gruvbox-dark'
let $FZF_DEFAULT_COMMAND = 'find . -not -path "*/\.git*" -type f -print'

" ============================
" Goyo | Limelight
" ============================

let mapleader = ","

map <leader>f :Goyo \| set linebreak<CR>
let g:goyo_width=80
map ZQG :Goyo\|q!<CR>
map ZZG :Goyo\|x!<CR>

autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

map <leader>ll :Limelight!!<CR>

" ~~~~~ Default: 0.5
let g:limelight_default_coefficient = 0.7
" ~~~~~ Number of preceding/following paragraphs to include (default: 0)
let g:limelight_paragraph_span = 1
" ~~~~~ Beginning/end of paragraph
" ~~~~~ When there's no empty line between the paragraphs
" ~~~~~ and each paragraph starts with indentation
let g:limelight_bop = '^\s'
let g:limelight_eop = '\ze\n^\s'
" ~~~~~ Highlighting priority (default: 10)
" ~~~~~ Set it to -1 not to overrule hlsearch
let g:limelight_priority = -1

" ============================
" Gruvbox Theme
" ============================

let g:gruvbox_contrast_light='soft'
let g:gruvbox_contrast_dark='soft'
colorscheme gruvbox
" set background=light
set background=dark

function! ChangeBackground()
    if system("defaults read -g AppleInterfaceStyle") =~ '^Dark'
        set background=dark
    else
        set background=light
    endif
    try
        execute "AirlineRefresh"
    catch
    endtry
endfunction

call ChangeBackground()

" autocmd SigUSR1 * call ChangeBackground()

" ============================
" Spell Checking
" ============================

let mapleader = ","
map <leader>o :setlocal spell! spelllang=en_us<CR>

" Shortcuts using <leader>
map <leader>on ]s
map <leader>op [s
map <leader>oa zg
map <leader>o? z=

" Automatically correct spell with first suggestion
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

" Spelling mistakes will be colored up red.
hi SpellBad cterm=underline ctermfg=203 guifg=#ff5f5f
hi SpellLocal cterm=underline ctermfg=203 guifg=#ff5f5f
hi SpellRare cterm=underline ctermfg=203 guifg=#ff5f5f
hi SpellCap cterm=underline ctermfg=203 guifg=#ff5f5f

" ============================
" Split Pane
" ============================

let mapleader=","

nnoremap <leader>v <C-w>v
nnoremap <leader>s <C-w>s

" Cycle Splits
nnoremap <S-Tab> <C-w>w

" https://stackoverflow.com/questions/1269603/
" to-switch-from-vertical-split-to-horizontal-split-fast-in-vim
" C-w H

" Open new splits in a semantic way (tip from *nixcasts)
nnoremap ˙ :lefta vsp new<CR>
nnoremap ∆ :bel sp new<CR>
nnoremap ˚ :abo sp new<CR>
nnoremap ¬ :rightb vsp new<CR>

" Closing splits in a sane way
nnoremap <C-q> :q<CR>
nnoremap <S-Q> :only<CR>

" ============================
" Airline
" ============================

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

" ============================
" EasyMotion
" ============================

" ~~~~~ Map easy motion to search
nmap f <Plug>(easymotion-overwin-f2)
nmap / <Plug>(easymotion-overwin-line)
nmap <leader>/ <Plug>(easymotion-overwin-w)

" ~~~~~ Make sure <leader><leader> isnt remapped
let g:EasyMotion_do_mapping = 0

" Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1

" ============================
" VimWiki
" ============================

let g:vimwiki_list = [
            \{ 'path': '~/Box/wiki/', 'syntax': 'markdown', 'ext': '.md' }]

" todo:
" 1. Explore on creating multiple wiki over various areas of your life
" 2. https://github.com/Alok/notational-fzf-vim (notational velocity concept)
" 3. Good Read about Structuring your note taking system
" -- https://chmanie.com/post/2020/08/28/switching-from-bear-to-vim-based-notes/
" let wiki_1 = {}
" let wiki_1.path = '~/Box/work'
" let wiki_1.syntax = 'markdown'
" let wiki_1.ext = '.md'
"
" let wiki_2 = {}
"
" let g:vimwiki_list = [wiki_1, wiki_2]
" let g:vimwiki_ext2syntax = { '.md': 'markdown', '.markdown': 'markdown' }

" Makes vimwiki markdown links as [text](text.md) instead of [text](text)
let g:vimwiki_markdown_link_ext = 1
let g:vimwiki_global_ext = 0

" Notational Velocity
let g:nv_search_paths = ['~/Box/wiki']
nnoremap <leader>e :NV<CR>

" Saving Image
autocmd FileType markdown nmap <buffer><silent> <leader>p :call mdip#MarkdownClipboardImage()<CR>
" there are some defaults for image directory and image name, you can change them
" let g:mdip_imgdir = 'img'
" let g:mdip_imgname = 'image'

" ============================
" Nerd Commenter
" ============================

" " Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" " Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" " Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" " Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1
" " Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" " Map ++ to call NERD Commenter and use iTerm key bindings
" " to bind Ctmd+/ to ++ (mapped this in keyboard maestro)
vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle

" ============================
" Nerd Tree
" ============================

let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1 " hide helper
let g:NERDTreeIgnore = ['^node_modules$'] " ignore node_modules to increase load speed
let g:NERDTreeStatusline = '' " set to empty to use lightline

let mapleader = ','
noremap <leader>b :NERDTreeToggle<CR>
" " Close window if NERDTree is the last one
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" " Map to open current file in NERDTree and set size
nnoremap <leader>pv :NERDTreeFind<bar> :vertical resize 45<CR>

" NERDTree Syntax Highlight
" " Enables folder icon highlighting using exact match
let g:NERDTreeHighlightFolders = 1
" " Highlights the folder name
let g:NERDTreeHighlightFoldersFullName = 1
" " Color customization
let s:brown = "905532"
let s:aqua =  "3AFFDB"
let s:blue = "689FB6"
let s:darkBlue = "44788E"
let s:purple = "834F79"
let s:lightPurple = "834F79"
let s:red = "AE403F"
let s:beige = "F5C06F"
let s:yellow = "F09F17"
let s:orange = "D4843E"
let s:darkOrange = "F16529"
let s:pink = "CB6F6F"
let s:salmon = "EE6E73"
let s:green = "8FAA54"
let s:lightGreen = "31B53E"
let s:white = "FFFFFF"
let s:rspec_red = 'FE404F'
let s:git_orange = 'F54D27'
" " This line is needed to avoid error
let g:NERDTreeExtensionHighlightColor = {}
" " Sets the color of css files to blue
let g:NERDTreeExtensionHighlightColor['css'] = s:blue
" " This line is needed to avoid error
let g:NERDTreeExactMatchHighlightColor = {}
" " Sets the color for .gitignore files
let g:NERDTreeExactMatchHighlightColor['.gitignore'] = s:git_orange
" " This line is needed to avoid error
let g:NERDTreePatternMatchHighlightColor = {}
" " Sets the color for files ending with _spec.rb
let g:NERDTreePatternMatchHighlightColor['.*_spec\.rb$'] = s:rspec_red
" " Sets the color for folders that did not match any rule
let g:WebDevIconsDefaultFolderSymbolColor = s:beige
" " Sets the color for files that did not match any rule
let g:WebDevIconsDefaultFileSymbolColor = s:blue

let g:NERDTreeGitStatusUseNerdFonts = 1


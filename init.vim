call plug#begin("~/.config/nvim/plugged")
Plug 'preservim/nerdcommenter'
Plug 'lambdalisue/fern.vim'
Plug 'lambdalisue/fern-git-status.vim'
Plug '907th/vim-auto-save'
Plug 'lifepillar/vim-cheat40' " ~/.vim/cheat40.txt
Plug 'tpope/vim-unimpaired' " todo: need to test this out

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

" Resources ***
" https://bluz71.github.io/2017/05/21/vim-plugins-i-like.html

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

" Disable default cheatsheet
let g:cheat40_use_default = 0

" ============================
" Auto Save : Undo Change
" ============================

let g:auto_save        = 1
let g:auto_save_silent = 1
let g:auto_save_events = ["InsertLeave", "TextChanged", "FocusLost"]

" Undo changes even if vim was previously closed
set undodir=$HOME/.local/share/vim/undo
set undofile
set undolevels=1000 undoreload=10000

" ============================
" File Explorer
" ============================
" Open netrw
" map <leader>n :Vexplore<CR>
" let g:netrw_liststyle = 3

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

let $FZF_DEFAULT_COMMAND = 'find . -not -path "*/\.git*" -type f -print'

" ============================
" Goyo | Limelight
" ============================

let mapleader = ","

map <leader>gy :Goyo \| set linebreak<CR>
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
set background=dark
" set background=dark

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

" Map easy motion to search
nmap f <Plug>(easymotion-overwin-f2)
nmap / <Plug>(easymotion-overwin-line)
nmap <leader>/ <Plug>(easymotion-overwin-w)

" Make sure <leader><leader> isnt remapped
let g:EasyMotion_do_mapping = 0

" Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1

" ============================
" VimWiki
" ============================

let g:vimwiki_list = [
            \{ 'path': '~/Box/wiki/', 'syntax': 'markdown', 'ext': '.md' }]

" https://github.com/vimwiki/vimwiki/issues/255
" https://stackoverflow.com/questions/16059716
autocmd FileType vimwiki nunmap <buffer> <CR>
autocmd FileType vimwiki nmap <buffer>nl <Plug>VimwikiFollowLink

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
" Fern
" ============================

let g:fern#disable_default_mappings   = 1
let g:fern#disable_drawer_auto_quit   = 1
let g:fern#disable_viewer_hide_cursor = 1

noremap <silent> <Leader>d :Fern . -drawer -width=35 -toggle<CR><C-w>=

function! FernInit() abort
  nmap <buffer><expr>
        \ <Plug>(fern-my-open-expand-collapse)
        \ fern#smart#leaf(
        \   "\<Plug>(fern-action-open:select)",
        \   "\<Plug>(fern-action-expand)",
        \   "\<Plug>(fern-action-collapse)",
        \ )
  nmap <buffer> <CR> <Plug>(fern-my-open-expand-collapse)
  nmap <buffer> <2-LeftMouse> <Plug>(fern-my-open-expand-collapse)
  nmap <buffer> m <Plug>(fern-action-mark:toggle)j
  nmap <buffer> N <Plug>(fern-action-new-file)
  nmap <buffer> K <Plug>(fern-action-new-dir)
  nmap <buffer> D <Plug>(fern-action-remove)
  nmap <buffer> V <Plug>(fern-action-move)
  nmap <buffer> R <Plug>(fern-action-rename)
  nmap <buffer> s <Plug>(fern-action-open:split)
  nmap <buffer> v <Plug>(fern-action-open:vsplit)
  nmap <buffer> r <Plug>(fern-action-reload)
  nmap <buffer> <nowait> d <Plug>(fern-action-hidden:toggle)
  nmap <buffer> <nowait> < <Plug>(fern-action-leave)
  nmap <buffer> <nowait> > <Plug>(fern-action-enter)
endfunction

augroup FernEvents
  autocmd!
  autocmd FileType fern call FernInit()
augroup END

let g:fern#mark_symbol                       = '●'
let g:fern#renderer#default#collapsed_symbol = '▷ '
let g:fern#renderer#default#expanded_symbol  = '▼ '
let g:fern#renderer#default#leading          = ' '
let g:fern#renderer#default#leaf_symbol      = ' '
let g:fern#renderer#default#root_symbol      = '~ '

augroup FernTypeGroup
    autocmd! * <buffer>
    autocmd BufEnter <buffer> silent execute "normal \<Plug>(fern-action-reload)"
augroup END

let g:fern_git_status#disable_ignored    = 1
let g:fern_git_status#disable_untracked  = 1
let g:fern_git_status#disable_submodules = 1

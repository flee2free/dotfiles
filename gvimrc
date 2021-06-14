set guifont=MonoLisa:h15

" hide the mouse while typing
set mousehide
" set cursorline

set laststatus=0
set noruler

" keep the error column always visible
" tired this as a padding to the left, however this is not
" required, due to the inbuilt window padding setting
set signcolumn=no

" :Ack [options] {pattern} [{directories}]
" nmap <S-F> :Ack<space>

set termguicolors
set linespace=-2

" removing scroll bars
set guioptions=

" disabling the bell
autocmd! GUIEnter * set vb t_vb=
set background=dark

" Tabs Keyboard Mapping: {{{

" Press Ctrl-Tab to switch between open tabs (like browser tabs) to
" the right side. Ctrl-Shift-Tab goes the other way.
noremap <C-Tab> :tabnext<CR>
noremap <C-S-Tab> :tabprev<CR>

" Switch to specific tab numbers with Command-number
" https://superuser.com/questions/382060/
noremap <D-1> :tabn 1<CR>
noremap <D-2> :tabn 2<CR>
noremap <D-3> :tabn 3<CR>
noremap <D-4> :tabn 4<CR>
noremap <D-5> :tabn 5<CR>
noremap <D-6> :tabn 6<CR>
noremap <D-7> :tabn 7<CR>
noremap <D-8> :tabn 8<CR>
noremap <D-9> :tabn 9<CR>
" Command-0 goes to the last tab
noremap <D-0> :tablast<CR>

" }}}

" References: {{{

" Adding Padding to the MacVim
" https://gist.github.com/meleyal/1902879
" defaults write org.vim.MacVim MMTextInsetTop '15'
" defaults write org.vim.MacVim MMTextInsetLeft '15'
" defaults write org.vim.MacVim MMTextInsetBottom '15'
" defaults write org.vim.MacVim MMTextInsetRight '15'

" }}}



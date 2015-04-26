""""""""""""""""""""""""""""""""""""""""""
" .vimrc, vim configuration file
"    (C) 2015 [wacky6](wacky6@qq.com)
" use this file as you wish
""""""""""""""""""""""""""""""""""""""""""
" Prerequisites:
"   1. Fonts:
"      Win32:  Consolas
"      Other:  [DejaVu Sans](htts://dejavu-fonts.org/wiki/Download)
"   2. Color scheme
"      [Solarized](https://github.com/altercation/vim-colors-solarized)
"   3. tty behaviour (specifically, over SSH)
"      for Ctrl+S to work, turn off tty's XON/XOFF
"      Add following code to ~/.profile
"         ` stty ixany
"         ` stty ixoff -ixon
"         ` stty stop undef
"         ` stty start undef
"
" Credits: 
"   Credits goes to original authors of packages
"""""""""""""""""""""""""""""""""""""""""

" * indent behaviour
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent

set modeline
syntax on

" * line-number
set number

" * encoding: default utf-8, fallback encodings
if has('multi_byte')
  set encoding=utf-8
  setglobal fileencoding=utf-8
  language messages zh_CN.utf-8
  " fallback encodings
  set fileencodings=utf-8,gbk,ucs-bom.gb18030,gb3212,cp936,latin1
  " fix win32's broken menu character encoding
  if has('gui_win32')
	source $VIMRUNTIME/delmenu.vim
	set langmenu=zh_CN.utf-8
	source $VIMRUNTIME/menu.vim
  endif
endif

" * GVIM specific
if has('gui_running') 
  set lines=30 columns=120 linespace=1
  set background=light
  colorscheme solarized
  if has('gui_win32')
	set guifont=Consolas:h14
  else	
    "set guifont=DejaVu_Sans_Mono:h14
  endif	
endif  

" * Notepad-like StatusLine
" Credit goes to [http://stackoverflow.com/questions/5375240/a-more-useful-statusline-in-vim]
" TODO: customize!
function! HighlightSearch()
  if &hls
    return 'H'
  else
    return ''
  endif
endfunction
set laststatus=2
set statusline=
set statusline+=%7*\[%n]                                  "buffernr
set statusline+=%1*\ %<%F\                                "File+path
set statusline+=%2*\ %y\                                  "FileType
set statusline+=%3*\ %{''.(&fenc!=''?&fenc:&enc).''}      "Encoding
set statusline+=%3*\ %{(&bomb?\",BOM\":\"\")}\            "Encoding2
set statusline+=%4*\ %{&ff}\                              "FileFormat (dos/unix..) 
set statusline+=%5*\ %{&spelllang}\%{HighlightSearch()}\  "Spellanguage & Highlight on?
set statusline+=%8*\ %=\ row:%l/%L\ (%03p%%)\             "Rownumber/total (%)
set statusline+=%9*\ col:%03c\                            "Colnr
set statusline+=%0*\ \ %m%r%w\ %P\ \                      "Modified? Readonly? Top/bot.
hi User1 guifg=#ffdad8  guibg=#880c0e
hi User2 guifg=#000000  guibg=#F4905C
hi User3 guifg=#292b00  guibg=#f4f597
hi User4 guifg=#112605  guibg=#aefe7B
hi User5 guifg=#051d00  guibg=#7dcc7d
hi User7 guifg=#ffffff  guibg=#880c0e gui=bold
hi User8 guifg=#ffffff  guibg=#5b7fbb
hi User9 guifg=#ffffff  guibg=#810085
hi User0 guifg=#ffffff  guibg=#094afe

" * Backspace behaviour
set nocompatible
set backspace=indent,eol,start

" * 80th column line
set colorcolumn=81
highlight ColorColumn ctermbg=lightgrey

" * shortcut for Save/Exit
nnoremap <C-S>	 :w!<CR>
nnoremap <C-Q> 	 :q<CR>
nnoremap <C-S-Q> :q!<CR>
inoremap <C-S>   <Esc><C-S>i
inoremap <C-Q>   <Esc><C-Q>
inoremap <C-S-Q> <Esc><C-S-Q>

" * vim split navigate
nnoremap <silent> <C-Up>     :wincmd k<CR>
nnoremap <silent> <C-Down>   :wincmd j<CR>
nnoremap <silent> <C-Left>   :wincmd h<CR>
nnoremap <silent> <C-Right>  :wincmd l<CR>
inoremap <silent> <C-Up>     <Esc>:wincmd k<CR>i
inoremap <silent> <C-Down>   <Esc>:wincmd j<CR>i
inoremap <silent> <C-Left>   <Esc>:wincmd h<CR>i
inoremap <silent> <C-Right>  <Esc>:wincmd l<CR>i

" * shortcur for shell command
nnoremap <C-X>  :!<Space>
inoremap <C-X>  <Esc>:!<Space>

" * shortcut for make
nnoremap <F9>   :make<CR>
inoremap <F9>   <Esc>:make<CR>

" * insert Vim Modeline 
function! AppendModeline()
  let l:modeline = printf("  vim: set ts=%d sw=%d tw=%d %set  :",
      \  &tabstop, &shiftwidth, &textwidth, &expandtab ? '' : 'no')
  let l:modeline = substitute(&commentstring, "%s", l:modeline, "")
  call append(line(".")-1, l:modeline)
endfunction
nnoremap <silent> <Leader>ml :call AppendModeline()<CR>

" * nodejs dev shortcut
augroup node_dev
    autocmd!
	autocmd FileType javascript set expandtab
    autocmd FileType javascript nmap <F9> <ESC>:w<CR>:! node %<CR>
    autocmd FileType javascript imap <F9> <ESC>:w<CR>:! node %<CR>
augroup END

" * shortcut for vimrc editing
nnoremap <Leader>rc :vsplit $MYVIMRC<CR>
nnoremap <Leader>src :source $MYVIMRC<CR>

" * shortcut for file explorer
nnoremap <C-O> :Explore<CR>
inoremap <C-O> <ESC>:Explore<CR>

" * shortcut for vsplit
nnoremap <bar> :vsplit<CR>

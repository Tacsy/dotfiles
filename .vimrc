""necessary for lots of cool vim things""
set nocompatible
set backspace=indent,eol,start

autocmd BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif

""vim plugin manager Vundle environment set up
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()                                                                                                                                                   
Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'vim-scripts/phd'
"Plugin 'Lokaltog/vim-powerline'
Plugin 'vim-airline/vim-airline' " fork of powerline
Plugin 'fholgado/minibufexpl.vim'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'Valloric/YouCompleteMe'
Plugin 'Yggdroot/indentLine'
call vundle#end()
filetype plugin indent on

""real-time source and completion
autocmd BufWritePost $MYVIMRC source $MYVIMRC

""syntax"" 
syntax on
syntax enable

""color scheme""
let g:solorized_termcolors=256
set background=dark
"colorscheme solarized
colorscheme molokai
"colorscheme phd
let g:Powerline_colorscheme='solarized256'
let g:Powerline_symbols='fancy'

""indent""
""attempt to determine the type of a file based on its name and possibly its contents. allowing intelligent auto-indneting for each filetype, and for plugins that are filetype specific.
"filetype indent on
""using spaces instead of tab
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
let g:indent_guides_auto_colors = 0


" vim-airline{{{
" The following gives a simple buffer or tab line
"let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:airline_symbols.maxlinenr = '☰'
" Font from https://github.com/ryanoasis/nerd-fonts
"}}}

 
" indentLine{{{
let g:indentLine_char = '|'
let g:indentLine_enabled = 1
" }}}

" minibuffexploer{{{
map <Leader>bl :MEBToggle<cr>
" buffer shift shortcut
map <C-Tab> :MBEbn<cr>
map <C-S-Tab> :MBEbp<cr>
" }}}


"" Plugin YCM settings.
"let g:ycm_complete_in_strings = 1
"let g:ycm_collect_identifiers_from_comments_and_strings = 0
let g:ycm_python_binary_path = 'python'
let g:ycm_path_to_python_interpreter = '/home/xr7/apps/anaconda2/bin/python'

"let g:syntastic_check_on_open=1
"let g:syntastic_enable_signs=1
"let g:syntastic_cpp_check_header = 1
"let g:syntastic_cpp_remove_include_errors = 1
" YCM{{{
" global conf
"let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'
" complete is enabled in comments
let g:ycm_complete_in_comments=1
" allow vim load .ycm_extra_conf.py
let g:ycm_confirm_extra_conf=0
" turn on YCM tag complete engine
"let g:ycm_collect_identifiers_from_tags_files=1
" include tags
"set tags+=/data/misc/software/misc./vim/stdcpp.tags
" YCM OmniCppComplete engine. Set shortcut to ;;
inoremap <leader>; <C-x><C-o>
" show list only
set completeopt-=preview
" start completing from the first character inputed
let g:ycm_min_num_of_chars_for_completion=2
" disable cache
let g:ycm_cache_omnifunc=0
" syntax complete
let g:ycm_seed_identifiers_with_syntax=1
" complete c function: ALT + ;
" default is Ctrl + Space, which is switching input method
"let g:ycm_key_invoke_completion = '<M-;>'
" go to definition: ALT + G
"nmap <M-g> :YcmCompleter GoToDefinitionElseDeclaration <C-R>=expand("<cword>")<CR><CR>
"}}}





""display""
""nowrap codes
"set nowrap
""always show status bar
set laststatus=2
""always show current cursor position
set ruler
""always show line number
set number
""always show current cursor row/column number
set cursorline
set cursorcolumn
""set line width 
set textwidth=200                                                                                                             
""hightlight search results 
set hlsearch
""set turecolor
"set termguicolors

"" auto add head file
"" .py file into add header
function HeaderPython()
    call setline(1, "#!/usr/bin/env python")
    call append(1, "#-*- coding: utf-8 -*-")
    normal G
    normal o
endf
autocmd bufnewfile *.py call HeaderPython()

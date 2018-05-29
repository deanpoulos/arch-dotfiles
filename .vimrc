"============================================================================="
"       vim configuration - by dean poulos (dean.poulos7@protonmail.com)      "
"============================================================================="
" services include:                                                           "  
" - syntax highlighting using PaperColor                                      "
" - tabstopping at 4 spaces                                                   "
" - automatic text wrapping at 80 spaces                                      "
" - editor search highlighting                                                "
" - word processor mode function with spellchecking                           "
" - vundle plugin/runtime path handler                                        "
" - relative line number                                                      "
"============================================================================="
" prerequisites:                                                              "
" - PaperColor theme: https://github.com/NLKNguyen/papercolor-theme           "
" - Vundle:           https://github.com/VundleVim                            "
" - HardMode:         https://github.com/wikitopian/hardmode                  "
"============================================================================="

" plugins
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
    Plugin 'VundleVim/Vundle.vim'
    Plugin 'hardmode'
call vundle#end()

filetype plugin indent on

" standard colour options
syntax enable
set background=dark
colorscheme PaperColor

" document formatting
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set textwidth=80
set relativenumber

" word processor hack
func! WordProcessorMode()
 setlocal textwidth=80
 setlocal smartindent
 setlocal spell spelllang=en_us
 setlocal noexpandtab
endfu
com! WP call WordProcessorMode()

" hardmode
autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()
nnoremap <leader>h <Esc>:call ToggleHardMode()<CR>

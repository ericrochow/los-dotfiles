" Pathogen load
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Navigation
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'majutsushi/tagbar'
Plugin 'ludovicchabant/vim-gutentags'

" Git
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

" Colors!
Plugin 'jnurmine/Zenburn' " Zenburn color scheme
Plugin 'altercation/vim-colors-solarized' " Solarized color scheme
Plugin 'stephenmckinney/vim-solarized-powerline'
Plugin 'flazz/vim-colorschemes'
Plugin 'lilydjwg/colorizer'
Plugin 'sheerun/vim-polyglot'

" Search
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'

" Make Powerline work
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

" Code folding
Plugin 'tmhedberg/SimpylFold'
Plugin 'Konfekt/FastFold' " For SimpylFold

" Code completion
Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets' " for ultisnips

" Python syntax
Plugin 'nvie/vim-flake8'
Plugin 'Vimjas/vim-python-pep8-indent'
Plugin 'ambv/black'
" Plugin 'w0rp/ale'

" Ansible syntax
Plugin 'pearofducks/ansible-vim'

" Multi-language syntax
Plugin 'editorconfig/editorconfig-vim'
Plugin 'vim-syntastic/syntastic'

" Other language syntax
Plugin 'stephpy/vim-yaml'
Plugin 'maksimr/vim-jsbeautify' " JSON and other JS
Plugin 'Rykka/riv.vim' " rst
Plugin 'lepture/vim-jinja' " jinja

" Sublime feature emulation
Plugin 'tpope/vim-surround'
Plugin 'terryma/vim-multiple-cursors'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

filetype plugin indent on
" Start color configuration
syntax enable
let g:solorized_termcolors=256
set background=dark
colorscheme solarized
" End color configuration

function! WrapForTmux(s)
  if !exists('$TMUX')
    return a:s
  endif

  let tmux_start = "\<Esc>Ptmux;"
  let tmux_end = "\<Esc>\\"

  return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
endfunction

let &t_SI .= WrapForTmux("\<Esc>[?2004h")
let &t_EI .= WrapForTmux("\<Esc>[?2004l")

let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

" Start UltiSnips Configuration
let g:UltiSnipsExpandTrigger="<C-\\>"
let g:UltiSnipsJumpForwardTrigger="<C-b>"
let g:UltiSnipsJumpBackwardTrigger="<C-z>"
let g:UltiSnipsSnippetDirectories=["UltiSnips"]
" End UltiSnips Configuration

" Start Flake8 Configuration
let g:flake8_show_quickfix=1
let g:flake8_show_in_gutter=1
let g:flake8_show_in_file=1
autocmd BufWritePost *.py call Flake8()
autocmd FileType python map <buffer> <F7> :call Flake8()<CR>
" End Flake8 Configuration

" Start Syntastic Configuration
" let g:syntastic_mode_map = passive
autocmd FileType python let g:syntastic_python_checkers = []
" End Syntastic Configuration

" Start SimpylFold Configuration
let g:SimpylFold_docstring_preview = 1
let g:SimpylFold_fold_docstring = 1
let g:SimpylFold_fold_import = 1
" End SimpylFold Configuration

" Start YouCompleteMe Configuration
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
" End YouCompleteMe Configuration

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

" Start Black Configuration
let g:black_fast=0
let g:black_linelength=79
let g:black_skip_string_normalization=0
" End Black Configuration

" Start GitGutter Configuration
nmap <C-g> :GitGutterToggle<CR>
" End GitGutter Configuration

" Start ALE Configuration
let g:ale_completion_enabled=1
" End ALE Configuration

" Start Tagbar Configuration
nmap <F8> :TagbarToggle<CR>
" End Tagbar Configuration

" Start powerline Configuration
let g:Powerline_theme='short'
let g:Powerline_colorscheme='solarized256_dark'
" End powerline Configuration

" Start ansible-vim Configuration
let g:ansible_unindent_after_newline = 1
let g:ansible_yamlKeyName = 'yamlKey'
let g:ansible_attribute_highlight = "ob"
let g:ansible_name_highlight = 'd'
let g:ansible_extra_keywords_highlight = 1
" let g:ansible_template_syntaxes = { '*.yml.j2': 'yaml', '*.conf.j2', '' }
let g:ansible_template_syntaxes = { '*.yml.j2': 'yaml' }
" End ansible-vim Configuration

" Start fuzzyfinder Configuration
" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~40%' }

" In Neovim, you can set up fzf window using a Vim command
let g:fzf_layout = { 'window': 'enew' }
let g:fzf_layout = { 'window': '-tabnew' }
let g:fzf_layout = { 'window': '10split enew' }

" Customize fzf colors to match your color scheme
let g:fzf_colors = {
    \ 'fg':      ['fg', 'Normal'],
    \ 'bg':      ['bg', 'Normal'],
    \ 'hl':      ['fg', 'Comment'],
    \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
    \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
    \ 'hl+':     ['fg', 'Statement'],
    \ 'info':    ['fg', 'PreProc'],
    \ 'border':  ['fg', 'Ignore'],
    \ 'prompt':  ['fg', 'Conditional'],
    \ 'pointer': ['fg', 'Exception'],
    \ 'marker':  ['fg', 'Keyword'],
    \ 'spinner': ['fg', 'Label'],
    \ 'header':  ['fg', 'Comment']
\ }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R'

" [Commands] --expect expression for directly executing the command
let g:fzf_commands_expect = 'alt-enter,ctrl-x'

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" Advanced customization using autoload functions
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})
" Replace the default dictionary completion with fzf-based fuzzy completion
inoremap <expr> <c-x><c-k> fzf#vim#complete('cat /usr/share/dict/words')
" End fuzzyfinder Configuration

set rtp+=/usr/share/powerline/bindings/vim/
set laststatus=2
set t_Co=256
set encoding=utf-8

au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ | set softtabstop=4
    \ | set shiftwidth=4
    \ | set textwidth=79
    \ | set expandtab
    \ | set autoindent
    \ | set fileformat=unix
    \ | set colorcolumn=80
    \ | set number

au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2
    \ | set softtabstop=2
    \ | set shiftwidth=2
    \ | set autoindent
    \ | set fileformat=unix
    \ | set number

au BufNewFile,BufNewFile */playbooks/*.yml, */ansible*/*.yml
   \ set filetype=yaml.ansible

autocmd StdinReadPre *
    \ let s:std_in=1
autocmd VimEnter *
    \ if argc() == 0 && !exists("s:std_in")
        \ | NERDTree
    \ | elseif argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in")
        \ | exe 'NERDTree' argv()[0]
    \ | endif

autocmd bufenter *
    \ if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree())
        \ | q
    \ | elseif (winnr("$") == 1 && exists("b:loaded_flake8_ftplugin") && b:loaded_flake8_ftplugin == "primary")
        \ | q
    \ | endif

autocmd BufWritePre *.py
    \ execute ':Black'

autocmd BufWritePre *.json
    \ execute ':call JsonBeuatify()'

autocmd FileType javascript
    \ noremap <buffer>  <C-f> :call JsBeautify()<cr>

autocmd FileType json
    \ noremap <buffer> <C-f> :call JsonBeautify()<cr>

autocmd FileType html
    \ noremap <buffer> <C-f> :call HtmlBeautify()<cr>

autocmd FileType css
    \ noremap <buffer> <C-f> :call CSSBeautify()<cr>

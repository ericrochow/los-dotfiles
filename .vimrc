" Pathogen load
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""" Package Management """"""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Navigation
" Plugin 'majutsushi/tagbar'
" Plugin 'ludovicchabant/vim-gutentags'
Plugin 'tpope/vim-vinegar'
Plugin 'zhou13/vim-easyescape'

" Git
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

" Colors!
Plugin 'flazz/vim-colorschemes'
Plugin 'lilydjwg/colorizer'
Plugin 'sheerun/vim-polyglot'
" Plugin 'arcticicestudio/nord-vim'
Plugin 'joshdick/onedark.vim'

" Search
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'

" Aesthetics
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'edkolev/promptline.vim'
Plugin 'edkolev/tmuxline.vim'
Plugin 'jmcantrell/vim-virtualenv'
" Plugin 'bling/vim-bufferline'

" Code folding
" Plugin 'tmhedberg/SimpylFold'
" Plugin 'Konfekt/FastFold' " For SimpylFold

" Code completion
" Plugin 'Valloric/YouCompleteMe'
" Plugin 'SirVer/ultisnips'
" Plugin 'honza/vim-snippets' " for ultisnips

" Python syntax
Plugin 'nvie/vim-flake8'
Plugin 'Vimjas/vim-python-pep8-indent'
Plugin 'psf/black'

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
Plugin 'kovetskiy/sxhkd-vim' " sxhkd stuff

" Sublime feature emulation
Plugin 'tpope/vim-surround'
Plugin 'terryma/vim-multiple-cursors'

Plugin 'mhinz/vim-startify'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Plug 'psf/black', { 'tag': '*' }

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""" Color Configuration """""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" Start color configuration
syntax enable
" let g:solorized_termcolors=256
" End color configuration

set t_Co=256


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""" Navigation """""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""" Use Built-in netrw interface """"""""""""""""""""

" Start netrw configuration
" let g:netrw_banner = 0 " disable help banner
" let g:netrw_liststyle = 3
" let g:netrw_browse_split = 4
" let g:netrw_altv = 1
" let g:netrw_winsize = 20 " percent of window width
" let g:netrw_list_hide = &wildignore

" augroup ProjectDrawer
  " autocmd!
  " autocmd VimEnter * :Vexplore
" augroup END
" autocmd VimEnter *
    " \ if argc() == 0 && !exists("s:std_in")
        " \ | Vexplore
    " \ | elseif argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in")
        " \ | exe "Vexplore"
    " \ endif

" augroup netrw_close
  " autocmd!
  " autocmd WinEnter * if winnr("$") == 1 && getbufvar(winbufnr(winnr()), "&filetype") == "netrw"|q|endif
" augroup END
" End netrw configuration


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""" Code Validation """""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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

" Start Black Configuration
let g:black_fast=0
let g:black_linelength=87
let g:black_skip_string_normalization=0
let g:black_virtualenv="~/.vim/black"

" End Black Configuration


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""" Visuals """"""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""" Git """"""""""""""""""""""""""""""""""

" Start GitGutter Configuration
nmap <C-g> :GitGutterToggle<CR>
set updatetime=250
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '>'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '^'
let g:gitgutter_sign_modified_removed = '<'
let g:gitgutter_override_sign_column_highlight = 1
" highlight SignColumn guibg=bg
" highlight SignColumn ctermbg=bg
nmap <Leader>gn <Plug>GitGutterNextHunk  " git next
nmap <Leader>gp <Plug>GitGutterPrevHunk  " git previous
nmap <Leader>ga <Plug>GitGutterStageHunk  " git add (chunk)
nmap <Leader>gu <Plug>GitGutterUndoHunk   " git undo (chunk)
" End GitGutter Configuration


"""""""""""""""""""""""""""" Tags """""""""""""""""""""""""""""""""""


" set wildignore=tags,.log,.swp,.git,.jpg,.png,.svg,.gif,.mp3,.mp4,.pyc,__pycache__,.pytest_cache,.ropeproject/

" Start Tagbar Configuration
" nmap <F8> :TagbarToggle<CR>
" End Tagbar Configuration

"""""""""""""""""""""""""" Status Bar """"""""""""""""""""""""""""""


" Start airline Configuration
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='deus'
" End airline Configuration

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""" Languange Syntax Customization """""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Start ansible-vim Configuration
let g:ansible_unindent_after_newline = 1
let g:ansible_yamlKeyName = 'yamlKey'
let g:ansible_attribute_highlight = "ob"
let g:ansible_name_highlight = 'd'
let g:ansible_extra_keywords_highlight = 1
" let g:ansible_template_syntaxes = { '*.yml.j2': 'yaml', '*.conf.j2', '' }
let g:ansible_template_syntaxes = { '*.yml.j2': 'yaml' }
" End ansible-vim Configuration

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""" External Visuals """"""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Begin promptline configuration
" https://github.com/edkolev/promptline.vim
let g:promptline_theme ='airline'
" other themes available in autoload/promptline/themes/*
let g:promptline_preset = 'clear'
" other presets available in autoload/promptline/presets/*
" End promptline configuration

" Begin tmuxline configuration
" https://github.com/edkolev/tmuxline.vim
let g:airline#extensions#tmuxline#enabled = 0
let g:tmuxline_preset = 'powerline'
let g:tmuxline_theme = 'iceberg'
" End tmuxline configuration

" Begin virtulenv configuration
" https://github.com/jmcantrell/vim-virtualenv
" End virtualenv configuration

" Begin bufferline configuratino
" https://github.com/bling/vim-bufferline
" End bufferline configuration


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""" IDE Emulation """""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""" REPL """"""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""" Slime """"""""""""""""""""""""""""""""

let g:slime_target = "tmux"
let g:slime_paste_file = "$HOME/.slime_paste"
let g:slime_python_ipython = 1
let g:slime_default_config = {"socket_name": "default", "target_pane": "{right-of}"}

""""""""""""""""""""""""" Fuzzy Finder """""""""""""""""""""""""""""

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

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

""""""""""""""""""""" Kite (Code Completion) """""""""""""""""""""""

autocmd VimEnter *
    \ execute ':KiteEnableAutoStart'
autocmd CompleteDone * if !pumvisible() | pclose | endif
let g:kite_auto_complete=1 " enable kite's completions automatically as the user types
let g:kite_snippets=1 " enable kite's snippets
let g:kite_tab_complete=1 " allow tab completion
let g:kite_log=0 " disable kite debugging. change to 1 to enable
set completeopt+=menuone " show the popup menu even when there is only one match
set completeopt+=noinsert " don't insert any text until the user chooses a match
set completeopt-=longest " don't insert the longest common text
set completeopt+=preview " display documentation in the preview window for each completion option
set belloff+=ctrlg " stop vim from beeping during completion
set statusline=%<%f\ %h%m%r%{kite#statusline()}%=%-14.(%l,%c%V%)\ %P " add a kite indicator to the statusline

""""""""""""""""""""" Visual Text Block Remaps """""""""""""""""""""

vnoremap J :m ‘>+1gv=gv
vnoremap K :m ‘<-2gv=gv

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""" Auto Commands """"""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""" Auto Paste Mode """"""""""""""""""""""""""

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

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

"""""""""""""""""""""""" Python Settings """""""""""""""""""""""""""

au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ | set softtabstop=4
    \ | set shiftwidth=4
    \ | set textwidth=87
    \ | set expandtab
    \ | set autoindent
    \ | set fileformat=unix
    \ | set colorcolumn=88
    \ | set number

autocmd BufWritePre *.py
    \ execute ':Black'

"""""""""""""""""""""" Web Design Settings """""""""""""""""""""""""

au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2
    \ | set softtabstop=2
    \ | set shiftwidth=2
    \ | set autoindent
    \ | set fileformat=unix
    \ | set number

autocmd FileType javascript
    \ noremap <buffer>  <C-f> :call JsBeautify()<cr>

autocmd FileType html
    \ noremap <buffer> <C-f> :call HtmlBeautify()<cr>

autocmd FileType css
    \ noremap <buffer> <C-f> :call CSSBeautify()<cr>


"""""""""""""""""""""""" Ansible Settings """"""""""""""""""""""""""

au BufNewFile,BufNewFile */playbooks/*.yml, */ansible*/*.yml
   \ set filetype=yaml.ansible

""""""""""""""""""""""""""""" JSON """""""""""""""""""""""""""""""""

autocmd BufWritePre *.json
    \ execute ':call JsBeautify()'

autocmd FileType json
    \ noremap <buffer> <C-f> :call JsonBeautify()<cr>

""""""""""""""""""""""""""""" Misc """""""""""""""""""""""""""""""""

autocmd StdinReadPre *
    \ let s:std_in=1


"""""""""""""""""""""""""" Unclassified  """""""""""""""""""""""""""

set laststatus=2
set encoding=utf-8


"__     ___                    __   ____
"\ \   / (_)_ __ ___     ___  / _| |  _ \ ___ _   _
" \ \ / /| | '_ ` _ \   / _ \| |_  | |_) / _ \ | | |
"  \ V / | | | | | | | | (_) |  _| |  _ <  __/ |_| |
"   \_/  |_|_| |_| |_|  \___/|_|   |_| \_\___|\__, |
"                                             |___/
" Author: @Yongtenglei -- Rey"
" ===
" === Auto load for first time uses
" ===
" Install vim-plug if not found
if empty(glob('~/.config/nvim/autoload/plug.vim'))
   silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

"" Run PlugInstall if there are missing plugins
autocmd VimEnter * PlugInstall --sync | source ~/.config/nvim/init.vim
endif


let mapleader=" "
syntax on
set number
set relativenumber
set cursorline
set wrap
set showcmd
" wild menu and allow it pop longest hint first
set wildmenu
set wildmode=longest:list,full
set nobackup

" no swap or
"silent !mkdir -p ~/.config/nvim/tmp/backup
"set directory=~/.config/nvim/tmp/backup
set noswapfile

" persistent undo
set undofile
silent !mkdir -p ~/.config/nvim/tmp/undo
set undodir=~/.config/nvim/tmp/undo
"forgot undo in temp file
if !has('nvim')
  set undodir=~/.vim/undo
endif
augroup vimrc
  autocmd!
  autocmd BufWritePre /tmp/* setlocal noundofile
augroup END


set spell spelllang=en_us

inoremap ' ''<ESC>i
inoremap " ""<ESC>i
inoremap ( ()<ESC>i
inoremap < <><ESC>i
inoremap [ []<ESC>i
inoremap { {}<ESC>i
inoremap {<CR> {<CR>}<ESC>O


set hlsearch
exec "nohlsearch"
set incsearch
set ignorecase
set smartcase
noremap = nzz
noremap - Nzz
noremap <LEADER><CR> :nohlsearch<CR>

"进行分屏
noremap si :set splitright<CR>:vsplit<CR>
noremap sl :set nosplitright<CR>:vsplit<CR>
noremap su:set nosplitbelow<CR>:split<CR>
noremap se :set splitbelow<CR>:split<CR>

"分屏cursor切换
noremap <LEADER>ww <C-w>w
noremap <LEADER>i <C-w>l
noremap <LEADER>u <C-w>k
noremap <LEADER>n <C-w>h
noremap <LEADER>e <C-w>j
noremap qf <C-w>o

" Press <SPACE> + q to close the window below the current window
noremap <LEADER>qq <C-w>j:q<CR>

"切换竖直sh or水平分屏sv
noremap sv <C-w>t<C-w>H
noremap sh <C-w>t<C-w>K

" Rotate screens
noremap srh <C-w>b<C-w>K
noremap srv <C-w>b<C-w>H

" adjust windows size
noremap <up> :res +5<CR>
noremap <down> :res -5<CR>
noremap <left> :vertical resize+5<CR>
noremap <right> :vertical resize-5<CR>

"tab management
noremap tu :tabe<CR>
noremap tn :-tabnext<CR>
noremap ti :+tabnext<CR>

" Move the tabs with tmh and tml
noremap tmn :-tabmove<CR>
noremap tmi :+tabmove<CR>

set mouse=a
set encoding=utf-8
set guifont=DejaVu_Sans_Mono_Font
set showmatch
let &t_ut=''
set expandtab
set autoindent
set cindent
set tabstop=2
set shiftwidth=2
set softtabstop=2
set list
set listchars=tab:▸\ ,trail:▫
set scrolloff=10
set tw=0
set indentexpr=
set backspace=indent,eol,start
set foldmethod=indent
set foldlevel=99
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<sc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
set laststatus=2
set autochdir
set autowrite
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
set clipboard=unnamed,unnamedplus
" improve scrolling performance when navigating through large results
set lazyredraw


set nocompatible
filetype on
filetype indent on
filetype plugin on
" auto indent based file type
filetype plugin indent on
set shell=/bin/bash


" ===
" === Terminal Behaviors
" ===

"term cursor
if has('nvim')
  highlight! link TermCursor Cursor
  highlight! TermCursorNC guibg=red guifg=white ctermbg=1 ctermfg=15
endif

"windows motion
if has('nvim')
  tnoremap <leader>n <c-\><c-n><c-w>h
  tnoremap <leader>e <c-\><c-n><c-w>j
  tnoremap <leader>u <c-\><c-n><c-w>k
  tnoremap <leader>i <c-\><c-n><c-w>l
endif

"to normal mode
if has('nvim')
  tnoremap <Esc> <C-\><C-n>
  tnoremap <C-v><Esc> <Esc>
endif

let g:neoterm_autoscroll = 1
autocmd TermOpen term://* startinsert
" go back to normal
"tnoremap <C-N> <C-\><C-N>
" go back to last screen
tnoremap <C-O> <C-\><C-N><C-O>

"edit command line in nvim
tnoremap <C-n> <C-x><C-e>

let g:terminal_color_0  = '#000000'
let g:terminal_color_1  = '#FF5555'
let g:terminal_color_2  = '#50FA7B'
let g:terminal_color_3  = '#F1FA8C'
let g:terminal_color_4  = '#BD93F9'
let g:terminal_color_5  = '#FF79C6'
let g:terminal_color_6  = '#8BE9FD'
let g:terminal_color_7  = '#BFBFBF'
let g:terminal_color_8  = '#4D4D4D'
let g:terminal_color_9  = '#FF6E67'
let g:terminal_color_10 = '#5AF78E'
let g:terminal_color_11 = '#F4F99D'
let g:terminal_color_12 = '#CAA9FA'
let g:terminal_color_13 = '#FF92D0'
let g:terminal_color_14 = '#9AEDFE'

if has('nvim') && executable('nvr')
  let $VISUAL="nvr -cc split --remote-wait +'set bufhidden=wipe'"
endif

" ===
" === quickfix and location fix
" ===

noremap co :copen<CR>
noremap cm :cnext<CR>
noremap ck :cprevious<CR>
nnoremap cc :cclose<CR>

noremap bo :lopen<CR>
noremap bm :lnext<CR>
noremap bk :lprevious<CR>
nnoremap bc :lclose<CR>

" ===
" === go config
" ===

autocmd FileType go nmap gr  <Plug>(go-run)

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

autocmd FileType go nmap gb :<C-u>call <SID>build_go_files()<CR>

autocmd FileType go nmap gc <Plug>(go-coverage-toggle)

let g:go_fmt_command = "goimports"
let g:go_fmt_fail_silently = 1

" Beautify go
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1

autocmd BufNewFile,BufRead,BufWritePost *.go retab

" check
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_autosave = 1
let g:go_metalinter_autosave_enabled = ['vet', 'golint']
let g:go_metalinter_deadline = "5s"

" alternate in command mode
autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')

let g:go_def_mode = 'godef'

" :GoDecls and :GoDeclsDir include
let g:go_decls_includes = "func,type"
"let g:go_decls_includes = "func"

" go info
autocmd FileType go nmap gh <Plug>(go-info)
let g:go_auto_type_info = 1
set updatetime=100

"let g:go_auto_sameids = 1

let g:go_play_browser_command = "firefox"

" ===
" === Basic Mappings
" ===
noremap ; :

" Save
noremap <c-u> :w<CR>

" Undo operations
noremap l u

" Insert Key
noremap k i
noremap K I

"no s
noremap s <nop>

" Open or source the vimrc file anytime
noremap <LEADER>rc :e ~/.config/nvim/init.vim<CR>
noremap <LEADER>src :source ~/.config/nvim/init.vim<CR>

" Copy to system clipboard
vnoremap Y "+y

" Indentation
nnoremap < <<
nnoremap > >>

" Adjacent duplicate words
noremap <LEADER>dw /\(\<\w\+\>\)\_s*\1

" Space to Tab
"nnoremap <LEADER>gt :%s/ /\t/g
"vnoremap <LEADER>gt :s/  /\t/g


" Folding
noremap <silent> <LEADER>o za

" ===
" === Cursor Movement
" ===
noremap <silent> u k
noremap <silent> n h
noremap <silent> e j
noremap <silent> i l

" U/E keys for 5 times u/e (faster navigation)
noremap <silent> U 5k
noremap <silent> E 5j

" yank to the end of line
noremap <silent> \v v$h

" go to the start of the line
noremap <silent> N 0
" go to the end of the line
noremap <silent> I $

" ===
" === Markdown Settings
" ===
" Snippets
source ~/.config/nvim/md-snippets.vim
" auto spell
autocmd BufRead,BufNewFile *.md setlocal spell

"vim-markdown
let g:vim_markdown_math = 1
let g:vim_markdown_new_list_item_indent = 2

"vim-markdown-doc
let g:vmt_cycle_list_item_markers = 1
"vim-markdown-preview
let g:instant_markdown_slow = 0
let g:instant_markdown_autostart = 1
let g:instant_markdown_allow_unsafe_content = 1
let g:instant_markdown_mathjax = 1
let g:instant_markdown_browser = "firefox --new-window"
let g:instant_markdown_port = 8090
let g:instant_markdown_autoscroll = 1
"vimwiki"
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]
nmap \ww <Plug>VimwikiIndex

" ===
" === Other useful stuff
" ===
" Open a new instance of st with the cwd
nnoremap \t :tabe<CR>:-tabmove<CR>:term sh -c 'st'<CR><C-\><C-N>:q<CR>

" Opening a terminal window
noremap <LEADER>/ :set splitbelow<CR>:split<CR>:res +10<CR>:term<CR>

" go to placeholder <++> and edit
noremap <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>4xi

" Spelling Check with <space>sc
noremap <LEADER>sc :set spell!<CR>

" Auto change directory to current dir
autocmd BufEnter * silent! lcd %:p:h

" Call figlet
noremap tx :r !figlet

" find and replace
noremap \s :%s//gc<left><left>

" set wrap
noremap <LEADER>sw :set wrap<CR>


call plug#begin('~/.config/nvim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ojroques/vim-scrollstatus'

" ctrl-p
Plug 'ctrlpvim/ctrlp.vim'

"html css javascript
Plug 'gko/vim-coloresque'
Plug 'mattn/emmet-vim'

"table mode
Plug 'dhruvasagar/vim-table-mode'

"suda.vim
Plug 'lambdalisue/suda.vim'

"Far find and replace
Plug 'brooth/far.vim'

"make session automatically
Plug 'tpope/vim-obsession'

"tarbar
Plug 'preservim/tagbar'

"vim-snippets
Plug 'honza/vim-snippets'
"Plug 'SirVer/ultisnips'

"visual-multi
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

"wildfire.vim
Plug 'gcmt/wildfire.vim'

" easy-align
Plug 'junegunn/vim-easy-align'

"vista.vim
Plug 'liuchengxu/vista.vim'

"ale
"Plug 'dense-analysis/ale'

"mundo.vim
Plug 'simnalamburt/vim-mundo'

"easy-mostion
"Plug 'easymotion/vim-easymotion'

"vim-starttify
Plug 'mhinz/vim-startify'

"vim-go
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaried'}
Plug 'AndrewRadev/splitjoin.vim'

"vim-surround
Plug 'tpope/vim-surround'
"Plug 'tpope/vim-repeat'
Plug 'tople/vim-speeddating'

"fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

"indentline
Plug 'Yggdroot/indentLine'

"rainbow parentheses
Plug 'luochen1990/rainbow'

"注释 <leader>cc 反注释 <leader>cu
Plug 'scrooloose/nerdcommenter'

"go-to 插件 <leader>d definition (K, <leader>n / r(rename))
"Plug 'davidhalter/jedi-vim'

"floaterm
Plug 'voldikss/vim-floaterm'

"theme
Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'
"Plug 'fatih/molokai'

"yay -S ranger python-pynvim ueberzug required
Plug 'kevinhwang91/rnvimr'

" xtabline
Plug 'mg979/vim-xtabline'

"git stuff
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'airblade/vim-gitgutter'

"markdown stuff
" preview requirxdg-utils curl nodejs
" npm -g install instant-markdown-d
Plug 'godlygeek/tabular' "必要插件，安装在vim-markdown前面
Plug 'plasticboy/vim-markdown'
Plug 'mzlogin/vim-markdown-toc'
Plug 'vimwiki/vimwiki'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown'}

Plug 'neoclide/coc.nvim', {'branch': 'release'}

"Grep
Plug 'mhinz/vim-grepper'

" Did you mean
Plug 'EinfachToll/DidYouMean'
call plug#end()

"Airline theme
"let g:airline_theme='gruvbox'
let g:airline_theme='onedark'

"scrollstatus
let g:airline_section_x = '%{ScrollStatus()}'
let g:scrollstatus_size = 12
let g:scrollstatus_symbol_track = '-'
let g:scrollstatus_symbol_bar = '*'

"gruvbox主题设置
set termguicolors
"colorscheme gruvbox
"set background=dark
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

"molokai主题设置
"let g:rehash256 = 1
"let g:molokai_original = 1
"colorscheme molokai

"onedark主题设置
colorscheme onedark

"tarbar
nnoremap <leader>tb :TagbarToggle<CR>


"indentLine
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

"eastmotion
nmap ss <Plug>(easymotion-s2)


"" press f10 to show hlgroup
"function! SynGroup()
  "let l:s = synID(line('.'), col('.'), 1)
  "echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
"endfun
"map <F10> :call SynGroup()<CR>


" Compile function
"map r :call CompileRunGcc()<CR>
"func! CompileRunGcc()
  "exec "w"
  "if &filetype == 'c'
  "exec "!g++ % -o %<"
  "exec "!time ./%<"
  "elseif &filetype == 'cpp'
  "exec "!g++ % -o %<"
  "exec "!time ./%<"
  "elseif &filetype == 'java'
  "exec "!javac %"
  "exec "!time java %<"
  "elseif &filetype == 'sh'
  ":!time bash %
  "elseif &filetype == 'python'
  "silent! exec "!clear"
  "exec "!time python3 %"
  "elseif &filetype == 'html'
  "exec "!firefox % &"
  "elseif &filetype == 'markdown'
  "exec "MarkdownPreview"
  "elseif &filetype == 'vimwiki'
  "exec "MarkdownPreview"
  "elseif &filetype == 'go'
  "exec ":GoRun %"
  "endif
"endfunc

" Compile function
noremap r :call CompileRunGcc()<CR>
func! CompileRunGcc()
  exec "w"
  if &filetype == 'c'
    exec "!g++ % -o %<"
    exec "!time ./%<"
  elseif &filetype == 'cpp'
    set splitbelow
    exec "!g++ -std=c++11 % -Wall -o %<"
    :sp
    :res -15
    :term ./%<
  elseif &filetype == 'java'
    set splitbelow
    :sp
    :res -5
    term javac % && time java %<
  elseif &filetype == 'sh'
    :!time bash %
  elseif &filetype == 'python'
    set splitbelow
    :sp
    :term python3 %
  elseif &filetype == 'html'
    silent! exec "!".g:mkdp_browser." % &"
  elseif &filetype == 'markdown'
    exec "InstantMarkdownPreview"
  elseif &filetype == 'tex'
    silent! exec "VimtexStop"
    silent! exec "VimtexCompile"
  elseif &filetype == 'dart'
    exec "CocCommand flutter.run -d ".g:flutter_default_device." ".g:flutter_run_args
    silent! exec "CocCommand flutter.dev.openDevLog"
  elseif &filetype == 'javascript'
    set splitbelow
    :sp
    :term export DEBUG="INFO,ERROR,WARNING"; node --trace-warnings .
  elseif &filetype == 'go'
    set splitbelow
    :sp
    :term go run .
  endif
endfunc

" html config
let g:mkdp_browser="firefox"
" emment config
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

"rainbow parentheses
let g:rainbow_active = 1

"ale config
"let g:ale_disable_lsp = 1
"floaterm config
let g:floaterm_keymap_toggle = '<LEADER>ft'
"python path
let g:python3_host_prog = "/usr/bin/python3"

"coc config
let g:coc_global_extensions = [
  \ 'coc-css',
  \ 'coc-cssmodules',
  \ 'coc-diagnostic',
  \ 'coc-eslint',
  \ 'coc-explorer',
  \ 'coc-flutter-tools',
  \ 'coc-gitignore',
  \ 'coc-git',
  \ 'coc-import-cost',
  \ 'coc-json',
  \ 'coc-lists',
  \ 'coc-go',
  \ 'coc-prettier',
  \ 'coc-prisma',
  \ 'coc-pyright',
  \ 'coc-clangd',
  \ 'coc-snippets',
  \ 'coc-sourcekit',
  \ 'coc-stylelint',
  \ 'coc-syntax',
  \ 'coc-tailwindcss',
  \ 'coc-tasks',
  \ 'coc-translator',
  \ 'coc-tslint-plugin',
  \ 'coc-tsserver',
  \ 'coc-vetur',
  \ 'coc-vimlsp',
  \ 'coc-yaml',
  \ 'coc-yank',
  \ 'coc-pairs',
  \ 'coc-html',
  \ 'coc-htmldjango',
  \ 'coc-htmlhint',
  \ 'coc-html-css-support',
  \ 'coc-highlight',
  \ 'coc-java',
  \ 'coc-markdownlint',
  \ 'coc-clangd']

set hidden

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=100

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use <c-l> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-l> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif


" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nnoremap <silent><nowait> <LEADER>d :CocList diagnostics<cr>
nmap <silent> <LEADER>- <Plug>(coc-diagnostic-prev)
nmap <silent> <LEADER>=<Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

"coc-snippet

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-e> <Plug>(coc-snippets-select)
imap <C-l> <Plug>(coc-snippets-expand)
imap <C-e> <Plug>(coc-snippets-expand-jump)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-e>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-n>'

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

"Make <tab> used for trigger completion, completion confirm, snippet expand and jump like VSCode.
inoremap <silent><expr> <TAB>
    \ pumvisible() ? coc#_select_confirm() :
    \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" coc-explorer
nnoremap tt :CocCommand explorer<CR>

" coc-translator
nmap ts <Plug>(coc-translator-p)


" rnvimr
" Make Ranger replace Netrw and be the file explorer
let g:rnvimr_enable_ex = 1

" Make Ranger to be hidden after picking a file
let g:rnvimr_enable_picker = 1

" Disable a border for floating window
let g:rnvimr_draw_border = 0

highlight link RnvimrNormal CursorLine
nnoremap <silent> R :RnvimrToggle<CR><C-\><C-n>:RnvimrResize 0<CR>
let g:rnvimr_action = {
            \ '<C-t>': 'NvimEdit tabedit',
            \ '<C-x>': 'NvimEdit split',
            \ '<C-v>': 'NvimEdit vsplit',
            \ 'gw': 'JumpNvimCwd',
            \ 'yw': 'EmitRangerCwd'
            \ }
let g:rnvimr_layout = { 'relative': 'editor',
            \ 'width': &columns,
            \ 'height': &lines,
            \ 'col': 0,
            \ 'row': 0,
            \ 'style': 'minimal' }
let g:rnvimr_presets = [{'width': 1.0, 'height': 1.0}]

"xtabline
let g:xtabline_settings = {}
let g:xtabline_settings.enable_mappings = 0
let g:xtabline_settings.tabline_modes = ['tabs', 'buffers']
let g:xtabline_settings.enable_persistance = 0
let g:xtabline_settings.last_open_first = 1
noremap \p :echo expand('%:p')<CR>

" ===
" === Vista.vim
" ===
noremap <LEADER>v :Vista!!<CR>
noremap <c-t> :silent! Vista finder coc<CR>
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista_default_executive = 'coc'
let g:vista_fzf_preview = ['right:50%']
let g:vista#renderer#enable_icon = 1
let g:vista#renderer#icons = {
\   "function": "\uf794",
\   "variable": "\uf71b",
\  }
" function! NearestMethodOrFunction() abort
"   return get(b:, 'vista_nearest_method_or_function', '')
" endfunction
" set statusline+=%{NearestMethodOrFunction()}
" autocmd VimEnter * call vista#RunForNearestMethodOrFunction()

let g:scrollstatus_size = 15

" ===
" === Far.vim
" ===
"nnoremap <silent> <LEADER>fr  :Far<left><left> **/*
"vnoremap <silent> <LEADER>fr  :Far<left><left> **/*
let g:far#enable_undo=1

" ===
" === suda.vim
" ===
let g:suda_smart_edit = 1

" ===
" === fzf and ag
" ===
noremap <leader>ff :FZF<CR>
noremap <leader>ag :Ag<CR>
noremap <leader>hs :History<CR>
noremap <leader>hc :History:<CR>
noremap <leader>bf :Buffers<CR>

" ===
" === lazygit
" ===
noremap \g :Git<cr>
noremap <c-g> :tabe<cr>:-tabmove<cr>:term lazygit<cr>

" ===
" === Grep
" ===
let g:grepper       = {}
let g:grepper.tools = ['grep', 'rg', 'git']

" Search for the current word
nnoremap <Leader>* :Grepper -cword -noprompt<CR>

" Search for the current selection
nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)

" grep alias, using <C-v><Space> to using grep
function! SetupCommandAlias(input, output)
  exec 'cabbrev <expr> '.a:input
        \ .' ((getcmdtype() is# ":" && getcmdline() is# "'.a:input.'")'
        \ .'? ("'.a:output.'") : ("'.a:input.'"))'
endfunction
call SetupCommandAlias("grep", "GrepperGrep")




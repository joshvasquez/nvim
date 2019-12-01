set nocompatible
filetype plugin on
set termguicolors
syntax on
set hidden
set wildmenu
set laststatus=2
set noshowcmd
set ruler
set incsearch
set noswapfile
set cursorline
set updatetime=300
set t_Co=256
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes


set relativenumber
set path+=**
set wildmenu
" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set ttyfast
" better search
set ignorecase
set smartcase
set incsearch
set hlsearch
set inccommand=split

set autoindent
set backspace=indent,eol,start	

" tabs
set smarttab
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

set spellsuggest=15
set linebreak
set scrolloff=3
set foldcolumn=2
set noshowmode
set spelllang=en_us

if $TERM_PROGRAM =~ "iTerm"
    let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
    let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif

let vimplug_exists=expand('~/.config/nvim/autoload/plug.vim')
if !filereadable(vimplug_exists)
    if !executable("curl")
        echoerr "You have to install curl or first install vim-plug yourself!"
        execute "q!"
    endif
    echo "Installing Vim-Plug..."
    echo ""
    silent exec "!\curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
    let g:not_finish_vimplug = "yes"
    autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/plugged')
" colors
Plug 'ayu-theme/ayu-vim' 
Plug 'wimstefan/vim-artesanal'
Plug 'nightsense/cosmic_latte'
Plug 'wellle/targets.vim'

" smooth scrolling
Plug 'psliwka/vim-smoothie'

Plug 'sheerun/vim-polyglot'
Plug 'plasticboy/vim-markdown' 

" junegunn
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/rainbow_parentheses.vim'

" tpope
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-fireplace'

Plug 'christoomey/vim-system-copy'

" modeline
Plug 'itchyny/lightline.vim'

Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}

" html/jsx
Plug 'mattn/emmet-vim'
Plug 'MaxMEllon/vim-jsx-pretty'

" javascript/typescript development
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'jelera/vim-javascript-syntax'
Plug 'neoclide/vim-jsx-improve'
" Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'jparise/vim-graphql'
Plug 'alampros/vim-styled-jsx'

" motion plugins
Plug 'easymotion/vim-easymotion'
Plug 'kana/vim-textobj-user' | Plug 'whatyouhide/vim-textobj-xmlattr'
"Plug 'bkad/CamelCaseMotion'

" create tables
" Plug 'godlygeek/tabular'

call plug#end()

let g:goyo_width=65

colorscheme cosmic_latte


if executable('rg')
  let $FZF_DEFAULT_COMMAND= 'rg --files'
endif

let g:user_emmet_leader_key='<C-j>'


" j and k move by visible line
map j gj
map k gk
"" leader keys

nnoremap <SPACE> <Nop>
let mapleader="\\"
map <Space> <Leader>
nnoremap <leader>s :Ag<Return>
nnoremap <leader><Space> :Rg<Return>
nnoremap <leader>w :w<Return>
nnoremap <leader>ev :e $MYVIMRC<cr>
noremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader><space><space> :
nnoremap <leader>l :bn<cr>
nnoremap <leader>g :Goyo<cr>
map <leader>p :GFiles?<cr>
map <leader>c :Commands<cr>
map <leader>b :Clap buffers<cr>
map <leader>d :NV<cr>
map <C-p> :Files<cr>
onoremap p i(
onoremap in( :<cu>normal! f(vi(<cr>


" CoC.nvim config
"
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
"inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
"
" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" Automatically source vimrc on save.
autocmd! bufwritepost $MYVIMRC source $MYVIMRC
command! -nargs=0 Prettier :CocCommand prettier.formatFile


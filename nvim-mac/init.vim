" common syntax
syntax on
filetype plugin indent on

" disable tedious bells
set noerrorbells

" Required by vim-devicons
set encoding=UTF-8

" line should not wrap to next line
set nowrap
set noswapfile

set nu
set undodir=~/.vim/undodir
set undofile
set incsearch

" show row number 
set number
set relativenumber

set scrolloff=8
set tabstop=4 softtabstop=4
set shiftwidth=4
set colorcolumn=100
set list
" Removed cuz boring -> eol:¶
set listchars=tab:→\ ,space:·,nbsp:␣,trail:•,precedes:«,extends:»
" On tab pressing insert spaces
set expandtab
set smartindent
set wildignore+=*/tmp/*,*/dist/*,*/node_modules/*,*.so,*.swp,*.zip,package-lock.json

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif



" Plugins section 
call plug#begin('~/.vim/plugged')

" Fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Display fuzzy finder as central window taking 90% x 90%
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9 } }

" Theme
Plug 'yunlingz/equinusocio-material.vim'
Plug 'itchyny/lightline.vim'

" Nerdtree explorer
Plug 'preservim/nerdtree' |
    \ Plug 'Xuyuanp/nerdtree-git-plugin'
"    \ Plug 'tiagofumo/vim-nerdtred-syntax-highlight'

" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif


" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" Hide boring [  ] symbols
let g:NERDTreeGitStatusConcealBrackets = 1

let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }

" Use nerd fonts
let g:NERDTreeGitStatusUseNerdFonts = 0

let g:NERDTreeWinPos = "left"
let g:NERDTreeIgnore = ['\.git', '\node_modules', '\dist']








Plug 'tomlion/vim-solidity'
" Plug 'ternjs/tern_for_vim', { 'do': 'npm install && npm install -g tern' }

" Autocomplete!
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"this will auto close ( [ {
Plug 'jiangmiao/auto-pairs' 

" Enable tricks like writing ul>li*3>span>a
Plug 'mattn/emmet-vim'

" highlight colors
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }

" these two plugins will add highlighting and indenting to JSX and TSX files
Plug 'yuezk/vim-js'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'maxmellon/vim-jsx-pretty'

" css3 syntax highlight
Plug 'hail2u/vim-css3-syntax'

" Syntax highlight for .ts and .tsx
Plug 'HerringtonDarkholme/yats.vim', { 'for': 'typescript' }
Plug 'ianks/vim-tsx', { 'for': 'typescript.tsx' }

" Nerd commenter ?

"Tailwindcss
Plug 'iamcco/coc-tailwindcss',  {'do': 'yarn install --frozen-lockfile && yarn run build'}

"Grahql
Plug 'jparise/vim-graphql'

" Plugin used to install lsp 
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'

" Always load as last plugin
Plug 'ryanoasis/vim-devicons'

call plug#end()




" Highlight colors on the left column
let g:Hexokinase_highlighters = ['sign_column']



let g:ctrlp_use_caching = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_custom_ignore = '\v[\/]\.(git)$'
let g:ctrlp_custom_ignore = 'node_modules\|dist\'


" CoC Settings 
let g:coc_global_extensions = [
  \ 'coc-tslint-plugin',
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-solidity',
  \ 'coc-eslint',
  \ 'coc-prettier',
  \ 'coc-json',
  \ 'coc-html',
  \ 'coc-css',
  \ 'coc-vetur',
  \ ]





" Theme

" true colors are required for vim in terminal
set termguicolors

" use a different style
" valid values: 'default' (default), 'darker', 'pure'
let g:equinusocio_material_style = 'darker'

" less bright
" which means some colors will be modified by this formula:
" (r, g, b) -> ( max(r - less, 0), max(g - less, 0), max(b - less, 0) )
let g:equinusocio_material_less = 25

" make vertsplit invisible (visible by default) (default 0)
" if style == 'pure', then the vertsplit is always visible
let g:equinusocio_material_hide_vertsplit = 0

" parentheses improved (default 0)
" enabling this option with 'luochen1990/rainbow' installed is not encouraged
" because this option and 'luochen1990/rainbow' will registry conflicting events
" in summary:
" 1. no 'luochen1990/rainbow' installed, no parentheses improved: nothing to do (default 0)
" 2. no 'luochen1990/rainbow' installed, want built-in parentheses improved: set to 1
" 3. 'luochen1990/rainbow' installed: nothing to do (default 0)
let g:equinusocio_material_bracket_improved = 1

" use a better vertsplit char
set fillchars+=vert:│

colorscheme equinusocio_material

" this theme has a buildin lightline/airline theme
let g:airline_theme = 'equinusocio_material'
let g:lightline = {
  \ 'colorscheme': 'equinusocio_material',
  \ }

" End theme

let mapleader = " "

" FUZZY GO!!!!
nnoremap <leader>f :FZF<CR>
" TODO Go to last buffer (this method dont work)
nnoremap <leader>b :History<Esc><Esc>

" Ctrl + N will open nerdtre/
" map <C-n> :NERDTreeToggle<CR>
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

nnoremap <leader>pv :Vex<CR>
nnoremap <leader><CR> :so ~/.config/nvim/init.vim<CR>
nnoremap <C-p> :GFiles<CR>
nnoremap <C-j> :cnext<CR>
nnoremap <C-k> :cprev<CR>
nnoremap <leader>pf :Files<CR>
nnoremap <leader>p o<esc>Pk<CR>
" paste without lose content
vnoremap <leader>p "_dP
" yank into system clipboard
vnoremap <leader>y "+y

" can move lines up and down 
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" go to definition
" nmap <leader>gd <Plug>(coc-definition)
" go to reference
" nmap <leader>gr <Plug>(coc-references)


" Use `:ORGANIZE` for organize import of current buffer
command! -nargs=0 ORGANIZE :call CocAction('runCommand', 'tsserver.organizeImports')

" Use `:Prettier` command for coc
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Pre Save
autocmd BufWritePre *.js :ORGANIZE
autocmd BufWritePre *.ts :ORGANIZE






" Settings from https://github.com/neoclide/coc.nvim



" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on ener, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f <Plug>(coc-format-selected)
nmap <leader>f <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>a <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>t




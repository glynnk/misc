" deps - install via package manager
"   - vim-nerdtree,
"   - vim-nerdtree-syntax-highlight,
"   - nerdtree-git-plugin,
"   - vim-go,
"   - vim-fugitive,
"   - vim-airline,
"   - vim-gruvbox,
"   - vim-ferret,
"   - vim-tagbar,
"   - vim-supertab,
"   - ttf-consolas-powerline 

filetype on
filetype plugin on
filetype indent on
syntax on

set expandtab       
set tabstop=4
set smartindent
set autoindent
set shiftwidth=4
set softtabstop=4
set autowrite
set paste   " supertab won't work with this on, but it doesn't seem to pop up the correct selections anyway
set background=dark
colorscheme gruvbox

autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4 
let g:go_fmt_command = "goimports" 
let g:go_auto_type_info = 1
let g:go_auto_sameids = 1
let g:go_list_type = "quickfix"

:nnoremap <C-g> :NERDTreeToggle<CR>
:nnoremap <C-h> :TagbarToggle<CR>
:nnoremap <leader>a :cclose<CR>
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>

" go syntax highlighting
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1

" run the metalinter on save
let g:go_metalinter_autosave = 1
let g:go_metalinter_deadline = "5s"

let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''


" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <leader>t <Plug>(go-test)
autocmd FileType go nmap <leader>r <Plug>(go-run)
autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
autocmd FileType go nmap <Leader>i <Plug>(go-info)
autocmd FileType go nmap <Leader>d <Plug>(go-doc)
autocmd FileType go nmap <leader>ii <Plug>(go-implements)
autocmd FileType go nmap <leader>rr <Plug>(go-referrers)
autocmd FileType go nmap <leader>cc <Plug>(go-callees)

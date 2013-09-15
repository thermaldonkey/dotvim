" For configuring runtimepath
execute pathogen#infect()

syntax on
" set cindent
set relativenumber
set ruler
colorscheme pablo
set hlsearch
set ts=2
set sw=2
set sts=2
set et

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

" Invisible character colors
highlight NonText ctermfg=gray
highlight SpecialKey ctermfg=gray

" For quick edit of files in same directory as current file
map <leader>ew :e <C-R>=expand("%:p:h") . "/" <CR>
map <leader>es :sp <C-R>=expand("%:p:h") . "/" <CR>
map <leader>ev :vsp <C-R>=expand("%:p:h") . "/" <CR>
map <leader>et :tabe <C-R>=expand("%:p:h") . "/" <CR>

" Map quicker write/ruby
map <leader>r :! ruby % <CR>

" Map write/run rspec tests
" map <leader>ts :! rspec % --require ./spec/spec_helper.rb --format documentation --color <CR>
" map <leader>t :! rspec % --format documentation --color <CR>

" vim-rspec mappings
nnoremap <leader>f :call RunCurrentSpecFile()<CR>
nnoremap <leader>s :call RunNearestSpec()<CR>
nnoremap <Leader>l :call RunLastSpec()<CR>
nnoremap <leader>a :call RunAllSpecs()<CR>
let g:rspec_command = "!rspec --format documentation {spec}"

" Map ESC char to something easier to type
imap ;; <Esc>
vmap ;; <Esc>

" For quick edit of this file
nmap <leader>v :vsp $MYVIMRC<CR>

if has("autocmd")
  " Enable filetype detection
  filetype on

  " Restore cursor position
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  " Source the vimrc file after saving it
  autocmd bufwritepost .vimrc source $MYVIMRC

  " Syntax of these languages is fussy over tabs Vs spaces
  autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
  autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

  " Customisations based on house-style (arbitrary)
  autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType javascript setlocal ts=4 sts=4 sw=4 noexpandtab

  " For smart Ruby completion
  autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
  autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
  autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
  autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
endif

"improve autocomplete menu color
highlight Pmenu ctermbg=238 gui=bold

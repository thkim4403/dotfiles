syntax on
filetype plugin indent on
set number

set tabstop=4
set shiftwidth=4
set expandtab

set backspace=indent,eol,start

execute pathogen#infect()

let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts=1

set background=dark

map <leader>nt :NERDTreeToggle<return>
map <leader>gt :YcmCompleter GoToDefinition<return>
map <leader>tb :TagbarToggle<return>

let g:gruvbox_italic=1

colorscheme gruvbox

set cc=80

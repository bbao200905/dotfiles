" shortcut to set number lines and relative number lines
noremap <silent> <F2> <Cmd>set number <bar> setlocal relativenumber!<CR>

" ruler
set ruler

" autotoggle number modes https://jeffkreeftmeijer.com/vim-number/#:~:text=Using%20the%20number%20option%2C%20Vim,set%20number!%20%3Aset%20nu!
autocmd InsertEnter * :set relativenumber 
autocmd InsertLeave * :set number | :set norelativenumber



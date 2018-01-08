nnoremap <buffer><silent> gh :A<CR>
nnoremap <buffer><silent> gH :AS<CR>
inoremap <buffer><silent> ,< <ESC>:call Avr_set_bit(0)<CR>
inoremap <buffer><silent> << <ESC>:call Avr_set_bit(1)<CR>
" Burn AVR firmware
nnoremap <buffer><silent> gjb :w<CR>:Make burn<CR>

function! Avr_set_bit(value)
    exe "norm! bi(" . a:value ." << \<esc>wgUiWEa) \<esc>"
    exe "startinsert!"
endfunction

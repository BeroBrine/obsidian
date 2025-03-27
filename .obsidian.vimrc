unmap <Space>
set clipboard=unnamed

" Navigates visual lines instead of logical ones
nmap j gj
nmap k gk

" Define a custom Obsidian command
exmap JumpToLink obcommand "Open link under cursor to the right"

" Map `gd` to execute the custom Obsidian command in normal mode
nnoremap gd :JumpToLink<CR>

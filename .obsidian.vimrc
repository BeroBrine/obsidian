unmap <Space>
set clipboard=unnamed

" Navigates visual lines instead of logical ones
nmap j gj
nmap k gk
nmap $ g$
nmap 0 g0

" Define a custom Obsidian command
exmap JumpToLink obcommand  editor:open-link-in-new-split

" Map `gd` to execute the custom Obsidian command in normal mode
nnoremap gd :JumpToLink<CR>

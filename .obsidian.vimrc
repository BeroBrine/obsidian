unmap <Space>
set clipboard=unnamed

" Navigates visual lines instead of logical ones
nmap j gj
nmap k gk
nmap $ g$
nmap 0 g0

" Define a custom Obsidian command
exmap JumpToLink obcommand  editor:open-link-in-new-split
exmap BackPane obcommand  pane-relief:go-prev
exmap FrontPane obcommand  pane-relief:go-next
exmap FileExplorer obcommand  quick-explorer:browse-current
exmap jumpto obcommand mrj-jump-to-link:activate-jump-to-anywhere
exmap closeTab obcommand workspace:close

nnoremap gd :JumpToLink<CR>
nnoremap th :BackPane<CR>
nnoremap tl :FrontPane<CR> 
nnoremap <Space>e :FileExplorer<CR>
nnoremap <Space>w :w<CR>

nmap s :jumpto<CR>

nmap <Space>x :closeTab<CR>

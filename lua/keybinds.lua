vim.cmd([[
" Navigation binds
map <A-h> <C-\><C-N><C-w>h
map <A-j> <C-\><C-N><C-w>j
map <A-k> <C-\><C-N><C-w>k
map <A-l> <C-\><C-N><C-w>l
map <A-h> <C-\><C-N><C-w>h
map <A-j> <C-\><C-N><C-w>j
map <A-k> <C-\><C-N><C-w>k
map <A-l> <C-\><C-N><C-w>l
tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l
tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l

" Tabs and commenting
vnoremap <A-Tab> :norm i  <CR>
vnoremap <A-/> :norm i//<CR>
vnoremap <A-\> :norm xx<CR>

map <A-Return> :FloatermToggle <CR>
tnoremap <A-q> <C-\><C-N>ZZ <CR>
map <S-t> :term <CR>
map ~ :noh <CR>

" Spawning and resizing panes
map <A-S-l> :vsp <CR>
map <A-S-j> :sp <CR>
map <A-C-j> :res +5 <CR>
map <A-C-k> :res -5 <CR>
map <A-C-l> :vertical resize +5 <CR>
map <A-C-h> :vertical resize -5 <CR>

" Spacing
map <A-2> :set tabstop=2 shiftwidth=2<CR>
map <A-4> :set tabstop=4 shiftwidth=4<CR>

" Tabs
map <Tab> :tabnext<CR>
map <A-t> :tabnext<CR>
map <A-C-t> :tabnew<CR>
map <A-Backspace> :bdelete<CR>

" CoC
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)
nmap <leader>s :CocFix<CR>

" Autoclose brackets
"inoremap " ""<left>
"inoremap ' ''<left>
"inoremap ( ()<left>
"inoremap [ []<left>
"inoremap { {}<left>
"inoremap {<CR> {<CR>}<ESC>O
"inoremap {;<CR> {<CR>};<ESC>O

" General keybinds
map <A-n> <Cmd>CocCommand explorer<CR>
map <leader>n <Cmd>NvimTreeToggle<CR><Cmd>vertical resize +10<CR>

map <A-f> :Telescope find_files<CR>
map <leader>f :Telescope find_files<CR>
map <leader>o :Telescope old_files<CR>
map <leader>w :Telescope live_grep<CR>
map <leader>b :Telescope marks<CR>


]])

-- Tab autocomplete
vim.api.nvim_set_keymap("i", "<C-Space>", "coc#refresh()", { silent = true, expr = true })
vim.api.nvim_set_keymap("i", "<TAB>", "pumvisible() ? '<C-n>' : '<TAB>'", {noremap = true, silent = true, expr = true})
vim.api.nvim_set_keymap("i", "<S-TAB>", "pumvisible() ? '<C-p>' : '<C-h>'", {noremap = true, expr = true})
vim.api.nvim_set_keymap("i", "<CR>", "pumvisible() ? coc#_select_confirm() : '<C-G>u<CR><C-R>=coc#on_enter()<CR>'", {silent = true, expr = true, noremap = true})

local keymap = vim.keymap

keymap.set('n', 'x', '"_x')

-- Increment/decrement
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

-- Delete a word backwards
--keymap.set('n', 'dw', 'vb"_d')

-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G')

-- Save with root permission (not working for now)
--vim.api.nvim_create_user_command('W', 'w !sudo tee > /dev/null %', {})

-- New tab
keymap.set('n', 'te', ':tabedit')

-- Split window
keymap.set('n', 's', '<C-w>s<C-w>j:terminal<CR>')
keymap.set('n', 'vs', '<C-w>v<C-w>l:terminal<CR>')

-- Move window
keymap.set('n', '<Space>', '<C-w>w')
keymap.set('n', '<up>', '<C-w><up>')
keymap.set('n', '<down>', '<C-w><down>')
keymap.set('n', '<left>', '<C-w><left>')
keymap.set('n', '<right>', '<C-w><right>')

-- Resize window
keymap.set('n', '<C-w><left>', '<C-w><')
keymap.set('n', '<C-w><right>', '<C-w>>')
keymap.set('n', '<C-w><up>', '<C-w>+')
keymap.set('n', '<C-w><down>', '<C-w>-')

-- Insert Mode
keymap.set('i', 'jj', '<Esc>')

-- Visual Mode
keymap.set('v', 'J', ':m \'>+4<CR>gv=gv')
keymap.set('v', 'K', ':m \'<1<CR>gv=gv')

-- Terminal
keymap.set('t', '<Esc>', '<C-\\><C-n>')

-- SO
keymap.set('n', '<space><CR>', ':so ~/.config/nvim/init.lua<CR>')

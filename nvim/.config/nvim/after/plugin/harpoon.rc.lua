local keymap = vim.keymap

keymap.set('n', '<Space>a', "<cmd>lua require'harpoon.mark'.add_file()<CR>")
keymap.set('n', ';m', "<cmd>lua require'harpoon.ui'.toggle_quick_menu()<CR>")
keymap.set('n', '<Leader>hn', "<cmd>lua require'harpoon.ui'.nav_next()<CR>")
keymap.set('n', '<Leader>hp', "<cmd>lua require'harpoon.ui'.nav_prev()<CR>")

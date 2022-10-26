local status, zenMode = pcall(require, "zen-mode")
if (not status) then return end

zenMode.setup {}

vim.keymap.set('n', '<Space>z', '<cmd>ZenMode<cr>', { noremap = true, silent = true })

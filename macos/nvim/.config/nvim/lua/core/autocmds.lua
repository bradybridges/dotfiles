-- Set shiftwidth to 4 and disable expandtab for css and scss files
vim.cmd([[
  autocmd FileType css,scss setlocal shiftwidth=4 noexpandtab
]])

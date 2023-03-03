local status, hop = pcall(require, "hop")

if not status then
	return
end

return hop.setup({
	keys = "etovxqpdygfblzhckisuran",
})

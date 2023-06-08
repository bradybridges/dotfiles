local status_ok, gpt = pcall(require, "chatgpt")

if not status_ok then
	return
end

gpt.setup({})

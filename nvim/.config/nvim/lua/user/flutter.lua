local flutter_ok, flutter = pcall(require, "flutter-tools")

if not flutter_ok then
	return
end

flutter.setup({})

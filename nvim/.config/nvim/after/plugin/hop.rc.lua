local status, hop = pcall(require, "hop")

if (not status) then end
return hop.setup()

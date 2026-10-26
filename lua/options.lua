require "nvchad.options"

-- add yours here!


-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!

-- MY CONFIGS
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldlevel = 99 -- Prevents Neovim from automatically closing all folds when you open a file

-- only to run nvim as external editor, not with the plugins to run in godot tab
--local gdproject = io.open(vim.fn.getcwd()..'/project.godot', 'r')
--if gdproject then
--    io.close(gdproject)
--    vim.fn.serverstart './godothost'
--end

-- ask to save on quit
vim.o.confirm = true


-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "catppuccin",
  hl_override = require('configs.highlights').override
	-- hl_override = {
	-- 	Comment = { italic = true },
	-- 	["@comment"] = { italic = true },
	-- },
}

M.nvdash = require("configs.ui").nvdash

-- M.ui = {
--       tabufline = {
--          lazyload = false
--      }
-- }

-- MY CONFIGS
M.mason = {
  pkgs = { "clangd", "clang-format", "codelldb", "pyright", "ltex-ls", "ruff", "mypy", "black", "debugpy", "sqls", "llm-ls"  }
}

return M

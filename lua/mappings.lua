require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
local nomap = vim.keymap.del

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- MY CONFIGS
-------------------------------------
-- Github Copilot Accept 
-------------------------------------
vim.keymap.set('i', '<C-J>', 'copilot#Accept("\\<CR>")', {
  expr = true,
  replace_keycodes = false
})
vim.g.copilot_no_tab_map = true

map('n', "<Leader>llm", "<cmd> LLMToggleAutoSuggest <cr>", { desc = "Launch the [LLM]" })

-------------------------------------
-- Code Companion
-------------------------------------
-- [C]odeCompanion [P]rompt]
vim.keymap.set({ "n", "v" }, "<Leader>cp", function()
  return require("codecompanion").cli({ prompt = true })
end, { desc = "[C]odeCompanion [P]rompt] CLI" })

-- [C]odeCompanion [A]dd
vim.keymap.set({ "n", "v" }, "<Leader>ca", function()
  return require("codecompanion").cli("#{this}", { focus = false })
end, { desc = "[C]odeCompanion [A]dd context to the CLI agent" })

-- [C]odeCompanion [D]iagnostics
vim.keymap.set("n", "<Leader>cd", function()
  return require("codecompanion").cli("#{diagnostics} Can you fix these?", { focus = false, submit = true })
end, { desc = "[C]odeCompanion send [D]iagnostics diagnostics to CLI agent" })

-- [C]odeCompanion [T]erminal
vim.keymap.set("n", "<Leader>ct", function()
  return require("codecompanion").cli("#{terminal} Sharing the output from the terminal. Can you fix it?", { focus = false, submit = true })
end, { desc = "[C]odeCompanion send [T]erminal output to CLI agent" })

map('n', "<Leader>cc", "<cmd> CodeCompanionActions <cr>")
-------------------------------------
-- Quit terminal withouth C-n C-\
-------------------------------------
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-------------------------------------
-- Tmux mappings
-------------------------------------
-- remove <C-U> for some reason
map('n', "<c-l>", "<cmd>TmuxNavigateLeft<cr>")
map('n', "<c-j>", "<cmd>TmuxNavigateDown<cr>")
map('n', "<c-k>", "<cmd>TmuxNavigateUp<cr>")
map('n', "<c-h>", "<cmd>TmuxNavigateRight<cr>")
map('n', "<c-\\>", "<cmd>TmuxNavigatePrevious<cr>")

-------------------------------------
-- Docstring
-------------------------------------
map("n", "<leader>df", function()
  require("neogen").generate()
end, { desc = "Generate Function Docstring" })
-------------------------------------
-- TODO 
-------------------------------------
map("n", "<leader>td", "<cmd> TodoTelescope <cr>", { desc = "See whats Todo" })

-------------------------------------
-- Remove lsp conflict with scroll down
-------------------------------------
nomap("n", "<C-w><C-d>")

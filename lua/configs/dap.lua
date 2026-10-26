local dap = require("dap") 

dap.adapters.godot = {
  type = "server",
  host = "127.0.0.1",
  port = 6006, -- Default Godot 4 DAP port
}

dap.configurations.gdscript = {
  {
    type = "godot",
    request = "launch",
    name = "Launch Scene",
    project = "${workspaceFolder}",
    launch_scene = true,
  },
}

local dapui = require("dapui")
local map = vim.keymap.set

map("n", "<leader>db", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
map("n", "<leader>dc", dap.continue, { desc =  "DEBUG: Continue" })
map("n", "<leader>di", dap.step_into, { desc = "DEBUG: Step Into" })
map("n", "<leader>do", dap.step_over, { desc = "DEBUG: Step Over" })
map("n", "<leader>du", dap.step_out, { desc =  "DEBUG: Step Out" })

map("n", "<leader>dx", function()
  dap.terminate()
  dapui.close()
end)




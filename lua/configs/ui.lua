local M = {}
M.nvdash = {
  load_on_startup = true,
  header = {
    "███╗  ██╗██╗   ██╗ ███████╗██╗  ██╗ █████╗ ██████═╗ ",
    "████╗ ██║██║   ██║██╔═════╝██║  ██║██╔══██╗██═══██╚╗",
    "██╔██ ██║██║   ██║██║      ███████║███████║██   ╚██║",
    "██║╚████║╚██╗ ██╔╝██║      ██╔══██║██╔══██║██   ██╔╝",
    "██║ ╚███║ ╚████╔╝ ╚███████╗██║  ██║██║  ██║██████╔╝ ",
    "╚═╝  ╚══╝  ╚═══╝   ╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═════╝  ",
    "                       [@ Noob]                     ",
  },
  buttons = {
    { txt = "  Find File",     keys = "ff",  cmd = "Telescope find_files" },
    { txt = "  New file",      keys = "n",   cmd = "ene <BAR> startinsert"},
    { txt = "  Recent Files",  keys = "fo",  cmd = "Telescope oldfiles" },
    { txt = "  Find Text",     keys = "fw",  cmd = "Telescope live_grep" },
    { txt = "  Config",        keys = "c",   cmd = "lua require('telescope.builtin').find_files({ cwd = vim.fn.stdpath('config') })"},
    { txt = "󰒲  Lazy",          keys = "l",   cmd = "Lazy" },
    -- -- requires the persistence plugin        dashboard.button("s", " " .. " Restore Session", [[<cmd> lua require("persistence").load() <cr>]]),
    { txt = "󱥚  Themes",        keys = "th",  cmd = ":lua require('nvchad.themes').open()" },
    { txt = "  Mappings",      keys = "ch",  cmd = "NvCheatsheet" },
    { txt = "  Quit",          keys = "q",   cmd = "qa"},
    { txt = "─", hl = "NvDashFooter", no_gap = true, rep = true },
    --         dashboard.button("q", ,            "<cmd> qa <cr>"),
    {
      txt = function()
        local stats = require("lazy").stats()
        local ms = math.floor(stats.startuptime) .. " ms"
        return "  Loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms
      end,
      hl = "NvDashFooter",
      no_gap = true,
      content = "fit",
    },

    { txt = "─", hl = "NvDashFooter", no_gap = true, rep = true },
  }
}
return M

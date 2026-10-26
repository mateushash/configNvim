--------------------------------------------------
-- MY CONFIGS
--------------------------------------------------
-- read :h vim.lsp.config for changing options of lsp servers 
-- set all server to use utf-16(was something wrong with my llm configs)
require("nvchad.configs.lspconfig").defaults({
  offset_encoding = "utf-16", -- force all servers to use utf-8
})

--------------------------------------------------
-- Defaults
--------------------------------------------------
-- do not attach to txt files
vim.lsp.config('*', {
  root_dir = function(bufnr, on_dir)
    if not vim.fn.bufname(bufnr):match('%.txt$') then
      on_dir(vim.fn.getcwd())
    end
  end
})

--------------------------------------------------
local filetypes = {
  'bib',
--  'gitcommit',
  'markdown',
--  'org',
--  'plaintex',
--  'rst',
--  'rnoweb',
  'tex',
--  'pandoc',
--  'quarto',
--  'rmd',
--  'context',
--  'html',
--  'xhtml',
--  'mail',
--  'text',
}
--------------------------------------------------

local servers = {
--------------------------------------------------
-- Clangd
--------------------------------------------------
  clangd = {
    capabilities = {
      general = {
        positionEncodings = { "utf-16" }
      },
      offset_encoding = "utf-16",

    },
  },
  css_lsp = {},
  html = {},
--------------------------------------------------
--LATEX ltex-ls
--------------------------------------------------
  ltex = {
    -- require('lspconfig').ltex.setup({
    cmd = { 'ltex-ls' },
    -- carefull with nested tables
    --  filetypes = filetypes,
    root_markers = {'.git'},
    settings = {
      ltex = {
        language = "pt-BR",
        enabled = filetypes,
      },
    },
  },
--------------------------------------------------
--PYRIGHT
--------------------------------------------------
  pyright = {
    filetypes = {"python"},
    settings = {
      python = {
        analysis = {
          diagnosticMode = "workspace",
          diagnosticSeverityOverrides = {
            reportOptionalMemberAccess = "warning",
          }
        }
      }
    }
  },
  lua_ls = {},
  stylua = {},
  ruff = {},
  sqls = {},
}

for name, opts in pairs(servers) do
  vim.lsp.config(name, opts)
  vim.lsp.enable(name)
end
--vim.lsp.enable(servers)

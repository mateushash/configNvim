-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = { "html", "cssls", "clangd", "pyright", "ltex", "ruff", "sqls" }
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }

-- MY CONFIGS
--LATEX ltex-ls
  lspconfig.ltex.setup{
  filetypes = { "bibtex", "gitcommit", "markdown", "org", "tex", "restructuredtext", "rsweave", "latex", "quarto", "rmd", "context",  "mail", "plaintext" };
  settings = {
    ltex = {
      language = "pt-BR",
enabled = { "bibtex", "gitcommit", "markdown", "org", "tex", "restructuredtext", "rsweave", "latex", "quarto", "rmd", "context",  "mail", "plaintext" },
    }
  }
}
--PYRIGHT
  lspconfig.pyright.setup({
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
})
--CLANGD 
--[[
lspconfig.clangd.setup({
  filetypes = {"c", "cpp", "h", "ino", "arduino"}
})
--]]
--[[
--ARDUINO LANGUAGE SERVER
  local on_attach = require("nvchad.configs.lspconfig").on_attach
  local capabilities = require("nvchad.configs.lspconfig").capabilities



  -- Create modified capabilities without semantic tokens
  local arduino_capabilities = vim.tbl_deep_extend(
    "force",
    {},
    capabilities,
    {
      textDocument = {
        semanticTokens = {
          dynamicRegistration = false,
          -- Disable all semantic token features
          tokens = nil,
          formats = nil,
          overlappingTokenSupport = nil,
          multilineTokenSupport = nil,
        }
      }
    }
  )

  local custom_on_attach = function(client, bufnr)
    on_attach(client, bufnr) -- default attachments

    -- Disable semantic tokens for Arduino files
    if vim.bo[bufnr].filetype == "arduino" then
      client.server_capabilities.semanticTokensProvider = nil
    end
  end
  lspconfig.arduino_language_server.setup({
    on_attach = custom_on_attach,
    capabilities = arduino_capabilities,
    cmd = {
      "arduino-language-server",
      "-cli", "arduino-cli",  -- make sure arduino-cli is in your PATH
      "-cli-config", "~/.arduino15/arduino-cli.yaml",  -- adjust path if needed
      "-clangd", vim.fn.stdpath("data") .. "/mason/bin/clangd",  -- path to Mason's clangd
      "-fqbn", "arduino:avr:uno"  -- default board, can be changed per project
    },
    filetypes = { "ino", "arduino" },
  })
]]

return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  --MY CONFIGs
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    build = ":TSUpdate",
    require('nvim-treesitter.configs').setup{
        auto_install = true,
        --ensure_installed = { "lua", "python", "c", "markdown" },
              -- Ensure these module blocks are set to true
        highlight = {
          enable = true,
          use_languagetree = true,
        },
        indent = {
          enable = true,
        },
        -- 1. FIX INCREMENTAL SELECTION
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<CR>",      -- Press Enter to start selecting
            node_incremental = "<CR>",    -- Press Enter to expand selection
            scope_incremental = "<TAB>",   -- Press Backspace to expand to scope
            node_decremental = "<BS>",    -- Press Backspace to shrink selection
                },
              },

    }
  },

--------------------------------------------------
  -- Debug Adapt Protocol - DAP
--------------------------------------------------
  {
    "mfussenegger/nvim-dap",
    config = function()
      require "configs.dap"
    end
  },

  {
    "rcarriga/nvim-dap-ui",

    dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"},
    config = function()
      require "configs.dapui"
    end
  },

  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
    config = function()
      local path = "/home/noob/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(path)
    end,
  },
--------------------------------------------------
-- AI STUFF
--------------------------------------------------
  {
    "huggingface/llm.nvim",
    cmd = {"LLMToggleAutoSuggest"},
    opts = {
      -- Ollama
      backend = "ollama",
      url = "http://localhost:11434",

      -- Your local model
      model = "qwen2.5-coder:7b-base",

      -- Don't send requests too aggressively
      debounce_ms = 150,

      -- Accept/dismiss ghost text      
      accept_keymap = "<C-j>",
      dismiss_keymap = "<C-k>",

      -- Context available to the model
      context_window = 4096,

      -- Automatically enable suggestions
      enable_suggestions_on_startup = false,
      enable_suggestions_on_files = "*",

-- tokens_to_clear = { "<|im_start|>" },
      -- Ollama generation parameters
      request_body = {
        options = {
          temperature = 0.1, -- lower temp = code completion precise
          top_p = 0.95,
          num_predict = 64,
        },
      },

      -- FIM configuration
      fim = {
        enabled = true,
        prefix = "<|fim_prefix|>",
        middle = "<|fim_middle|>",
        suffix = "<|fim_suffix|>" ,
      },
      lsp = nil, -- Disable LSP to avoid position encoding warnings with Ollama
    },
  },
  {
    "olimorris/codecompanion.nvim",
    cmd = { "CodeCompanionActions" },
    version = "^19.0.0",
    config = function()
      require "configs.codecompanion"
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown", "codecompanion" }
  },

--------------------------------------------------
--------------------------------------------------
--------------------------------------------------
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
      "TmuxNavigatorProcessList",
    },
  },
  { 
    "danymat/neogen", 
    opts = {
      languages = {
        lua = {
          annotation_convention = "emmylua",
        },
        python = {
          annotation_convention = "numpydoc",
        },
        c = {
          annotation_convention = "doxygen",
        },
      },
    },
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = { "TodoTelescope" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },

--------------------------------------------------
-- OVERRIDE DEFAULT PLUGINS OPTIONS
--------------------------------------------------
  -- Fix Telescope
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        layout_config = {
          horizontal = {
            preview_cutoff = 0, -- Forces preview to show even on small screens
          },
          width = 0.95,
          height = 0.95,
        },
      },
    },
  }
}


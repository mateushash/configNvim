require("codecompanion").setup({
  interactions = {
    chat = {
      adapter = {
        name = "ollama",
        model = "qwen3.5:9b",
      },
      tools = {
        ["web_search"] = {
          opts = {
            adapter = "duckduckgo",
          },
        },
      },
    },
    inline = {
      adapter = {
        name = "ollama",
        model = "qwen3.5:9b",
      },
    },
    cli = {
      agent = "opencode",
      agents = {
        opencode = {
          cmd = "ollama",
          args = {'launch', 'opencode', '--model', 'qwen3.5:9b'},
          description = "OpenCode CLI",
          provider = "terminal",
        },
      },
    },
    background = {
      adapter = {
        name = "ollama",
        model = "qwen3.5:9b",
      },
    },
  },
  prompt_library = {
    markdown = {
      dirs = {
        vim.fn.stdpath("config") .. "/lua/configs/.codecompanion_prompts",
      },
    },
    ["Edit<->Test workflow"] = {
          interaction = "chat",
          description = "Use a workflow to repeatedly edit then test code",
          opts = {
            approval_mode = "auto",
            is_workflow = true,
          },
          prompts = {
            {
              {
                name = "Setup Test",
                role = "user",
                opts = { auto_submit = false },
                content = function()
                  return [[### Instructions
    
    Your instructions here
    
    ### Steps to Follow
    
    You are required to write code following the instructions provided above and test the correctness by running the designated test suite. Follow these steps exactly:
    
    1. Update the code in #{buffer} using the @{edit_file} tool
    2. Then use the @{run_command} tool to run the test suite with `<test_cmd>` (do this after you have updated the code)
    3. Make sure you trigger both tools in the same response
    
    We'll repeat this cycle until the tests pass. Ensure no deviations from these steps.]]
                end,
              },
            },
            {
              {
                name = "Repeat On Failure",
                role = "user",
                opts = { auto_submit = true },
                condition = function(chat)
                  return chat.tool_registry.flags.testing ~= nil
                end,
                repeat_until = function(chat)
                  return chat.tool_registry.flags.testing == true
                end,
                content = "The tests have failed. Can you edit the buffer and run the test suite again?",
              },
            },
        },
    },

  },
})

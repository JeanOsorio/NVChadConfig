-- Just an example, supposed to be placed in /lua/custom/

local M = {}

-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:

M.ui = {
  theme = "onedark",
}

M.plugins = {
  user = {
    ["hrsh7th/nvim-cmp"] = {
      config = function()
        require "plugins.configs.cmp"
        require "custom.cmp"
      end
    },
    ["neovim/nvim-lspconfig"] = {
      config = function()
        require "plugins.configs.lspconfig"
        require "custom.lspconfig"
      end,
    },
    ["jose-elias-alvarez/null-ls.nvim"] = {
      after = "nvim-lspconfig",
      config = function()
         require "custom.null-ls"
      end,
    },
    -- ["github/copilot.vim"] = {},
    ["zbirenbaum/copilot.lua"] = {
      event = {"VimEnter"},
      config = function()
        vim.defer_fn(function()
          require("copilot").setup{
            cmp = {
              enabled = true,
              method = "getCompletionsCycling",
            }
          }
        end, 100)
      end
    },
    ["zbirenbaum/copilot-cmp"] = {
      module = "copilot_cmp",
    }
  },
  override = {
    ["kyazdani42/nvim-tree.lua"] = {
      git = {
        enable = true,
      },
      view = {
        side = "right"
      }
    }
  }
}

return M

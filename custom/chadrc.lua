-- Just an example, supposed to be placed in /lua/custom/

local M = {}

-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:

M.ui = {
  theme = "chocolate",
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
        show_on_dirs = true,
        ignore = false,
      },
      view = {
        side = "right"
      },
      filters = {
        dotfiles = false,
      },
      renderer = {
        highlight_git = true,
        icons = {
          show = {
            git = true
          }
        }
      }
    }
  }
}

vim.opt.number = true -- show line number
vim.opt.relativenumber = true -- show relative number 

return M

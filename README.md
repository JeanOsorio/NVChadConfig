### Pluigns with this config

- lspcofing for html, tsserver and cssls
- null-ls to format JavaScript and TypeScript on save
- github copilot
- zbirenbaum/copilot.lua && zbirenbaum/copilot-cmp to show copilot suggestions
  inside the cmp panel (if you don't want to use copilot this way use the
  official copilot nvim plugin and override cmp config to not use `Tab` for
  suggestions or change copilot to use another key combination)

### Requirements:

To use copilot

Comment the following lines:

```lua
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
```

Uncomment the following line:

```lua
-- ["github/copilot.vim"] = {},
```

then `:PackerSync` and `:Copilot setup`, after set up copilot:

uncomment

```lua
--["zbirenbaum/copilot.lua"] = {
--   event = {"VimEnter"},
--   config = function()
--      vim.defer_fn(function()
--        require("copilot").setup{
--           cmp = {
--             enabled = true,
--             method = "getCompletionsCycling",
--           }
--        }
--     end, 100)
--   end
--},
--["zbirenbaum/copilot-cmp"] = {
--   module = "copilot_cmp",
--}
```

comment

```lua
["github/copilot.vim"] = {},
```

### Search in files

If you want to use the telescope live_grep (A.K.A find a term inside files) you
need to install ripgreg, you can install it on a Mac using:

```bash
brew install ripgrep
```

### Overrides

I have the following overrides for nvim-tree:

##### Git

- show files changes on nvim-tree
- show if a file have change inside a folder
- show files ignore by the .gitignore

##### View

- show nvim-tree panel on the right (I don't like my code move when a open the
  explorer panel)

##### Filters

- always show dot files i.e. .env

##### Renderer

- show git icons

### Other configuration

By default I use relative number

### TODO

- [ ] Install and config
      **[nvim-dap](https://github.com/mfussenegger/nvim-dap)**

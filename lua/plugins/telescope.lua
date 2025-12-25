return {
  "nvim-telescope/telescope.nvim",
  tag = "v0.2.0",
  dependencies = {
    "nvim-lua/plenary.nvim", -- Required dependency
    -- Optional, improves sorting performance
    -- 'nvim-telescope/telescope-fzf-native.nvim',
    -- Optional, adds file icons
    -- 'nvim-tree/nvim-web-devicons',
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local themes = require("telescope.themes")

    telescope.setup({
      defaults = {
        -- Prompt and selection
        prompt_prefix = "🔍 ",
        selection_caret = "➤ ",

        -- Layout configuration
        layout_strategy = "horizontal", -- Could be 'vertical', 'center', 'cursor'
        layout_config = {
          horizontal = { preview_width = 0.55 },
          width = 0.8,
          height = 0.8,
        },

        -- Mappings
        mappings = {
          i = {
            ["<C-c>"] = actions.close, -- Close Telescope
            ["<CR>"] = actions.select_default, -- Select entry
            ["<C-x>"] = actions.select_horizontal, -- Open in split
            ["<C-v>"] = actions.select_vertical, -- Open in vsplit
            -- Add more insert mode mappings here
          },
          n = {
            ["q"] = actions.close, -- Close in normal mode
            -- Add more normal mode mappings here
          },
        },

        -- Sorters (can add fzf_native here if installed)
        -- file_sorter = require('telescope.sorters').get_fuzzy_file,
        -- generic_sorter = require('telescope.sorters').get_generic_fuzzy_sorter,
      },

      pickers = {
        find_files = {
          theme = "dropdown", -- Can also use get_ivy, get_cursor, etc.
          hidden = true, -- Show hidden files
          -- Other options: previewer = false, cwd = '/some/path'
        },
        buffers = {
          theme = "dropdown",
          sort_mru = true, -- Sort by most recently used
          ignore_current_buffer = true,
        },
        -- Add more builtin pickers here, like live_grep, help_tags, git_commits, etc.
      },

      extensions = {
        -- Example: fzf_native extension
        -- fzf = {
        --   fuzzy = true,
        --   override_generic_sorter = true,
        --   override_file_sorter = true,
        --   case_mode = "smart_case",
        -- },
      },
    })

    -- Load extensions here if installed
    -- telescope.load_extension('fzf')

    -- Keymaps for builtin pickers
    local builtin = require("telescope.builtin")
    local opts = { noremap = true, silent = true }

    vim.keymap.set("n", "<leader>ff", builtin.find_files, opts) -- Find files
    vim.keymap.set("n", "<leader>fg", builtin.live_grep, opts) -- Search text
    vim.keymap.set("n", "<leader>fb", builtin.buffers, opts) -- List buffers
    vim.keymap.set("n", "<leader>fh", builtin.help_tags, opts) -- Help tags

    -- You can add custom functions like:
    -- vim.keymap.set('n', '<leader>fd', function()
    --   builtin.find_files(themes.get_dropdown({ previewer = false }))
    -- end, opts)
  end,
}

-- Modern Neovim configuration with lazy.nvim and built-in LSP
-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Set leader key early
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- Setup lazy.nvim with plugins
require("lazy").setup({
  -- Completion
  {
    "saghen/blink.cmp",
    dependencies = { "rafamadriz/friendly-snippets" },
    version = "1.*",
    event = "InsertEnter",
    opts = {
      keymap = { preset = "super-tab" },
      appearance = { nerd_font_variant = "mono" },
      sources = { default = { "lsp", "path", "snippets", "buffer" } },
      completion = {
        documentation = { auto_show = true, auto_show_delay_ms = 500 },
      },
    },
    opts_extend = { "sources.default" },
  },

  -- LSP Configuration
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "saghen/blink.cmp",
    },
    config = function()
      require("config.lsp")
    end,
  },

  -- Modern statusline
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          theme = "auto",
          component_separators = "|",
          section_separators = "",
        },
      })
    end,
  },

  -- File explorer
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup()
    end,
  },

  -- Fuzzy finder
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-file-browser.nvim",
    },
    config = function()
      local telescope = require("telescope")
      telescope.setup({
        defaults = {
          vimgrep_arguments = {
            "rg", "--color=never", "--no-heading", "--with-filename",
            "--line-number", "--column", "--smart-case", "--hidden",
            "--glob", "!.git/",
            "--glob", "!node_modules/",
            "--glob", "!tmp/",
            "--glob", "!data/",
          },
        },
        pickers = {
          find_files = {
            hidden = true,
            find_command = {
              "fd", "--type", "f", "--hidden",
              "--exclude", ".git",
              "--exclude", "node_modules",
              "--exclude", "tmp",
              "--exclude", "data",
            },
          },
        },
        extensions = {
          file_browser = {
            hijack_netrw = false,
            respect_gitignore = true,
          },
        },
      })
      telescope.load_extension("file_browser")
    end,
  },

  -- Git integration
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end,
  },

  -- Syntax highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "lua", "python", "javascript", "typescript", "go", "rust" },
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },

  -- Auto pairs
  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup()
    end,
  },

  -- Surround operations
  {
    "kylechui/nvim-surround",
    config = function()
      require("nvim-surround").setup()
    end,
  },

  -- Color scheme
  {
    "folke/tokyonight.nvim",
    config = function()
      vim.cmd.colorscheme("tokyonight-night")
    end,
  },

  -- Motion improvements
  {
    url = "https://codeberg.org/andyg/leap.nvim",
    config = function()
      vim.keymap.set({ "n", "x", "o" }, "s", "<Plug>(leap)", { desc = "Leap" })
      vim.keymap.set("n", "S", "<Plug>(leap-from-window)", { desc = "Leap from window" })
    end,
  },

  -- Which-key for keybinding help
  {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup()
    end,
  },

  -- Terminal integration
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup()
      local Terminal = require("toggleterm.terminal").Terminal
      local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })
      function _LAZYGIT_TOGGLE()
        lazygit:toggle()
      end
    end,
  },
})

-- Load mappings and other configuration
require("config.mappings")
require("config.options")

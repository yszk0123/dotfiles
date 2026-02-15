-- Options configuration
local opt = vim.opt

-- Line numbers
opt.number = true

-- Tabs and indentation
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true

-- Line wrapping
opt.wrap = false

-- Search settings
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

-- Cursor line
opt.cursorline = true

-- Appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- Backspace
opt.backspace = "indent,eol,start"

-- Clipboard
opt.clipboard:append("unnamedplus")

-- Split windows
opt.splitright = true
opt.splitbelow = true

-- Consider string-string as whole word
opt.iskeyword:append("-")

-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Shorter updatetime for better user experience
opt.updatetime = 250
opt.timeoutlen = 300

-- Save undo history
opt.undofile = true

-- Better completion experience
opt.completeopt = "menuone,noselect"

-- Minimum number of screen lines to keep above and below the cursor
opt.scrolloff = 8
opt.sidescrolloff = 8

-- Show which line your cursor is on
opt.cursorline = true
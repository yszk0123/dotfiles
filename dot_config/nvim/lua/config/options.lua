-- Options configuration
local opt = vim.opt

-- Line numbers
opt.number = true

-- Tabs and indentation
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true

-- Line wrapping
opt.wrap = false

-- Search settings
opt.ignorecase = true
opt.smartcase = true

-- Cursor line
opt.cursorline = true

-- Appearance
opt.background = "dark"
opt.signcolumn = "yes"

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

-- Japanese text formatting
opt.formatoptions:append("mM")
opt.formatoptions:remove("tca")

-- Color column
opt.colorcolumn = "80,100"

-- Show invisible characters
opt.list = true
opt.listchars = { tab = ">~", trail = "~", nbsp = "~", extends = ">", precedes = "<" }

-- Window title
opt.title = true

-- Wildignore patterns
opt.wildignore:append({ "*.a", "*.o", "*.bmp", "*.gif", "*.ico", "*.jpg", "*.png",
  ".DS_Store", ".git", ".hg", ".svn", "*~", "*.swp", "*.tmp" })

-- Suppress messages
opt.shortmess:append("c")

-- Disable beeping
opt.visualbell = true

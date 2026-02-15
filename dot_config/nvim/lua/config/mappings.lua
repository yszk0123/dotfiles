-- Mappings and user commands
local keymap = vim.keymap.set

-- Rename command (Lua port of legacy vim/commands.vim :Rename)
vim.api.nvim_create_user_command("Rename", function(o)
  local old = vim.fn.expand("%:p")
  vim.cmd("saveas " .. o.args)
  vim.fn.delete(old)
  vim.cmd("bdelete #")
end, { nargs = 1, complete = "file" })

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", { silent = true, desc = "Move to left window" })
keymap("n", "<C-j>", "<C-w>j", { silent = true, desc = "Move to below window" })
keymap("n", "<C-k>", "<C-w>k", { silent = true, desc = "Move to above window" })
keymap("n", "<C-l>", "<C-w>l", { silent = true, desc = "Move to right window" })

-- Resize windows with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", { silent = true, desc = "Increase window height" })
keymap("n", "<C-Down>", ":resize -2<CR>", { silent = true, desc = "Decrease window height" })
keymap("n", "<C-Left>", ":vertical resize -2<CR>", { silent = true, desc = "Decrease window width" })
keymap("n", "<C-Right>", ":vertical resize +2<CR>", { silent = true, desc = "Increase window width" })

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", { silent = true, desc = "Next buffer" })
keymap("n", "<S-h>", ":bprevious<CR>", { silent = true, desc = "Previous buffer" })

-- Stay in indent mode
keymap("v", "<", "<gv", { silent = true, desc = "Indent left" })
keymap("v", ">", ">gv", { silent = true, desc = "Indent right" })

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", { silent = true, desc = "Move line down" })
keymap("v", "<A-k>", ":m .-2<CR>==", { silent = true, desc = "Move line up" })
keymap("x", "J", ":move '>+1<CR>gv-gv", { silent = true, desc = "Move selection down" })
keymap("x", "K", ":move '<-2<CR>gv-gv", { silent = true, desc = "Move selection up" })
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", { silent = true, desc = "Move selection down" })
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", { silent = true, desc = "Move selection up" })

-- Better paste
keymap("v", "p", '"_dP', { silent = true, desc = "Paste without overwriting register" })

-- Clear highlights
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", { silent = true, desc = "Clear search highlights" })

-- File explorer
keymap("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { silent = true, desc = "Toggle file explorer" })

-- Telescope
keymap("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { silent = true, desc = "Find files" })
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { silent = true, desc = "Live grep" })
keymap("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { silent = true, desc = "Find buffers" })
keymap("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { silent = true, desc = "Help tags" })

-- Telescope file browser
keymap("n", "<leader>fe", ":Telescope file_browser<CR>", { silent = true, desc = "File browser" })
keymap("n", "<leader>fd", ":Telescope file_browser path=%:p:h select_buffer=true<CR>", { silent = true, desc = "File browser (current dir)" })

-- Git
keymap("n", "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", { silent = true, desc = "Open lazygit" })

-- Terminal
keymap("n", "<leader>tf", "<cmd>ToggleTerm direction=float<CR>", { silent = true, desc = "Float terminal" })
keymap("n", "<leader>th", "<cmd>ToggleTerm size=10 direction=horizontal<CR>", { silent = true, desc = "Horizontal terminal" })
keymap("n", "<leader>tv", "<cmd>ToggleTerm size=80 direction=vertical<CR>", { silent = true, desc = "Vertical terminal" })

-- Quick save
keymap("n", "<leader>w", "<cmd>w<CR>", { silent = true, desc = "Save file" })

-- Quick quit
keymap("n", "<leader>q", "<cmd>q<CR>", { silent = true, desc = "Quit" })

-- Source current file
keymap("n", "<leader><leader>", "<cmd>source %<CR>", { silent = true, desc = "Source current file" })

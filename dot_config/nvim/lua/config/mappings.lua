-- Mappings and user commands
local keymap = vim.keymap.set
local opts = { silent = true }

-- Rename command (Lua port of legacy vim/commands.vim :Rename)
vim.api.nvim_create_user_command("Rename", function(o)
  local old = vim.fn.expand("%:p")
  vim.cmd("saveas " .. o.args)
  vim.fn.delete(old)
  vim.cmd("bdelete #")
end, { nargs = 1, complete = "file" })

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize windows with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Better paste
keymap("v", "p", '"_dP', opts)

-- Clear highlights
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)

-- File explorer
keymap("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", opts)

-- Telescope
keymap("n", "<leader>ff", "<cmd>Telescope find_files<CR>", opts)
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", opts)
keymap("n", "<leader>fb", "<cmd>Telescope buffers<CR>", opts)
keymap("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", opts)

-- Telescope file browser
keymap("n", "<leader>fe", ":Telescope file_browser<CR>", { desc = "File browser" })
keymap("n", "<leader>fd", ":Telescope file_browser path=%:p:h select_buffer=true<CR>", { desc = "File browser (current dir)" })

-- Git
keymap("n", "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", opts)

-- Terminal
keymap("n", "<leader>tf", "<cmd>ToggleTerm direction=float<CR>", opts)
keymap("n", "<leader>th", "<cmd>ToggleTerm size=10 direction=horizontal<CR>", opts)
keymap("n", "<leader>tv", "<cmd>ToggleTerm size=80 direction=vertical<CR>", opts)

-- Quick save
keymap("n", "<leader>w", "<cmd>w<CR>", opts)

-- Quick quit
keymap("n", "<leader>q", "<cmd>q<CR>", opts)

-- Source current file
keymap("n", "<leader><leader>", "<cmd>source %<CR>", opts)

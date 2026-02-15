-- LSP Configuration
-- Neovim 0.11 built-in keymaps: K, grn, grr, gra, gri, gO, <C-s>
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls",
    -- "pyright",
    "ts_ls",
    -- "gopls",
    -- "rust_analyzer",
  },
})

-- Format keymap (no built-in equivalent)
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    vim.keymap.set("n", "<leader>f", function()
      vim.lsp.buf.format({ async = true })
    end, { buffer = args.buf, silent = true, desc = "Format buffer" })
  end,
})

-- Set capabilities for all servers via blink.cmp
vim.lsp.config("*", {
  capabilities = require("blink.cmp").get_lsp_capabilities(),
})

-- Enable installed servers
vim.lsp.enable(require("mason-lspconfig").get_installed_servers())

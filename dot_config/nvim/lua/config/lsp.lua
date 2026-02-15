-- LSP Configuration
-- Neovim 0.11 built-in keymaps: K, grn, grr, gra, gri, gO, <C-s>
local lspconfig = require("lspconfig")
local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")

-- Setup Mason
mason.setup()
mason_lspconfig.setup({
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

-- Completion capabilities from blink.cmp
local capabilities = require("blink.cmp").get_lsp_capabilities()

-- Setup LSP servers installed by Mason
for _, server_name in ipairs(mason_lspconfig.get_installed_servers()) do
  lspconfig[server_name].setup({
    capabilities = capabilities,
  })
end

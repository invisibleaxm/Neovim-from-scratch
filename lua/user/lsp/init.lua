local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require("mason").setup()
require("mason-lspconfig").setup {
    ensure_installed = { "jsonls", "lua_ls", "rust_analyzer", "powershell_es" },
}
require "user.lsp.configs"
require("user.lsp.handlers").setup()
require "user.lsp.null-ls"

local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

--if vim.loop.os_uname().sysname == "Windows_NT" then
--   require('nvim-treesitter.install').compilers = { "clang" }
--end

local parsers = {
   "bash",
   "comment",
   "css",
   "dockerfile",
   "html",
   "http",
   "javascript",
   "jsdoc",
   "json",
   "lua",
   "nix",
   "python",
   "regex",
   "rust",
   "vim",
   "yaml"
 }

configs.setup {
  ensure_installed = parsers,
  sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
  ignore_install = { "" }, -- List of parsers to ignore installing
  autopairs = {
    enable = true,
  },
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { "" }, -- list of language that will be disabled
    additional_vim_regex_highlighting = true,
  },
  indent = { enable = true, disable = { "yaml" } },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },

}

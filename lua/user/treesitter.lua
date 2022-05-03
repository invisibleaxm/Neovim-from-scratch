local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

local parsers = {
   "bash",
   "c",
   "cmake",
   "comment",
   "cpp",
   "css",
   "dockerfile",
   "dot",
   "gomod",
   "graphql",
   "hcl",
   "help",
   "hjson",
   "html",
   "http",
   "javascript",
   "jsdoc",
   "json",
   "json5",
   "lua",
   "make",
   "nix",
   "python",
   "regex",
   "rst",
   "rust",
   "typescript",
   "vim",
   "vue",
   "yaml",
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

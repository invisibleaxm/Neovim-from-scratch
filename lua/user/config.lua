local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.powershell = {
  install_info = {
    url = "https://github.com/jrsconfitto/tree-sitter-powershell",
    files = {"src/parser.c"}
  },
  filetype = "ps1",
  used_by = { "psm1", "psd1", "pssc", "psxml", "cdxml" }
}


-- Lua:
-- For dark theme
--vim.g.vscode_style = "dark"
-- For light theme
-- vim.g.vscode_style = "light"
-- Enable transparent background
--vim.g.vscode_transparent = 1
-- Enable italic comment
--vim.g.vscode_italic_comment = 1
-- Disable nvim-tree background color
--vim.g.vscode_disable_nvimtree_bg = true
----vim.cmd([[colorscheme vscode]])

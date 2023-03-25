-- following options are the default
-- each of these are documented in `:help nvim-tree.OPTION_NAME`
--If 0, do not show the icons for one of 'git' 'folder' and 'files'
--1 by default, notice that if 'files' is 1, it will only display
--if nvim-web-devicons is installed and on your runtimepath.
--if folder is 1, you can also tell folder_arrows 1 to show small arrows next to the folder icons.
--but this will not work when you set renderer.indent_markers.enable (because of UI conflict)

-- default will show icon by default if no icon is provided
-- default shows no icon by default

vim.cmd "nnoremap <C-n> :NvimTreeToggle<CR>"
vim.cmd "nnoremap <leader>r :NvimTreeRefresh<CR>"
vim.cmd "nnoremap <leader>n :NvimTreeFindFile<CR>"
-- More available functions:
-- NvimTreeOpen
-- NvimTreeClose
-- NvimTreeFocus
-- NvimTreeFindFileToggle
-- NvimTreeResize
-- NvimTreeCollapse
-- NvimTreeCollapseKeepBuffers

vim.cmd [[set termguicolors]] -- this variable must be enabled for colors to be applied properly

-- a list of groups can be found at `:help nvim_tree_highlight`
--vim.cmd [[highlight NvimTreeFolderIcon bg=blue]]

-- END TEMPORARY HACK


local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
  return
end


local function open_nvim_tree(data)
  local IGNORED_FT = {
    "markdown",
  }

  -- buffer is a real file on the disk
  local real_file = vim.fn.filereadable(data.file) == 1

  -- buffer is a [No Name]
  local no_name = data.file == "" and vim.bo[data.buf].buftype == ""

  -- &ft
  local filetype = vim.bo[data.buf].ft

  -- only files please
  if not real_file and not no_name then
    return
  end

  -- skip ignored filetypes
  if vim.tbl_contains(IGNORED_FT, filetype) then
    return
  end

  -- open the tree but don't focus it
  require("nvim-tree.api").tree.toggle({ focus = false })
end


local tree_cb = nvim_tree_config.nvim_tree_callback

nvim_tree.setup {
  disable_netrw = true,
  hijack_netrw = true,
  --[[
  ignore_ft_on_setup = {
    "startify",
    "dashboard",
    "alpha",
  },--]]
  hijack_cursor = false,
  update_cwd = true,
  diagnostics = {
    enable = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  update_focused_file = {
    enable = true,
    update_cwd = true,
    ignore_list = {},
  },
  system_open = {
    cmd = nil,
    args = {},
  },
  filters = {
    dotfiles = false,
    custom = {},
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 500,
  },
  view = {
    width = 40,
    hide_root_folder = false,
    side = "left",
    mappings = {
      custom_only = false,
      list = {
        { key = { "l", "<CR>", "o" }, cb = tree_cb "edit" },
        { key = "h", cb = tree_cb "close_node" },
        { key = "v", cb = tree_cb "vsplit" },
      },
    },
    number = false,
    relativenumber = false,
  },
  trash = {
    cmd = "trash",
    require_confirm = true,
  },
}

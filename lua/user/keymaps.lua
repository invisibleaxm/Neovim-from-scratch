local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

--vscode remaps

  --Better navigation
if vim.g.vscode ~= nil then
  keymap("n","<C-j>", ":call VSCodeNotify('workbench.action.navigateDown')<CR>", opts)
  keymap("x","<C-j>", ":call VSCodeNotify('workbench.action.navigateDown')<CR>", opts)
  keymap("n","<C-k>", ":call VSCodeNotify('workbench.action.navigateUp')<CR>", opts)
  keymap("x","<C-k>", ":call VSCodeNotify('workbench.action.navigateUp')<CR>", opts)
  keymap("n","<C-h>", ":call VSCodeNotify('workbench.action.navigateLeft')<CR>", opts)
  keymap("x","<C-h>", ":call VSCodeNotify('workbench.action.navigateLeft')<CR>", opts)
  keymap("n","<C-l>", ":call VSCodeNotify('workbench.action.navigateRight')<CR>", opts)
  keymap("x","<C-l>", ":call VSCodeNotify('workbench.action.navigateRight')<CR>", opts)
  keymap("n","<Space>", ":call VSCodeNotify('whichkey.show')<CR>", opts)
  keymap("x","<Space>", ":call VSCodeNotify('whichkey.show')<CR>", opts)
  keymap("n","<C-/>", ":call Comment()<CR>", opts)
  keymap("x","<C-/>", ":call Comment()<CR>", opts)
end


-- nnoremap <silent> <C-w>s :call <SID>split('h')<CR>
-- xnoremap <silent> <C-w>s :call <SID>split('h')<CR>

-- nnoremap <silent> <C-w>v :call <SID>split('v')<CR>
-- xnoremap <silent> <C-w>v :call <SID>split('v')<CR>
-- 
-- nnoremap <silent> <C-w>n :call <SID>splitNew('h', '__vscode_new__')<CR>
-- xnoremap <silent> <C-w>n :call <SID>splitNew('h', '__vscode_new__')<CR>
-- 
-- 
-- nnoremap <silent> <C-w>= :<C-u>call VSCodeNotify('workbench.action.evenEditorWidths')<CR>
-- xnoremap <silent> <C-w>= :<C-u>call VSCodeNotify('workbench.action.evenEditorWidths')<CR>
-- 
-- nnoremap <silent> <C-w>> :<C-u>call <SID>manageEditorSize(v:count, 'increase')<CR>
-- xnoremap <silent> <C-w>> :<C-u>call <SID>manageEditorSize(v:count, 'increase')<CR>
-- nnoremap <silent> <C-w>+ :<C-u>call <SID>manageEditorSize(v:count, 'increase')<CR>
-- xnoremap <silent> <C-w>+ :<C-u>call <SID>manageEditorSize(v:count, 'increase')<CR>
-- nnoremap <silent> <C-w>< :<C-u>call <SID>manageEditorSize(v:count, 'decrease')<CR>
-- xnoremap <silent> <C-w>< :<C-u>call <SID>manageEditorSize(v:count, 'decrease')<CR>
-- nnoremap <silent> <C-w>- :<C-u>call <SID>manageEditorSize(v:count, 'decrease')<CR>
-- xnoremap <silent> <C-w>- :<C-u>call <SID>manageEditorSize(v:count, 'decrease')<CR>

--
--
--nnoremap <silent> <C-w>_ :<C-u>call VSCodeNotify('workbench.action.toggleEditorWidths')<CR>
--

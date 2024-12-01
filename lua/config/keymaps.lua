vim.g.vimwiki_key_mappings = { table_mappings = 0 }; -- disable table mappings
-- remap vimwiki to allow copilot autocompletion
--vim.g.copilot_filetypes = { markdown = true }
-- vim.keymap.set("n", "ts", ":w | !npm test<CR>");
-- vim.keymap.set("n", "<leader>m", ":wa | !cat input.txt | node %<CR>")
-- auto refreshing server with browser-sync (only tested and working on windows
-- machine)
-- vim.keymap.set("n", "<leader>ss", ":tabnew server | terminal browser-sync start --server --files **/* <CR> :tabp <CR>")
vim.keymap.set("n", "<leader>ga", ":!git add .;git commit -m 'WOP'; git push <CR>")
vim.keymap.set("n", "<leader>ve", ":edit ~/.config/nvim/lua/ <CR>")
vim.keymap.set("n", "<leader>vi", ":edit ~/vimwiki/vim bible.wiki <CR>")
vim.keymap.set("n", "<leader>bi", ":edit ~/vimwiki/ubuntu bible.wiki<CR>")
vim.keymap.set("n", "<leader>td", ":edit ~/vimwiki/Tasks.wiki <CR>")

vim.keymap.set("n", "<C-s>", ":w<CR>")
-- theprimeagen neov
-- Check if oil.nvim is loaded
local status, oil = pcall(require, "oil")
if status then
  vim.keymap.set("n", "<leader>pv", ":Oil<CR>")
else
  vim.keymap.set("n", "<leader>pv", vim.cmd.Explore)
end
vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "Y", "yg$")
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("x", "<leader>p", "\"_dP")
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+y")
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")
vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer <CR>")
vim.keymap.set("n", "<leader>f", function()
    vim.lsp.buf.format()
end)
-- M = alt
--
vim.keymap.set("n", "<Up>", ":cprev<CR>")
vim.keymap.set("n", "<Down>", ":cnext<CR>")
--vim.keymap.set("n", "<C-K>", ":cprev<CR>zz")
--vim.keymap.set("n", "<C-J>", ":cnext<CR>zz")
--vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
--vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")
--
-- shortcut for find and replace when you are on the word you want to replace
vim.keymap.set("n", "<leader>c", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/g<Left><Left>")
vim.keymap.set("n", "<leader>x", ":!chmod +x %<CR>")
vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

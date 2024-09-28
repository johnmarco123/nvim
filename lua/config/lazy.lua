-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
-- installed lazy if it is not installed
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end

vim.g.mapleader = " "
vim.opt.rtp:prepend(lazypath)

require('lazy').setup('plugins')

v = vim
vk = vim.keymap
-- Create a keybinding to run the current filetype interpreter
-- remap vimwiki to allow copilot autocompletion
vim.g.vimwiki_key_mappings = { table_mappings = 0 }; -- disable table mappings
vim.g.copilot_filetypes = {markdown = true}
vk.set("n", "ts", ":w | !npm test<CR>");
vk.set("n", "<leader>m", ":wa | !cat input.txt | node %<CR>")
-- vk.set("n", "<leader>ss", ":tabnew server | terminal browser-sync start --server --files **/* <CR> :tabp <CR>")
vk.set("n", "<leader>ga", ":!git add .;git commit -m 'WOP'; git push <CR>")
vk.set("n", "<leader>ve", ":edit ~/.config/nvim/lua/ <CR>")
vk.set("n", "<leader>vi", ":edit ~/vimwiki/vim bible.wiki <CR>")
vk.set("n", "<leader>td", ":edit ~/vimwiki/Tasks.wiki <CR>")

vk.set("n", "<C-s>", ":w<CR>")
-- theprimeagen neov
vk.set("n", "<leader>pv", vim.cmd.Explore)
vk.set("v", "J", ":m '>+1<CR>gv=gv")
vk.set("v", "K", ":m '<-2<CR>gv=gv")
vk.set("n", "Y", "yg$")
vk.set("n", "J", "mzJ`z")
vk.set("n", "<C-d>", "<C-d>zz")
vk.set("n", "<C-u>", "<C-u>zz")
vk.set("n", "n", "nzzzv")
vk.set("n", "N", "Nzzzv")
vk.set("x", "<leader>p", "\"_dP")
vk.set("n", "<leader>y", "\"+y")
vk.set("v", "<leader>y", "\"+y")
vk.set("n", "<leader>Y", "\"+y")
vk.set("n", "<leader>d", "\"_d")
vk.set("v", "<leader>d", "\"_d")
vk.set("i", "<C-c>", "<Esc>")
vk.set("n", "Q", "<nop>")
vk.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer <CR>")
vk.set("n", "<leader>f", function()
    v.lsp.buf.format()
end)
-- M = alt
vk.set("n", "<C-K>", ":cprev<CR>zz")
vk.set("n", "<C-J>", ":cnext<CR>zz")

--vk.set("n", "<leader>k", "<cmd>lnext<CR>zz")
--vk.set("n", "<leader>j", "<cmd>lprev<CR>zz")
-- shortcut for find and replace when you are on the word you want to replace
vk.set("n", "<leader>c", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/g<Left><Left>")
vk.set("n", "<leader>x", ":!chmod +x %<CR>")
vk.set("n", "<leader><leader>", function()
    v.cmd("so")
end)
v = vim.o
v.splitright = true
v.nu = true
v.relativenumber = true
v.tabstop = 4
v.softtabstop = 4
v.shiftwidth = 4
v.expandtab = true
v.smartindent = true
v.wrap = false
v.swapfile = false
v.backup = false
v.undodir = os.getenv("HOME") .. "/.vim/undodir"
v.undofile = true
v.hlsearch = false
v.incsearch = true
v.termguicolors = true
v.scrolloff = 8
v.signcolumn = "yes"
v.updatetime = 50
v.colorcolumn = "80"
vim.g.mapleader = " "

-- Define a function to run the current filetype interpreter
v = vim
function RunFiletypeInterpreter()
  local filetype = v.bo.filetype
  if filetype == "python" then
    v.cmd[[:w | !python3 %]]
  elseif filetype == "javascript" then
    v.cmd[[:w | !node %]]
  elseif filetype == "lua" then
    v.cmd[[:w | luafile %]]
  elseif filetype == "typescript" then
    v.cmd[[:w | :!npx ts-node %]]
  elseif filetype == "ps1" then
    v.cmd[[:w | :! ./%]]
  elseif filetype == "rust" then
    v.cmd[[:w | :!cargo run]]
  elseif filetype == "go" then
    v.cmd[[:w | :!go run %]]
  elseif filetype == "php" then
    v.cmd[[:w | :!php %]]
  else
    print("No interpreter found for filetype " .. filetype)
  end
end
vim.api.nvim_set_keymap("n", "<leader>r", ":w <bar> lua RunFiletypeInterpreter()<CR>", { silent = true })


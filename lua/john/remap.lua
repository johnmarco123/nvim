v = vim
vk = vim.keymap
-- Create a keybinding to run the current filetype interpreter
-- remap vimwiki to allow copilot autocompletion
vim.g.vimwiki_key_mappings = { table_mappings = 0 }; -- disable table mappings
vim.g.copilot_filetypes = {markdown = true}
vk.set("n", "ts", ":w | !npm test<CR>");
v.api.nvim_set_keymap("n", "<leader>r", ":w <bar> lua RunFiletypeInterpreter()<CR>", { silent = true })
vk.set("n", "<leader>m", ":wa | !cat input.txt | node %<CR>")
vk.set("n", "<leader>ss", ":tabnew server | terminal browser-sync start --server --files **/* <CR> :tabp <CR>")
vk.set("n", "<leader>ga", ":!git add .;git commit -m 'WOP'; git push <CR>")
vk.set("n", "<leader>ve", ":edit ~/.config/nvim/lua/john/ <CR>")
vk.set("n", "<leader>td", ":edit ~/vimwiki/Tasks.wiki <CR>")

vk.set("n", "<C-s>", ":w<CR>")
vk.set("n", "<leader>zm", ":ZenMode<CR>")
-- theprimagen neov
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
vk.set("n", "<M-k>", ":cprev<CR>zz")
vk.set("n", "<M-j>", ":cnext<CR>zz")

--vk.set("n", "<leader>k", "<cmd>lnext<CR>zz")
--vk.set("n", "<leader>j", "<cmd>lprev<CR>zz")
-- shortcut for find and replace when you are on the word you want to replace
vk.set("n", "<leader>c", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/g<Left><Left>")
vk.set("n", "<leader>x", ":!chmod +x %<CR>")
vk.set("n", "<leader><leader>", function()
    v.cmd("so")
end)

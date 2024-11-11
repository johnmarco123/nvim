vim.o.splitright = true -- when splitting nvim does it split to right or left
vim.o.nu = true -- numbers on the left
vim.o.relativenumber = true -- relative numbers for neovim
-- the following are all indentation things
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smartindent = true

-- whether or not to wrap text
vim.o.wrap = false
vim.o.swapfile = false

vim.o.backup = false -- whether or not to make vim backup files
vim.o.undofile = true

vim.o.undodir = os.getenv("HOME") .. "/.vim/undodir" -- the dir for undotree
vim.o.hlsearch = false -- highlight all searches found and stay
vim.o.incsearch = true -- search incrementaly
vim.o.termguicolors = true
vim.o.scrolloff = 8
vim.o.signcolumn = "yes"
vim.o.updatetime = 50
vim.o.colorcolumn = "80" -- the line indicator that should be right here ----->

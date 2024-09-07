-- this makes sure that when opening a new file using :edit or any other command, 
-- that file also has enable_virt enabled. Note, this only runs on txt files-
vim.api.nvim_create_autocmd({
"BufEnter",
"BufWinEnter",
-- "CursorMoved",
"InsertLeave" }, {
  pattern = {"*.math", "*.wiki"},
  callback = function(ev)
    vim.cmd[[:lua require("nabla").enable_virt()]]
  end
})

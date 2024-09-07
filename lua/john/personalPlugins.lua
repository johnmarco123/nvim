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
  else
    print("No interpreter found for filetype " .. filetype)
  end
end

-- List = {}
-- FilePath = '/Users/jmtas/AppData/Local/nvim/lua/john/history.txt'
-- function FileHistory()
--
--     local function printList(List)
--         local outString = ""
--         for i, v in ipairs(List) do
--             outString = outString .. v .. '\n'
--         end
--         return outString
--     end
--
--     local function validPath(path)
--         -- conditions we dont want to have in our string
--         if string.find(path, '%.') == nil or path == "" then
--             return false
--         end
--
--         return true
--     end
--
--
--     -- local out = v.cmd
--     local path = v.api.nvim_buf_get_name(0)
--
--     -- if no valid path then we simply end
--     if not validPath(path) then
--         do return end
--     end
--    -- if it is a empty buffer dont add it 
--
--
--
--     local function has_value (tab, val)
--         for index, value in ipairs(tab) do
--             if value == val then
--                 return index
--             end
--         end
--         return false
--     end
--
--     local valueIndex = has_value(List, path)
--     -- if it has the element we need to remove it first before we add it
--     if valueIndex then
--         table.remove(List, valueIndex)
--     end
--
--     table.insert(List, 1, path)
--
--
--     --if the list is too big we need to pop the end
--     local maxList = 10
--     if #List >= maxList then
--         local index = #List
--         local value = List[index]
--         table.remove(List, index)
--         print('removed value: ' .. value)
--     end
--
--     -- local outString = printList(List)
--     local data = printList(List)
--     local file = io.open(FilePath, 'w')
--     if file then
--         file:write(data)
--         file:close();
--     else
--         print('error opening file')
--     end
--
-- end
--
-- -- local name = vim.fn.input('Filename: ')
-- local file = io.open(FilePath, 'rb')
-- if file then
--     local lines = {}
--     for line in file:lines() do
--         line = line:gsub("\r$", "")
--         print(line)
--     end
-- end
--
-- -- Define a function to display files using Telescope
-- function Display_files()
--     local currFile = io.open('/users/jmtas/appdata/local/nvim/lua/john/history.txt', 'r')
--     local currFiles = {}
--
--     if currFile then
--         for line in currFile:lines() do
--             table.insert(currFiles, line)
--         end
--         currFile:close()
--
--         local filteredFiles = {}
--         for _, path in ipairs(currFiles) do
--             if vim.fn.filereadable(path) == 1 then
--                 table.insert(filteredFiles, path)
--             end
--         end
--
--         require('telescope.builtin').find_files({
--             cwd = '/',
--             prompt_title = 'Files',
--             entry_maker = function(path)
--                 local currFile2 = io.open(path, 'r')
--                 local content = nil
--                 if currFile2 then
--                     content = currFile2:read('*all')
--                     currFile2:close()
--                 end
--                 return {
--                     value = content,
--                     display = content or path, -- Use path as fallback if content is nil
--                     ordinal = content or path, -- Use path as fallback if content is nil
--                     filename = path,
--                 }
--             end,
--             entry_list = filteredFiles
--         })
--     else
--         print("Failed to open history.txt")
--     end
-- end
--
-- vim.api.nvim_set_keymap('n', '<leader>ex', ":w <bar> lua Display_files()<CR>", { silent = true })
--
-- -- every buffer adds the filename to our lin ed list
-- v.api.nvim_create_autocmd({"BufEnter"}, { callback = FileHistory })
-- cat filelist.txt | nvim -c 'lua require("telescope.builtin").find_files({ previewer = false })'
-- | lua require ("telescope.builtin").find_files({ previewer = false })
-- v.keymap.set("n", "<leader>hs", "echo");

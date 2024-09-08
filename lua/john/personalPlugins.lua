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

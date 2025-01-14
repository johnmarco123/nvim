-- Define a function to run the current filetype interpreter
function RunFiletypeInterpreter()
  local filetype = vim.bo.filetype
  if filetype == "python" then
    vim.cmd[[:w | !python3 %]]
  elseif filetype == "javascript" then
    vim.cmd[[:w | !node %]]
  elseif filetype == "lua" then
    vim.cmd[[:w | luafile %]]
  elseif filetype == "typescript" then
    vim.cmd[[:w | :!npx ts-node %]]
  elseif filetype == "ps1" then
    vim.cmd[[:w | :! ./%]]
  elseif filetype == "rust" then
    vim.cmd[[:w | :!cargo run]]
  elseif filetype == "go" then
    vim.cmd[[:w | :!go run *.go]]
  elseif filetype == "php" then
    vim.cmd[[:w | :!php %]]
  elseif filetype == "conf" then -- bash
    vim.cmd[[:w | :!./%]]
  else
    print("No interpreter found for filetype " .. filetype)
  end
end
vim.api.nvim_set_keymap("n", "<leader>r", ":w <bar> lua RunFiletypeInterpreter()<CR>", { silent = true })

function GitTodo()
    -- Get the current git branch name
    local handle = io.popen("git rev-parse --abbrev-ref HEAD")
    if not handle then
        print("Failed to execute git command")
        return
    end
    local branch_name = handle:read("*a"):gsub("%s+", "") -- Trim whitespace
    handle:close()

    if branch_name == "" then
        print("Not in a Git repository")
        return
    end

    -- Construct the file path
    local file_path = vim.fn.expand("~/vimwiki/tickets/" .. branch_name .. ".wiki")

    -- Open the file in the current buffer
    vim.cmd("edit " .. file_path)

    -- If the file is empty or new, write the template
    if vim.fn.line2byte('$') == -1 then
        local template = string.format(
            "# TODO List for branch: \n %s\n\n= First Thoughts = \n= Questions = \n= Conclusions =",
            branch_name
        )
        vim.api.nvim_buf_set_lines(0, 0, -1, false, vim.split(template, "\n"))
        print("Template added to new file: " .. file_path)
    else
        print("Opened file: " .. file_path)
    end
end
vim.api.nvim_set_keymap("n", "<leader>gd", ":lua GitTodo()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>pd", 'o?><pre><?php print_r();?></pre><?php<ESC>F(p', { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>qt", "<cmd>lua require('telescope.builtin').quickfix()<CR>",{ noremap = true, silent = true })
vim.keymap.set("n", "<leader>vs", function()
    local cwd = vim.fn.getcwd()
    vim.cmd("silent !code " .. cwd .. " --no-sandbox --user-data-dir .vscode")
    end)


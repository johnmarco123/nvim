function ColorMyPencils(color)
    color = color or "tokyonight-night"
    vim.cmd.colorscheme(color)
    vim.api.nvim_set_hl(0, 'LineNr', { fg="#00FFFF" })
    vim.api.nvim_set_hl(0, 'Comment', { fg="#FF0000" })
--  vim.api.nvim_set_hl(0, 'Visual', {bg="#00FF88", fg="#000000"})

--   vim.api.nvim_set_hl(0, 'DiagnosticUnnecessary', {fg="#FF5F1F"})
end
ColorMyPencils()
vim.cmd([[autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({higroup="IncSearch", timeout=50})]])

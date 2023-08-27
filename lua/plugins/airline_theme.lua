local M = {}
function M.config()
    vim.g["airline_theme"] = 'codedark'
    vim.g["airline_powerline_fonts"] = 1
    vim.g["airline#extensions#tabline#enabled"] = 1

    vim.keymap.set('n', 'gn', ':bnext<CR>', { noremap = true, silent = true })
    vim.keymap.set('n', 'gp', ':bprev<CR>', { noremap = true, silent = true })
end

return M

local M = {}

function M.config()
    vim.keymap.set('n', '<leader>d', ':Dox<CR>', { noremap = true, silent = true })
end

return M

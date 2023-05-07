local M = {}

function M.config()
    vim.g.vim_ai_chat = {
        options = {
            model = "gpt-4",
            temperature = 0.2,
        },
    }

    vim.keymap.set('n', '<leader>e', ':AIEdit<CR>', { silent = true })
    vim.keymap.set('x', '<leader>e', ':AIEdit<CR>', { silent = true })
    vim.keymap.set('n', '<leader>a', ':AI<CR>', { silent = true })
    vim.keymap.set('x', '<leader>a', ':AI<CR>', { silent = true })
end

return M

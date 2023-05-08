local M = {}

function M.config()
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<space>b', builtin.buffers, {})
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

    vim.keymap.set('n', '<space>f', builtin.find_files, {})
    vim.keymap.set('n', '<space>a',
        function() builtin.live_grep({ default_text = vim.fn.expand("<cword>"), additional_args = { '-w' } }) end)
end

return M

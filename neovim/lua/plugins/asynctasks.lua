local M = {}

function M.config()
    vim.g.asynctasks_term_pos = 'floaterm_reuse'
    vim.g.asynctasks_term_rows = 10
    vim.g.asynctasks_term_reuse = 1
    vim.g.asynctasks_term_hidden = 1
    vim.keymap.set('n', '<F5>', ':AsyncTask run<cr>', { noremap = true, silent = true })
    vim.g.asyncrun_rootmarks = { '.git', '.svn', '.root', '.project', '.hg' }
end

return M

local M = {}

function M.config()
    vim.g.NERDSpaceDelims = 1
    vim.g.NERDCompactSexyComs = 1
    vim.g.NERDDefaultAlign = 'left'
    vim.g.NERDAltDelims_c = 1
    vim.g.NERDCommentEmptyLines = 1
    vim.g.NERDTrimTrailingWhitespace = 1
    vim.g.NERDToggleCheckAllLines = 1
    vim.keymap.set('n', '<C-_>', '<leader>c<Space>', { silent = true })
    vim.keymap.set('v', '<C-_>', '<leader>c<Space>', { silent = true })
end

return M

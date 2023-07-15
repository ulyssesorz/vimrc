local M = {}

function M.config()
    vim.g.NERDSpaceDelims = 1
    vim.g.NERDCompactSexyComs = 1
    vim.g.NERDDefaultAlign = 'left'
    vim.g.NERDAltDelims_c = 1
    vim.g.NERDCommentEmptyLines = 1
    vim.g.NERDTrimTrailingWhitespace = 1
    vim.g.NERDToggleCheckAllLines = 1
    vim.keymap.set('n', '<C-_>', '<Plug>NERDCommenterToggle', {})
    vim.keymap.set('v', '<C-_>', '<Plug>NERDCommenterToggle', {})
    vim.keymap.set('n', '<leader>c<Space>', '<Plug>NERDCommenterToggle', {})
    vim.keymap.set('v', '<leader>c<Space>', '<Plug>NERDCommenterToggle', {})
end

return M

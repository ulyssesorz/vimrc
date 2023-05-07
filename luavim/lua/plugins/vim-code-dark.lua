local M = {}

function M.config()
    vim.g.codedark_term256 = 1
    vim.cmd('colorscheme codedark')
end

return M

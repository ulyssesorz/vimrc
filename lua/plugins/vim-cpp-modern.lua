local M = {}
function M.config()
    vim.g.cpp_attributes_highlight = 1
    vim.g.cpp_simple_highlight = 1
    vim.g.cpp_no_cpp20 = 1
end

return M

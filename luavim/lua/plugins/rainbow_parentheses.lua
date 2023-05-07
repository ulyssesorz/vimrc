local M = {}

function M.config()
    vim.g.rainbow_pairs = {
        { '(', ')' },
        { '[', ']' },
        { '{', '}' }
    }
    vim.cmd [[
" rainbow_parentheses
augroup rainbow_lisp
  autocmd!
  autocmd FileType * RainbowParentheses
augroup END
    ]]
end

return M

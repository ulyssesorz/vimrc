local M = {}

function M.config()
    vim.g.fzf_command_prefix = 'Fzf'
    vim.g.fzf_layout = {
        window = {
            width = 0.9,
            height = 0.6,
            border = "bold"
        }
    }
end

return M

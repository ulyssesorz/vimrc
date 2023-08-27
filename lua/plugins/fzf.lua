local M = {}

function M.config()
    vim.g.fzf_command_prefix = 'Fzf'
    vim.g.fzf_layout = {
        window = {
            width = 0.8,
            height = 0.85,
            border = "bold"
        }
    }
end

return M

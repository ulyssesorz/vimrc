local M = {}

function M.config()
    vim.g.fzf_command_prefix = 'Fzf'
    vim.cmd('command! -bang -nargs=* FzfAg call fzf#vim#ag(<q-args>, "--word-regexp", fzf#vim#with_preview(), <bang>0)')
    vim.keymap.set('n', '<space>f', ':FzfFiles<CR>', { silent = true })
    vim.keymap.set('n', '<space>a', ':exe "FzfAg " .. expand("<cword>")<CR>', { silent = true })
    vim.keymap.set('n', '<space>b', ':FzfBuffers<CR>', { silent = true })
end

return M

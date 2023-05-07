local M = {}

function M.config()
    vim.g.coc_global_extensions = {
        'coc-snippets',
        'coc-pyright',
        'coc-go',
        'coc-json',
        'coc-lists',
        'coc-cmake',
        'coc-sh',
        'coc-markdownlint',
        'coc-webview',
        'coc-markdown-preview-enhanced',
        'coc-pairs',
        'coc-clangd',
        'coc-git',
        'coc-tsserver',
        'coc-explorer',
        'coc-lua',
    }

    -- TextEdit might fail if hidden is not set.
    vim.opt.hidden = true

    -- Some servers have issues with backup files, see #649.
    vim.opt.backup = false
    vim.opt.writebackup = false

    -- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
    -- delays and poor user experience.
    vim.opt.updatetime = 300

    -- Don't pass messages to |ins-completion-menu|.
    vim.opt.shortmess:append('c')

    function _G.check_back_space()
        local col = vim.fn.col('.') - 1
        return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
    end

    vim.keymap.set('i', '<CR>',
        'pumvisible() ? coc#_select_confirm() : "<C-g>u<CR><C-r>=coc#on_enter()<CR>"',
        { expr = true, silent = true })
    vim.keymap.set('i', '<C-x><C-z>', 'pumvisible() ? coc#_close() : "<C-x><C-z>"',
        { expr = true, silent = true })
    vim.keymap.set('i', '<TAB>',
        'pumvisible() ? coc#_select_next() : v:lua.check_back_space() ? "<TAB>" : coc#refresh()',
        { expr = true, silent = true })
    vim.keymap.set('i', '<S-TAB>', 'pumvisible() ? coc#_select_prev() : "<C-h>"',
        { expr = true, silent = true })
    vim.keymap.set('i', '<c-space>', 'coc#refresh()', { expr = true, silent = true })

    -- Use `[g` and `]g` to navigate diagnostics
    -- Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
    vim.keymap.set('n', '[g', '<Plug>(coc-diagnostic-prev)', { silent = true })
    vim.keymap.set('n', ']g', '<Plug>(coc-diagnostic-next)', { silent = true })

    vim.keymap.set('n', 'gd', '<Plug>(coc-definition)', { silent = true })
    vim.keymap.set('n', 'gy', '<Plug>(coc-type-definition)', { silent = true })
    vim.keymap.set('n', 'gi', '<Plug>(coc-implementation)', { silent = true })
    vim.keymap.set('n', 'gr', '<Plug>(coc-references)', { silent = true })
    vim.keymap.set('n', 'go', '<C-o>', { silent = true })

    -- Use K to show documentation in preview window.
    vim.keymap.set('n', 'K', ':call v:lua.show_documentation()<CR>', { silent = true })

    function _G.show_documentation()
        if vim.bo.filetype == 'vim' or vim.bo.filetype == 'help' then
            vim.cmd('h ' .. vim.fn.expand('<cword>'))
        elseif vim.fn['coc#rpc#ready']() then
            vim.fn.CocActionAsync('doHover')
        else
            vim.cmd('!' .. vim.o.keywordprg .. ' ' .. vim.fn.expand('<cword>'))
        end
    end

    -- Symbol renaming.
    vim.keymap.set('n', '<leader>rn', '<Plug>(coc-rename)', { silent = true })

    -- Formatting selected code.
    vim.keymap.set('x', '<leader>f', '<Plug>(coc-format-selected)', { silent = true })
    vim.keymap.set('n', '<leader>f', '<Plug>(coc-format-selected)', { silent = true })

    vim.api.nvim_create_augroup("CocGroup", {})
    vim.api.nvim_create_autocmd("CursorHold", {
        group = "CocGroup",
        command = "silent call CocActionAsync('highlight')",
        desc = "Highlight symbol under cursor on CursorHold"
    })

    -- Setup formatexpr specified filetype(s)
    vim.api.nvim_create_autocmd("FileType", {
        group = "CocGroup",
        pattern = "typescript,json",
        command = "setl formatexpr=CocAction('formatSelected')",
        desc = "Setup formatexpr specified filetype(s)."
    })

    -- Update signature help on jump placeholder
    vim.api.nvim_create_autocmd("User", {
        group = "CocGroup",
        pattern = "CocJumpPlaceholder",
        command = "call CocActionAsync('showSignatureHelp')",
        desc = "Update signature help on jump placeholder"
    })

    -- Add `:Format` command to format current buffer.
    vim.cmd('command! -nargs=0 Format :call CocAction("format")')

    -- Remap keys for applying codeAction to the current buffer.
    vim.keymap.set('n', '<leader>ac', '<Plug>(coc-codeaction)', { silent = true })
    -- Apply AutoFix to problem on the current line.
    vim.keymap.set('n', '<leader>qf', '<Plug>(coc-fix-current)', { silent = true })

    -- Remap <C-f> and <C-b> to scroll float windows/popups
    ---@diagnostic disable-next-line: redefined-local
    local opts = { silent = true, nowait = true, expr = true }
    vim.keymap.set("n", "<C-f>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', opts)
    vim.keymap.set("n", "<C-b>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', opts)
    vim.keymap.set("i", "<C-f>",
        'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(1)<cr>" : "<Right>"', opts)
    vim.keymap.set("i", "<C-b>",
        'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(0)<cr>" : "<Left>"', opts)
    vim.keymap.set("v", "<C-f>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', opts)
    vim.keymap.set("v", "<C-b>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', opts)


    -- Use <leader>x for convert visual selected code to snippet
    vim.keymap.set('x', '<leader>x', '<Plug>(coc-convert-snippet)', { silent = true })

    -- coc popups highlight after colorscheme
    vim.cmd('hi CocSearch ctermfg=12 guifg=#18A3FF')
    vim.cmd('hi CocMenuSel ctermbg=128 guibg=#13354A')

    vim.keymap.set('n', '<space>e', ':CocCommand explorer<CR>', { silent = true, noremap = true })
    vim.keymap.set('n', '<F9>', ':CocCommand git.browserOpen<CR>', { silent = true })
end

return M

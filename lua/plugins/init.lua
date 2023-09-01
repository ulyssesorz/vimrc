local function run_config(config_module)
    local function is_directory_empty(path)
        local cmd = 'ls -A "' .. path .. '" |grep -v packer'
        local handle = io.popen(cmd)
        local result = ''
        if handle ~= nil then
            result = handle:read('*a')
            handle:close()
        end
        return result == ''
    end

    if is_directory_empty('$HOME/.local/share/nvim/site/pack/packer/start/') then
        return
    end
    require(config_module).config()
end

local function local_pack()
end

require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use {
        'tomasiser/vim-code-dark',
        config = run_config('plugins.vim-code-dark')
    }
    use {
        'neoclide/coc.nvim',
        branch = 'release',
        config = run_config('plugins.coc')
    }
    use {
        'vim-airline/vim-airline',
        requires = { 'vim-airline/vim-airline-themes' },
        config = require("plugins.airline_theme").config()
    }

    use {
        'scrooloose/nerdcommenter',
        config = run_config('plugins.nerdcommenter')
    }
    use 'honza/vim-snippets'
    use {
        'antoinemadec/coc-fzf',
        branch = 'release',
        requires = {
            {
                'junegunn/fzf.vim',
                config = run_config('plugins.fzf')
            },
            {
                'junegunn/fzf',
                run = 'cd ~/.fzf && ./install --all && go build . && mv fzf bin',
            }
        },
        config = run_config('plugins.cocfzf')
    }
    use {
        'fatih/vim-go',
        ft = { 'go' }
    }
    use {
        'ntpeters/vim-better-whitespace',
        config = run_config('plugins.vim-better-whitespace')
    }
    use {
        'skywind3000/asynctasks.vim',
        requires = {
            'skywind3000/asyncrun.vim',
        },
        config = run_config('plugins.asynctasks')
    }
    use {
        'voldikss/vim-floaterm',
        config = run_config('plugins.floaterm')
    }
    use {
        'bfrg/vim-cpp-modern',
        ft = { 'c', 'cpp' },
        config = run_config('plugins.vim-cpp-modern')
    }
    use {
        'junegunn/rainbow_parentheses.vim',
        config = run_config('plugins.rainbow_parentheses')
    }
    use {
        'vim-scripts/DoxygenToolkit.vim',
        config = run_config('plugins.DoxygenToolkit')
    }
    use {
        'madox2/vim-ai',
        config = run_config('plugins.vim-ai')
    }
    use {
        'Civitasv/cmake-tools.nvim',
        requires = {
            'nvim-lua/plenary.nvim',
            {
                'nvim-lualine/lualine.nvim',
                requires = { 'nvim-tree/nvim-web-devicons' },
            }
        },
        config = run_config('plugins.cmake-tools')
    }
    use {
        'nvim-telescope/telescope-ui-select.nvim',
        requires = {
            'nvim-telescope/telescope.nvim',
            tag = '0.1.1',
            requires = {
                { 'nvim-lua/plenary.nvim' },
            },
            config = run_config('plugins.telescope')
        },
        config = run_config('plugins.telescope-ui-select')
    }
    local_pack()
end)

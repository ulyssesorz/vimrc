require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use {
        'neoclide/coc.nvim',
        branch = 'release',
        config = require('plugins.coc').config()
    }
    use {
        'vim-airline/vim-airline',
        requires = { 'vim-airline/vim-airline-themes' },
        config = require("plugins.airline_theme").config()
    }
    use {
        'scrooloose/nerdcommenter',
        config = require('plugins.nerdcommenter').config()
    }
    use 'honza/vim-snippets'
    use {
        'antoinemadec/coc-fzf',
        branch = 'release',
        requires = {
            {
                'junegunn/fzf.vim',
                config = require('plugins.fzf').config()
            },
            {
                'junegunn/fzf',
                run = 'cd ~/.fzf && ./install --all',
            }
        },
        config = require('plugins.cocfzf').config()
    }
    use {
        'fatih/vim-go',
        ft = { 'go' }
    }
    use {
        'ntpeters/vim-better-whitespace',
        config = require('plugins.vim-better-whitespace').config()
    }
    use {
        'skywind3000/asynctasks.vim',
        requires = {
            'skywind3000/asyncrun.vim',
        },
        config = require('plugins.asynctasks').config()
    }
    use {
        'voldikss/vim-floaterm',
        config = require('plugins.floaterm').config()
    }
    use {
        'bfrg/vim-cpp-modern',
        ft = { 'c', 'cpp' },
        config = require('plugins.vim-cpp-modern').config()
    }
    use {
        'junegunn/rainbow_parentheses.vim',
        config = require('plugins.rainbow_parentheses').config()
    }
    use {
        'tomasiser/vim-code-dark',
        config = require('plugins.vim-code-dark').config()
    }
    use {
        'vim-scripts/DoxygenToolkit.vim',
        config = require('plugins.DoxygenToolkit').config()
    }
    use {
        'madox2/vim-ai',
        config = require('plugins.vim-ai').config()
    }
    use {
        'Civitasv/cmake-tools.nvim',
        requires = {
            "nvim-lua/plenary.nvim",
            {
                'nvim-lualine/lualine.nvim',
                requires = { 'nvim-tree/nvim-web-devicons' }
            }

        },
        config = require("plugins.cmake-tools").config()
    }
    use { 'nvim-telescope/telescope-ui-select.nvim' }
end)

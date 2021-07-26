return require'packer'.startup({function(use)
    use 'wbthomason/packer.nvim'
    use {
        "kyazdani42/nvim-web-devicons",
        module = "nvim-web-devicons",
    }
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ":TSUpdate"
    }
    use {
        'SirVer/ultisnips',
        opt = true,
        requires = {'honza/vim-snippets', opt=true}
    }
    use {
        'kyazdani42/nvim-tree.lua',
        cmd = {"NvimTreeToggle", "NvimTree", "NvimTreeOpen", "NvimTreeClose"},
        requires = {'kyazdani42/nvim-web-devicons'}
    }
    use {
        'tpope/vim-commentary'
    }
    use {
        'nvim-lua/popup.nvim',
        module = "popup"
    }
    use {
        'nvim-lua/plenary.nvim',
        module = "plenary"
    }
    use {
        'windwp/nvim-autopairs',
    }
    use {
        'ayu-theme/ayu-vim',
        config = function()
            vim.cmd("colorscheme ayu")
        end
    }
    use {
        'hrsh7th/nvim-compe'
    }
    use {
        'itchyny/lightline.vim',
    }
    use {
        'nvim-telescope/telescope.nvim',
        cmd = "Telescope"
    }
    use {
        'neovim/nvim-lspconfig'
    }
    use {
        'tpope/vim-fugitive',
        cmd = {"G", "Fugitive"}
    }
    use {
        'fatih/vim-go',
        run = ":GoUpdateBinaries",
        ft = {"go", "gomod"}
    }
end,
config = {ensure_dependencies   = true}
})

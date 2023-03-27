vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    use 'tmux-plugins/vim-tmux'
    use 'kyazdani42/nvim-tree.lua'
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
    use { "nvim-telescope/telescope-file-browser.nvim" }
    use {'nvim-telescope/telescope-ui-select.nvim' }
    use { 'nvim-telescope/telescope-media-files.nvim' }
    use {
  'phaazon/hop.nvim',
  branch = 'v2', -- optional but strongly recommended
  config = function()
    -- you can configure Hop the way you like here; see :h hop-config
    require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
  end
}
    use 'khaveesh/vim-fish-syntax'
    use { "kkharji/sqlite.lua" }
    use {
  'prochri/telescope-all-recent.nvim',
  config = function()
    require'telescope-all-recent'.setup{
      -- your config goes here
    }
  end
}
    use {'neoclide/coc.nvim', branch = 'release'}
    
    use 'nvim-lua/plenary.nvim'
    use 'editorconfig/editorconfig-vim'
    use 'akinsho/org-bullets.nvim'
    use 'brenoprata10/nvim-highlight-colors'
    use 'williamboman/nvim-lsp-installer'
    use 'nvim-orgmode/orgmode'
    use 'folke/which-key.nvim'
    use 'nvim-treesitter/nvim-treesitter'
    use {"smartpde/telescope-recent-files"}
    use 'nvim-telescope/telescope.nvim'
    use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
}
    use({"catppuccin/nvim",
    use { 'nvim-telescope/telescope-project.nvim' },
        as = "catppuccin"})
    use 'kyazdani42/nvim-web-devicons'
    use 'SirVer/ultisnips'
    use 'honza/vim-snippets'
    use { 'feline-nvim/feline.nvim', branch = 'master' }
    use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'}
    use {
    'goolord/alpha-nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function ()
        require'alpha'.setup(require'alpha.themes.dashboard'.config)
    end
}
end)

require'nvim-tree'.setup {
    disable_netrw       = true,
    hijack_netrw        = true,
    ignore_ft_on_setup  = {},
    open_on_tab         = true,
    hijack_cursor       = true,
    update_cwd          = true,
    diagnostics = {
      enable = true,
      icons = {
        hint = "",
        info = "",
        warning = "",
        error = "",
      }
    },
    update_focused_file = {
      enable      = true,
      update_cwd  = true,
      ignore_list = {}
    },
    system_open = {
      cmd  = nil,
      args = {}
    },
    filters = {
      dotfiles = false,
      custom = {}
    },
    git = {
      enable = true,
      ignore = true,
      timeout = 500,
    },
    view = {
      width = 30,
      hide_root_folder = false,
      side = 'left',
      mappings = {
        custom_only = false,
        list = {}
      },
      number = false,
      relativenumber = false,
      signcolumn = "yes"
    },
    trash = {
      cmd = "trash",
      require_confirm = true
    }
  }
  
vim.cmd ([[
nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <C-r> :NvimTreeRefresh<CR>
nnoremap <C-f> :NvimTreeFindFile<CR>
]])

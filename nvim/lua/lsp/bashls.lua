require'lspconfig'.bashls.setup{
cmd = { "bash-language-server", "start" },
filetypes = { "sh" },
single_file_support = true,
cmd_env =
{
  GLOB_PATTERN = "*@(.sh|.inc|.bash|.command)"
},

}

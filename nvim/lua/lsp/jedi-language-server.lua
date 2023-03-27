require'lspconfig'.jedi_language_server.setup{
cmd = { "jedi-language-server" };
filetypes = { "python" };
single_file_support = true;
}

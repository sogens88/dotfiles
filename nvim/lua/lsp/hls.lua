require'lspconfig'.hls.setup{
cmd = { "haskell-language-server-wrapper", "--lsp" },
filetypes = { "haskell", "lhaskell" },
single_file_support = true,
settings = {
  haskell = {
    formattingProvider = "ormolu"
  },
},
}

require("plugins.init")
require("plugins.nvimtree")
require("plugins.catppucchin")
require("plugins.feline")
require("plugins.mason")
require("plugins.media-files")
require("plugins.alpha")
require("plugins.orgmode")
require("plugins.colors")

require("lsp.hls")
--require("lsp.lua_language_server")
require("lsp.bashls")
require("lsp.jedi-language-server")
require("lsp.java-language-server")

require("bufferline").setup{}
require("settings")
require("colors")


require'telescope'.load_extension('project')

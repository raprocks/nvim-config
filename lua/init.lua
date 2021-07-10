require'lspconfig'.vimls.setup{
    on_attach = require'completion'.on_attach,
}


require'lspconfig'.gopls.setup{
    on_attach = require'completion'.on_attach,
    root_dir = require'lspconfig'.util.root_pattern(".", "go.mod", ".git")
}

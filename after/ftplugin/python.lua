require'lspconfig'.pylsp.setup{
    settings={
        pylsp = {
            configurationSources = { "pycodestyle", "pyflakes" },
            plugins = { pydocstyle = {enabled = true}},
            type = "string"
        }
    }
}

require'lspconfig'["pylsp"].manager.try_add_wrapper()
print("Initialized pylsp LSP")

require'lspconfig'.pyright.setup{}
require'lspconfig'["pyright"].manager.try_add_wrapper()

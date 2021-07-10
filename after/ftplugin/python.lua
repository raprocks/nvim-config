require'lspconfig'.pylsp.setup{
    on_attach=require'completion'.on_attach,
    settings={
        pyls = {
            configurationSources = { "pycodestyle", "pyflakes" },
            type = "string"
        }
    }
}

require'lspconfig'["pylsp"].manager.try_add_wrapper()
print("Initialized pylsp LSP")

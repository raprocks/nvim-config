local capabilities_svelte = vim.lsp.protocol.make_client_capabilities()
capabilities_svelte.textDocument.completion.completionItem.snippetSupport = true
require'lspconfig'.svelte.setup{
    capabilities = capabilities_svelte,
    settings = {
        svelte = {
            plugin = {
                html = {
                    completions = {
                        emmet = false
                    }
                }
            }
        }
    }
}
require'lspconfig'['svelte'].manager.try_add_wrapper()

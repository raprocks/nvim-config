local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require'lspconfig'.html.setup {
  capabilities = capabilities,
}

local configs = require'lspconfig/configs'

local capabilities_emmet = vim.lsp.protocol.make_client_capabilities()
capabilities_emmet.textDocument.completion.completionItem.snippetSupport = true

if not require'lspconfig'.emmet_ls then
  configs.emmet_ls = {
    default_config = {
      cmd = {'emmet-ls', '--stdio'};
      filetypes = {'html', 'css'};
      root_dir = function(fname)
        return vim.loop.cwd()
      end;
      settings = {};
    };
  }
end
require'lspconfig'.emmet_ls.setup{ capabilities = capabilities; }

require'lspconfig'["html"].manager.try_add_wrapper()

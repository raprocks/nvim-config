local sumneko_root_path = '/home/rap/.local/share/nvim/lua-language-server'
local sumneko_binary = sumneko_root_path.."/bin/".."Linux".."/lua-language-server"

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

require'lspconfig'.sumneko_lua.setup {
    cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
    settings = {
        Lua= {
            runtime = {
                version = 'LuaJIT',
                path = runtime_path,
            },
            diagnostics = {
                globals = {'vim'},
            },
            workspace = {
                library = {
                [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true
                },
                maxPrelaod = 1000
            },
            telemetry = {
                enable = false,
            }
        }
    }
}

require'lspconfig'["sumneko_lua"].manager.try_add_wrapper()
print("Initialized Lua LSP")


local function set_global(option, value)
    vim.api.nvim_set_var(option, value)
end

-- UltiSnips
set_global("UltiSnipsExpandTrigger", "<c-a>")
set_global("UltiSnipsJumpForwardTrigger", "<tab>")
set_global("UltiSnipsJumpBackwardTrigger", "<s-tab>")

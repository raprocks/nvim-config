vim.g.mapleader = " "

local function mapper(mode, lhs, rhs, opts)
    vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
end

-- NeoVim Remaps; leader bound; no prefix; #maychange
mapper("n", "<Leader>qa", ":qa", {})

-- Window Navigation Remaps; leader bound; prefix 'w' then direction
mapper("n", "<Leader>wj", ":wincmd j<CR>", { noremap = true, silent=true})
mapper("n", "<Leader>wk", ":wincmd k<CR>", { noremap = true, silent=true})
mapper("n", "<Leader>wl", ":wincmd l<CR>", { noremap = true, silent=true})
mapper("n", "<Leader>wh", ":wincmd h<CR>", { noremap = true, silent=true})

-- Resizing Windows (M is alt, C is Ctrl)
mapper("n", "<M-C-Up>", ":resize -2<CR>",{ noremap = true})
mapper("n", "<M-C-Down>", ":resize +2<CR>",{ noremap = true})
mapper("n", "<M-C-Left>", ":vertical resize -2<CR>",{ noremap = true})
mapper("n", "<M-C-Right>", ":vertical resize +2<CR>",{ noremap = true})

-- NvimTree; leader bound; prefix t; #maychange
mapper("n", "<Leader>tt", ":NvimTreeToggle<CR>",{})
mapper("n", "<Leader>to", ":NvimTreeOpen<CR>",{})
mapper("n", "<Leader>tc", ":NvimTreeClose<CR>",{})
mapper("n", "<Leader>tf", ":NvimTreeFindFile<CR>",{})

-- nvim-compe; direct
mapper("i", "<C-Space>", "compe#complete()", { silent=true, noremap = true, expr = true})
mapper("i", "<C-e>", "compe#close('<C-e>')", { silent=true, noremap = true, expr = true})
mapper("i", "<C-f>", "compe#scroll({ 'delta': +4})", { silent=true, noremap = true, expr = true})
mapper("i", "<C-d>", "compe#scroll({ 'delta': -4})", { silent=true, noremap = true, expr = true})


-- Fugitive/Git; leader bound; prefix g
mapper("n", "<Leader>g", ":G<CR>", {silent=true, noremap=true})


-- Completion menu
local function escape_termcode(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

function _G.smart_tab()
    return vim.fn.pumvisible() == 1 and escape_termcode'<C-n>' or escape_termcode'<Tab>'
end

mapper('i', "<Tab>", "v:lua.smart_tab()", {expr=true, noremap=true})

function _G.smart_shift_tab()
    return vim.fn.pumvisible() == 1 and escape_termcode'<C-p>' or escape_termcode'<S-Tab>'
end

mapper('i', "<S-Tab>", "v:lua.smart_shift_tab()", {expr=true, noremap=true})

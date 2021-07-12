vim.g.mapleader = " "

local function mapper(mode, lhs, rhs, opts)
    vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
end

-- NeoVim Remaps; leader bound; no prefix; #maychange
mapper("n", "<Leader>qa", ":qa", {})

-- Window Navigation Remaps; leader bound; prefix 'w' then direction
mapper("n", "<Leader>wj", "<C-w>j", { noremap = true})
mapper("n", "<Leader>wk", "<C-w>k", { noremap = true})
mapper("n", "<Leader>wl", "<C-w>l", { noremap = true})
mapper("n", "<Leader>wh", "<C-w>h", { noremap = true})

-- Resizing Windows (M is alt, C is Ctrl)
mapper("n", "<M-C-Up>", "<C-w>2-",{ noremap = true})
mapper("n", "<M-C-Down>", "<C-w>2+",{ noremap = true})
mapper("n", "<M-C-Left>", "<C-w>2<",{ noremap = true})
mapper("n", "<M-C-Right>", "<C-w>2>",{ noremap = true})

-- NvimTree; leader bound; prefix t; #maychange
mapper("n", "<Leader>tt", ":NvimTreeToggle<CR>",{})
mapper("n", "<Leader>to", ":NvimTreeOpen<CR>",{})
mapper("n", "<Leader>tc", ":NvimTreeClose<CR>",{})
mapper("n", "<Leader>tf", ":NvimTreeFindFile<CR>",{})

-- nvim-compe; direct
mapper("i", "<C-Space>", "compe#complete()", { silent=true, noremap = true, expr = true})
mapper("i", "<CR>", "compe#confirm('<CR>')", { silent=true, noremap = true, expr = true})
mapper("i", "<C-e>", "compe#close('<C-e>')", { silent=true, noremap = true, expr = true})
mapper("i", "<C-f>", "compe#scroll({ 'delta': +4})", { silent=true, noremap = true, expr = true})
mapper("i", "<C-d>", "compe#scroll({ 'delta': -4})", { silent=true, noremap = true, expr = true})

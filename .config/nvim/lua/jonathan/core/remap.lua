-- selection moving
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

-- break line at cursor
vim.keymap.set("n", "<leader><CR>", "a<CR><Esc>")

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<cr>", { desc = "Clear search highlight" })
vim.keymap.set("i", "jk", "<Esc>", { desc = "Exit insert mode" })

vim.keymap.set("n", ";", ":", { desc = "Enter command mode" })
vim.keymap.set("x", ";", ":", { desc = "Enter command mode" })

require("gitsigns").setup {
	current_line_blame = true,
}

vim.keymap.set("n", "di", "<cmd>Gitsigns diffthis<CR>")

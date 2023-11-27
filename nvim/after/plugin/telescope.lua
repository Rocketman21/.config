local telescope = require('telescope')
local builtin = require('telescope.builtin')
local utils = require("telescope.utils")

telescope.load_extension('harpoon')

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)

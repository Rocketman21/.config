vim.g.mapleader = " "
vim.g.netrw_sizestyle = "H"

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "-", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap 
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set('n', '<C-c>', '<cmd>nohlsearch<CR>')

vim.keymap.set("n", "Q", "<nop>")
-- vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<M-n>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<M-p>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>n", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>p", "<cmd>lprev<CR>zz")
vim.keymap.set("n", "<leader>c", ":if empty(filter(getwininfo(), 'v:val.quickfix')) | copen | else | cclose | endif<CR>", { silent = true })

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>d", [[:s/ /\r\t/g<CR>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>u", ":UndotreeToggle<CR>:wincmd p<CR>", { noremap = true, silent = true })
-- vim.keymap.set("n", "<leader><leader>", function()
--     vim.cmd("so")
-- end)

vim.keymap.set("n", "<leader>e'", "ciw'<C-r>\"'<Esc>", { desc = "Wrap word in 'single quotes'" })
vim.keymap.set("n", "<leader>e\"", "ciw\"<C-r>\"\"<Esc>", { desc = "Wrap word in \"double quotes\"" })
vim.keymap.set("n", "<leader>e`", "ciw`<C-r>\"`<Esc>", { desc = "Wrap word in `back quotes`" })
vim.keymap.set("n", "<leader>e[", "ciw[ <C-r>\" ]<Esc>", { desc = "Wrap word in [ brackets ]" })
vim.keymap.set("n", "<leader>e(", "ciw(<C-r>\")<Esc>", { desc = "Wrap word in (braces)" })
vim.keymap.set("n", "<leader>e{", "ciw{ <C-r>\" }<Esc>", { desc = "Wrap word in { curly braces }" })
vim.keymap.set("n", "<leader>ep", "ciw({ <C-r>\" })<Esc>", { desc = "Wrap word in ({ function parameter braces })" })

function ColorMyPencil(color)
    color = color or "gruvbox"
    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return  {
	'ellisonleao/gruvbox.nvim',
	config = function()
		require("gruvbox").setup({
			bold = false,
			palette_overrides = {
				bright_yellow = "#ebc271",
				bright_orange = "#ff9d4d",
			},
		})

		ColorMyPencil()
	end,
}

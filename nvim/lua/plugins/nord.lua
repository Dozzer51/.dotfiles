return {
	"gbprod/nord.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("nord").setup({
			borders = true,
			styles = {
				-- Style to be applied to different syntax groups
				-- Value is any valid attr-list value for `:help nvim_set_hl`
				comments = { italic = true },
				keywords = {},
				functions = {},
				variables = {},
			}
		})
		vim.cmd.colorscheme("nord")
	end,
}

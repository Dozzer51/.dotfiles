return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		opts = {
			library = {
				-- See the configuration section for more details
				-- Load luvit types when the `vim.uv` word is found
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},
	config = function()
		require("lspconfig").lua_ls.setup{}
		require("lspconfig").clangd.setup{}
		require("lspconfig").hyprls.setup{}

		-- Hyprlang LSP
		vim.api.nvim_create_autocmd({'BufEnter', 'BufWinEnter'}, {
			pattern = {"*.hl", "hypr*.conf"},
			callback = function(_)
				vim.lsp.start {
					name = "hyprlang",
					cmd = {"hyprls"},
					root_dir = vim.fn.getcwd(),
				}
			end
		})
	end,
}

return {
	"rose-pine/neovim",
	name = "rose-pine",
	lazy = false,
	priority = 1000,
	config = function()
		require("rose-pine").setup()
		function Transparent(color)
			color = color or "rose-pine-main"
			vim.cmd.colorscheme(color)
			vim.api.nvim_set_hl(0, "Normal", { bg = "none", ctermfg = "none" })
			vim.api.nvim_set_hl(0, "NormalNC", { bg = "none", ctermfg = "none" })
			vim.api.nvim_set_hl(0, "NormalSB", { bg = "none", ctermfg = "none" })
		end
		Transparent()
	end,
}

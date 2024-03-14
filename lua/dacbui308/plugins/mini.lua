return {
	"echasnovski/mini.nvim",
	version = "*",
	config = function()
		require("mini.pairs").setup({})
		require("mini.ai").setup()
		require("mini.indentscope").setup()
		require("mini.comment").setup()
		require("mini.completion").setup()
	end,
}

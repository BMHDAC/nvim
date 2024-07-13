return {
	"folke/trouble.nvim",
	opts = {}, -- for default options, refer to the configuration section for custom setup
	config = function()
		require("trouble").setup()
		vim.keymap.set("n", "<leader>tt", function()
			require("trouble").toggle({
				mode = "diagnostics",
			})
		end)
		vim.keymap.set("n", "[t", function()
			require("trouble").prev({ skip_groups = true, jump = true })
		end)
		vim.keymap.set("n", "]t", function()
			require("trouble").next({ skip_groups = true, jump = true })
		end)
	end,
}

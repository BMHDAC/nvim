return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")
		harpoon.setup({
			settings = {
				save_on_toggle = true,
				sync_on_ui_close = true,
			},
		})
		vim.keymap.set("n", "<C-e>", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end)
		vim.keymap.set("n", "<leader>add", function()
			harpoon:list():add()
			vim.fn.printf("Added current file to harpoon")
		end)

		vim.keymap.set("n", "<A-h>", function()
			harpoon:list():select(1)
		end)
		vim.keymap.set("n", "<A-j>", function()
			harpoon:list():select(2)
		end)
		vim.keymap.set("n", "<A-k>", function()
			harpoon:list():select(3)
		end)
		vim.keymap.set("n", "<A-l>", function()
			harpoon:list():select(4)
		end)
	end,
}

vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.cmd.smartindent = true

-- Relative line numbers
vim.opt.relativenumber = true
vim.opt.number = true

-- Mouse
vim.opt.mouse = ""

vim.opt.showmode = true
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.updatetime = 250
vim.opt.colorcolumn = "90"

-- vim.g.loaded_netrwPlugin = 0
-- vim.g.loaded_netrw = 0
vim.cmd("set signcolumn=auto:2")
vim.opt.scrolloff = 10
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
vim.opt.autoread = true
vim.o.termguicolors = true
vim.o.guicursor = ""
vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
	command = "if mode() != 'c' | checktime | endif",
	pattern = { "*" },
})
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.hlsearch = true
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.diagnostic.config({
	-- float = { border = "rounded", focusable = false, style = "minimal", source = true, header = "", prefix = "" },
	underline = true,
	virtual_text = {
		prefix = "●",
		source = false,
		hl_mode = "blend",
		virt_text_pos = "eol",
		format = function(diagnostic)
			return string.format(
				"%s: %s",
				vim.fn.strpart(vim.diagnostic.severity[diagnostic.severity], 0, 1),
				vim.fn.strpart(diagnostic.message, 0, math.min(50, vim.fn.strlen(diagnostic.message))) .. "..."
			)
		end,
	},
	severity_sort = true,
	update_in_insert = true,
})
vim.keymap.set("v", "<C-y>", '"+y')
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>le", vim.diagnostic.open_float)
vim.keymap.set("n", "<leader>lf", vim.diagnostic.setloclist)
local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
-- vim.keymap.set("n", "<A-l>", vim.cmd.bnext)
-- vim.keymap.set("n", "<A-h>", vim.cmd.bprevious)
-- vim.keymap.set("n", "<A-x>", vim.cmd.bd)
vim.keymap.set("n", "<leader>px", ":Ex<CR>")

vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

function Transparent(color)
	if color == nil then
		return
	end
	vim.cmd.colorscheme(color)
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
	-- vim.api.nvim_set_hl(0, "NormalSB", { bg = "none" })
	-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })
	vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
end

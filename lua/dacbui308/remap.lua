vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set relativenumber")
vim.opt.updatetime = 50
vim.opt.scrolloff = 10
vim.opt.colorcolumn = "90"
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true
vim.g.netrw_liststyle = 3
vim.g.netrw_banner = 0
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.opt.number = true
vim.opt.undofile = true
vim.opt.autoread = true
vim.o.termguicolors = true
vim.o.guicursor = ""
vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
	command = "if mode() != 'c' | checktime | endif",
	pattern = { "*" },
})
vim.opt.hlsearch = true
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("n", "<A-l>", vim.cmd.bnext)
vim.keymap.set("n", "<A-h>", vim.cmd.bprevious)
vim.keymap.set("n", "<A-x>", vim.cmd.bd)
vim.keymap.set("n", "<leader>le", vim.diagnostic.open_float)
vim.keymap.set("n", "<c-h>", "<c-w>h<CR>")
vim.keymap.set("n", "<c-j>", "<c-w>j<CR>")
vim.keymap.set("n", "<c-k>", "<c-w>k<CR>")
vim.keymap.set("n", "<c-l>", "<c-w>l<CR>")
vim.keymap.set("n", "<leader>lf", vim.diagnostic.setloclist)
-- vim.keymap.set("n", "<leader>px", ":Ex<CR>")
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

function Transarent(color)
	if color == nil then
		return
	end
	vim.cmd.colorscheme(color)
	vim.api.nvim_set_hl(0, "Normal", { bg = "none", ctermbg = "none" })
	vim.api.nvim_set_hl(0, "NormalNC", { bg = "none", ctermbg = "none" })
	vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })
	vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
end

-- vim.cmd('source ~/.vimrc')


-- vim.cmd("colorsheme tokyonight")
--
--
-- vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
-- vim.opt.undofile = true
--
-- vim.opt.termguicolors = true
--
--
-- vim.api.nvim_set_keymap("n", "<leader>s", ":silent !$SHELL<CR>", { noremap = true, silent = true })
--
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	"nvim-lualine/lualine.nvim",
	"nvim-treesitter/nvim-treesitter",
	-- "nvim-telescope/telescope.nvim",
	"neovim/nvim-lspconfig"
})

-- require("lazy").setup("plugins")

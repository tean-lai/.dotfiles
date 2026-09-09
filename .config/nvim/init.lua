vim.g.mapleader = " "
require("set")
require("remap")
require("lsp")

-- LAZY PLUGIN MANAGER
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end

local rtp = vim.opt.rtp
rtp:prepend(lazypath)

require('lazy').setup("plugins")

-- theme and transparency
-- Re-applied on every colorscheme change, otherwise :colorscheme wipes the transparency.
vim.api.nvim_create_autocmd("ColorScheme", {
  group = vim.api.nvim_create_augroup("transparent-bg", { clear = true }),
  callback = function()
    for _, group in ipairs({ "Normal", "NormalNC", "EndOfBuffer" }) do
      vim.api.nvim_set_hl(0, group, { bg = "none" })
    end
  end,
})

vim.cmd.colorscheme("kanagawa-paper")

vim.g.mapleader = " "
require("set")
require("remap")

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

vim.cmd.colorscheme("kanagawa-paper")


-- local on_attach = function(_, bufnr)
--   local map = function(mode, lhs, rhs) vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true, noremap = true }) end
--   map("n", "gd", vim.lsp.buf.definition)
--   map("n", "gr", vim.lsp.buf.references)
--   map("n", "K",  vim.lsp.buf.hover)
--   map("n", "<leader>rn", vim.lsp.buf.rename)
--   map({"n","v"}, "<leader>ca", vim.lsp.buf.code_action)
--   map("n", "<leader>f", function() vim.lsp.buf.format({ async = true }) end)
-- end
--   cmd = { "rust-analyzer" },
--   filetypes = { "rust" },
--   root_markers = { "Cargo.toml", "rust-project.json", ".git" },
--   settings = {
--     ["rust-analyzer"] = {
--       cargo = { allFeatures = true },
--       -- checkOnSave = { command = "clippy" },
--     },
--   },
--   on_attach = on_attach,
-- }
--
-- vim.lsp.enable("rust_analyzer")

-- LSP Diagnostics Options Setup 
local sign = function(opts)
  vim.fn.sign_define(opts.name, {
    texthl = opts.name,
    text = opts.text,
    numhl = ''
  })
end

-- sign({name = 'DiagnosticSignError', text = ''})
-- sign({name = 'DiagnosticSignWarn', text = ''})
-- sign({name = 'DiagnosticSignHint', text = ''})
-- sign({name = 'DiagnosticSignInfo', text = ''})

vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    update_in_insert = true,
    underline = true,
    severity_sort = false,
    float = {
        border = 'rounded',
        source = 'always',
        header = '',
        prefix = '',
    },
})

vim.cmd([[
set signcolumn=yes
autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
]])

-- require("lsp.rust")


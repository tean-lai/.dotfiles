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

require('lazy').setup({

})

vim.lsp.config['ocamllsp'] = {
  cmd = { 'ocamllsp' },
  filetypes = { 'ocaml' },
  root_markers = { '.git', 'dune-project' },

--   settings = {
--     OCaml = {
--       runtime = {
--         version = 'ocamlc',
--       }
--     }
--   }
}

vim.lsp.enable('ocamllsp')

-- vim.lsp.config('*', {
--   capabilities = {
--     textDocument = {
--       semanticTokens = {
--         multilineTokenSupport = true,
--       }
--     }
--   },
--   root_markers = { '.git' },
-- })

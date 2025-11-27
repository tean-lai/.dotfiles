
vim.g.rustaceanvim = {
  -- plugin config
  tools = {
  },
  -- lsp config
  server = {
    on_attach = function(client, bufnr)
      local map = function(mode, lhs, rhs) vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true, noremap = true }) end
      -- can put keymaps here
      map("n", "gd", vim.lsp.buf.definition)
      map("n", "K", vim.cmd.RustLsp({'hover', 'actions'})
      map("n", "<leader>f", function() vim.lsp.buf.format({ async = true }) end)
      map({"n", "v"}, "<leader>a", vim.RustLsp('codeAction')
    end,
    default_settings = {
      -- rust-analyzer config
      ['rust-analyzer'] = {
      },
    },
  },
  -- dap config
  dap = {
  },
}


-- LSP Diagnostics Options Setup

-- Custom diagnostic gutter icons. Kept around: flip the sign() calls back on to use them.
---@diagnostic disable-next-line: unused-local
local sign = function(opts)
  vim.fn.sign_define(opts.name, {
    texthl = opts.name,
    text = opts.text,
    numhl = ''
  })
end

-- sign({name = 'DiagnosticSignError', text = ''})
-- sign({name = 'DiagnosticSignWarn', text = ''})
-- sign({name = 'DiagnosticSignHint', text = ''})
-- sign({name = 'DiagnosticSignInfo', text = ''})

vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  underline = true,
  severity_sort = false,
  float = {
    border = 'rounded',
    source = true,
    header = '',
    prefix = '',
  },
})

-- The float is the only diagnostic display here (virtual_text is off), so surface it on hold.
vim.api.nvim_create_autocmd("CursorHold", {
  group = vim.api.nvim_create_augroup("diagnostic-float", { clear = true }),
  callback = function()
    vim.diagnostic.open_float(nil, { focusable = false })
  end,
})

-- One place for LSP keymaps. Fires for every client, whatever the language.
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
  callback = function(ev)
    local map = function(mode, lhs, rhs)
      vim.keymap.set(mode, lhs, rhs, { buffer = ev.buf, silent = true })
    end
    map("n", "gd", vim.lsp.buf.definition)
    map("n", "gr", vim.lsp.buf.references)
    map("n", "K", vim.lsp.buf.hover)
    map("n", "<leader>rn", vim.lsp.buf.rename)
    map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action)
    map("n", "<leader>f", function() vim.lsp.buf.format({ async = true }) end)

    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if not client then
      return
    end

    -- Ruff's hover only reports noqa codes. Let the type checker own K instead.
    if client.name == "ruff" then
      client.server_capabilities.hoverProvider = false
    end

    if client:supports_method("textDocument/completion") then
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
    end
  end,
})

-- Per-server overrides. Merged onto the definitions nvim-lspconfig ships in its lsp/ dir.

-- lua_ls has no idea about Neovim's `vim` global or runtime files on its own.
-- Recipe lifted from nvim-lspconfig's own lua_ls docs.
vim.lsp.config('lua_ls', {
  on_init = function(client)
    if client.workspace_folders then
      local path = client.workspace_folders[1].name
      if
        path ~= vim.fn.stdpath('config')
        and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc'))
      then
        return
      end
    end

    client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
      runtime = {
        version = 'LuaJIT',
        path = { 'lua/?.lua', 'lua/?/init.lua' },
      },
      workspace = {
        checkThirdParty = false,
        library = { vim.env.VIMRUNTIME },
      },
    })
  end,
})

-- Ruff and the type checker both want to sort imports. Ruff is faster, so it wins.
vim.lsp.config('basedpyright', {
  settings = {
    basedpyright = {
      disableOrganizeImports = true,
    },
  },
})

-- Native LSP (nvim 0.11+). Server definitions come from nvim-lspconfig's lsp/ directory,
-- which lazy.nvim puts on the runtimepath; vim.lsp.enable picks them up by name.
-- Enable only servers whose binary is actually installed, so adding a language
-- is "install the binary" and nothing else. The binary name is read off each
-- server's own cmd rather than hardcoded here, so it can't drift from upstream.
local servers = {
  "ruff",         -- python: lint, format, autofix
  "basedpyright", -- python: types, hover, go-to-definition
  "lua_ls",       -- lua
  "ocamllsp",     -- ocaml, dune, menhir, ocamllex
}

for _, name in ipairs(servers) do
  local cfg = vim.lsp.config[name]
  local cmd = cfg and cfg.cmd
  if type(cmd) == "table" and vim.fn.executable(cmd[1]) == 1 then
    vim.lsp.enable(name)
  end
end

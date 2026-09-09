return {
  -- Server definitions only. nvim-lspconfig ships an lsp/<name>.lua for ~370 servers;
  -- vim.lsp.enable() in lua/lsp.lua reads them off the runtimepath. No setup() call needed.
  { "neovim/nvim-lspconfig" },

  -- Treesitter (better syntax/indent)
  -- ponytail: master is frozen upstream. The `main` rewrite has a different API
  -- (no nvim-treesitter.configs, manual vim.treesitter.start); migrate when it settles.
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "python",
          "ocaml",
          "ocaml_interface",
          "lua",
          "toml",
          "markdown",
          "vim",
          "vimdoc",
        },
        highlight = { enable = true },
        indent = { enable = true },
      })

      -- .mli signature files are filetype "ocaml" but need the ocaml_interface
      -- grammar; the impl grammar parses them with errors. Keep the filetype so
      -- ocamllsp and the ocaml ftplugin still apply, swap only the parser.
      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("ocaml-interface-ts", { clear = true }),
        pattern = "ocaml",
        callback = function(ev)
          if vim.fn.fnamemodify(vim.api.nvim_buf_get_name(ev.buf), ":e") == "mli" then
            vim.treesitter.start(ev.buf, "ocaml_interface")
          end
        end,
      })
    end,
  },

  -- Themes
  { "thesimonho/kanagawa-paper.nvim" },
  { "rebelot/kanagawa.nvim" },
  { "shaunsingh/nord.nvim" },
  { "scottmckendry/cyberdream.nvim" },
  { "neanias/everforest-nvim" },
  { "catppuccin/nvim" },
  { "folke/tokyonight.nvim" },
  { "rose-pine/neovim" },

  -- Nice
  { "nvim-lualine/lualine.nvim", config = true },

  -- Parked. Neovim 0.11+ covers all of this natively: vim.lsp.enable() replaces the
  -- mason-lspconfig bridge, and vim.lsp.completion.enable() replaces the cmp stack.
  -- Uncomment if you ever want mason to install servers for you, or want cmp's
  -- snippet/source ecosystem back.
  -- { "williamboman/mason.nvim", config = true },
  -- { "williamboman/mason-lspconfig.nvim" },
  -- { "hrsh7th/nvim-cmp" },
  -- { "hrsh7th/cmp-nvim-lsp" },
  -- { "L3MON4D3/LuaSnip" },
}

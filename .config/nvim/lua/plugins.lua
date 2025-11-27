return {
  -- LSP plumbing
  { "williamboman/mason.nvim", config = true },
  { "williamboman/mason-lspconfig.nvim" },
  { "neovim/nvim-lspconfig" },

  -- Completion
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "L3MON4D3/LuaSnip" },

  -- Treesitter (better syntax/indent)
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

  -- Nice-to-have Rust UX (debugging, hover actions, runnables)
  { "mrcjkb/rustaceanvim" }, -- successsor to rust-tools.nvim

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
  { "nvim-lualine/lualine.nvim" },

}

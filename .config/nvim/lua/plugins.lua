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

  -- File tabs: click to switch, x or middle-click to close, right-click to split.
  {
    "akinsho/bufferline.nvim",
    config = function()
      local function close_buffer(bufnr)
        if vim.bo[bufnr].modified then
          vim.notify("Save this file before closing it (:w).", vim.log.levels.WARN)
          return
        end
        vim.cmd.bdelete(bufnr)
      end
      _G.DotfilesToggleFiles = function()
        require("nvim-tree.api").tree.toggle()
      end
      require("bufferline").setup({
        options = {
          mode = "buffers",
          show_buffer_icons = false,
          buffer_close_icon = "x",
          close_icon = "x",
          modified_icon = "*",
          left_trunc_marker = "<",
          right_trunc_marker = ">",
          close_command = close_buffer,
          middle_mouse_command = close_buffer,
          right_mouse_command = "vertical sbuffer %d",
          custom_areas = {
            left = function()
              return { { text = "%@v:lua.DotfilesToggleFiles@ Files %X" } }
            end,
          },
        },
      })
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    keys = {
      { "<leader>e", "<cmd>NvimTreeToggle<CR>", desc = "Toggle file explorer" },
    },
    -- Also available immediately through the clickable Files label.
    lazy = false,
    opts = {
      hijack_netrw = false, -- Already disabled in init.lua.
      disable_netrw = true,
      view = { width = 32 },
      update_focused_file = { enable = true },
      renderer = {
        -- Plain labels work with your existing terminal font.
        icons = {
          show = { file = false, folder = false, folder_arrow = true, git = false },
          glyphs = { folder = { arrow_closed = ">", arrow_open = "v" } },
        },
      },
    },
  },

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

return {
  "rose-pine/neovim",
  name = "rose-pine",
  config = function()
    require("rose-pine").setup({
      variant = "dawn",
      dark_variant = "dawn"
    })
    vim.cmd("colorscheme rose-pine")
  end
}

-- return {}-- 

-- return {
--   "catppuccin/nvim",
--   name = "catppuccin",
--   config = function()
--     require("catpuccin").setup({
--       flavour = "auto",
--       transparent_background = false
--     })
--   end,
--   priority = 1000
-- }

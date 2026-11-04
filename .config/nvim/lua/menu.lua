-- Extend Neovim's text-area popup; tab-bar right-click still opens a split.
local lsp_actions = {
  { "Hover", "textDocument/hover", "hover()" },
  { "References", "textDocument/references", "references()" },
  { "Rename", "textDocument/rename", "rename()" },
  { "Code actions", "textDocument/codeAction", "code_action()" },
  { "Format", "textDocument/formatting", "format({ async = true })" },
}

for _, action in ipairs(lsp_actions) do
  local path = "PopUp." .. action[1]:gsub(" ", "\\ ")
  vim.cmd("anoremenu <silent> " .. path .. " <Cmd>lua vim.lsp.buf." .. action[3] .. "<CR>")
end

vim.cmd([[
  anoremenu <silent> PopUp.Find\ project\ file <Cmd>lua require('search').files()<CR>
  anoremenu <silent> PopUp.Search\ project\ text <Cmd>lua require('search').text()<CR>
  anoremenu <silent> PopUp.Git.Preview\ change <Cmd>Gitsigns preview_hunk<CR>
  anoremenu <silent> PopUp.Git.Reset\ change <Cmd>Gitsigns reset_hunk<CR>
  anoremenu <silent> PopUp.Git.Blame\ line <Cmd>Gitsigns blame_line<CR>
]])

vim.api.nvim_create_autocmd("MenuPopup", {
  group = vim.api.nvim_create_augroup("dotfiles-popup", { clear = true }),
  callback = function()
    for _, action in ipairs(lsp_actions) do
      local enabled = #vim.lsp.get_clients({ bufnr = 0, method = action[2] }) > 0
      local path = "PopUp." .. action[1]:gsub(" ", "\\ ")
      vim.cmd("amenu " .. (enabled and "enable " or "disable ") .. path)
    end
    local git_enabled = vim.b.gitsigns_head ~= nil
    vim.cmd("amenu " .. (git_enabled and "enable " or "disable ") .. "PopUp.Git")
  end,
})

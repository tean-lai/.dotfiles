local M = {}

local function project_root()
  return vim.fs.root(0, ".git") or vim.fn.getcwd()
end

function M.files()
  require("telescope.builtin").find_files({
    cwd = project_root(),
    find_command = { "rg", "--files", "--hidden", "--glob", "!.git" },
  })
end

function M.text()
  require("telescope.builtin").live_grep({
    cwd = project_root(),
    additional_args = { "--hidden", "--glob", "!.git" },
  })
end

return M

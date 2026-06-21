local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local dotfiles = augroup("dotfiles", { clear = true })

autocmd("TextYankPost", {
  group = dotfiles,
  desc = "Highlight yanked text",
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
  end,
})

autocmd("BufEnter", {
  group = dotfiles,
  desc = "Do not auto-wrap long lines in code-like filetypes",
  pattern = { "*.lua", "*.rs", "*.go", "*.ts", "*.tsx", "*.js", "*.jsx", "*.py", "*.sh", "*.yaml", "*.yml", "*.json", "*.md" },
  callback = function()
    vim.opt_local.wrap = false
  end,
})

autocmd("BufEnter", {
  group = dotfiles,
  desc = "Wrap prose filetypes",
  pattern = { "*.md", "*.txt" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true
  end,
})

autocmd("BufWritePre", {
  group = dotfiles,
  desc = "Remove trailing whitespace before saving",
  pattern = { "*.lua", "*.rs", "*.go", "*.ts", "*.tsx", "*.js", "*.jsx", "*.py", "*.sh", "*.yaml", "*.yml", "*.json" },
  callback = function()
    local save_cursor = vim.fn.winsaveview()
    vim.cmd([[keeppatterns %s/\s\+$//e]])
    vim.fn.winrestview(save_cursor)
  end,
})

autocmd("FileType", {
  group = dotfiles,
  desc = "Markdown editor defaults",
  pattern = "markdown",
  callback = function()
    vim.opt_local.spell = true
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true
    vim.opt_local.textwidth = 100
  end,
})

autocmd("FileType", {
  group = dotfiles,
  desc = "Shell editor defaults",
  pattern = { "sh", "bash", "zsh" },
  callback = function()
    vim.opt_local.shiftwidth = 2
    vim.opt_local.tabstop = 2
    vim.opt_local.softtabstop = 2
  end,
})

autocmd("VimEnter", {
  group = dotfiles,
  desc = "Open directories with the file manager",
  callback = function()
    if vim.fn.isdirectory(vim.fn.argv(0)) == 1 and vim.fn.argc(-1) == 1 then
      vim.cmd("Oil " .. vim.fn.fnameescape(vim.fn.argv(0)))
    end
  end,
})

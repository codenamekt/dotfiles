local map = vim.keymap.set

-- General.
map("n", "<leader>w", "<cmd>write<cr>", { desc = "Save buffer" })
map("n", "<leader>q", "<cmd>quit<cr>", { desc = "Quit" })
map("n", "<leader>Q", "<cmd>qa!<cr>", { desc = "Quit all without saving" })
map("n", "<leader>n", "<cmd>enew<cr>", { desc = "New buffer" })

-- Window navigation.
map("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Move to lower window" })
map("n", "<C-k>", "<C-w>k", { desc = "Move to upper window" })
map("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })
map("n", "<leader><C-h>", "<cmd>vsplit<cr>", { desc = "Vertical split" })
map("n", "<leader><C-v>", "<cmd>split<cr>", { desc = "Horizontal split" })
map("n", "<leader>-", "<cmd>resize -3<cr>", { desc = "Shrink window height" })
map("n", "<leader>+", "<cmd>resize +3<cr>", { desc = "Grow window height" })
map("n", "<leader>_", "<cmd>vertical resize -3<cr>", { desc = "Shrink window width" })
map("n", "<leader>=", "<cmd>vertical resize +3<cr>", { desc = "Grow window width" })

-- Better movement and selection.
map("n", "J", "mzJ`z", { desc = "Join lines without moving cursor" })
map("v", "J", ":m '>+1<cr>gv=gv", { desc = "Move selected lines down" })
map("v", "K", ":m '<-2<cr>gv=gv", { desc = "Move selected lines up" })
map("v", "<", "<gv", { desc = "Indent selected lines left" })
map("v", ">", ">gv", { desc = "Indent selected lines right" })
map("n", "<leader>y", '"+y', { desc = "Yank to system clipboard" })
map("v", "<leader>y", '"+y', { desc = "Yank selection to system clipboard" })

-- Search and diagnostics.
map("n", "<leader><space>", "<cmd>nohlsearch<cr>", { desc = "Clear search highlight" })
map("n", "<leader>sd", vim.diagnostic.setloclist, { desc = "Diagnostics quickfix" })

-- Buffers.
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Previous buffer" })
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })
map("n", "<leader>bd", "<cmd>bdelete<cr>", { desc = "Delete buffer" })

-- Toggle helpful UI.
map("n", "<leader>uf", function()
  vim.opt_local.foldenable = not vim.opt_local.foldenable:get()
end, { desc = "Toggle fold enable" })
map("n", "<leader>uw", function()
  vim.opt_local.wrap = not vim.opt_local.wrap:get()
end, { desc = "Toggle wrap" })
map("n", "<leader>us", function()
  vim.opt_local.spell = not vim.opt_local.spell:get()
end, { desc = "Toggle spellcheck" })

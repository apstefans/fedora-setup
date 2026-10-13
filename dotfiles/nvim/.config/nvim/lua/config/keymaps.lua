vim.keymap.set("n", "<leader>tt", function()
  vim.cmd("botright 12split")
  vim.cmd("terminal")
end, {desc = "Open terminal at bottom"})

-- Move directly from terminal to editor
vim.keymap.set("t", "<C-k>", [[<C-\><C-n><C-w>k]],
  { desc = "Terminal to editor" })

-- Move from editor to terminal
vim.keymap.set("n", "<C-j>", "<C-w>j",
  { desc = "Move to window below" })

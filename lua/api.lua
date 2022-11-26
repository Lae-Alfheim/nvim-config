local cmd = vim.api.nvim_command

-- Enabels Spell Check in txt, markdown, and latex files
vim.api.nvim_create_autocmd(
    { "BufRead", "BufNewFile" },
    { pattern = { "*.txt", "*.md", "*.tex" }, command = "setlocal spell" }
)

-- vim: tw=80

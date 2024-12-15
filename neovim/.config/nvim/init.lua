require("config.lazy")

vim.opt.number = true
vim.opt.background = "dark"
vim.opt.cursorline = true
vim.opt.smartindent = true
vim.opt.ignorecase = true
vim.opt.scrolloff = 3
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.termguicolors = true

-- p will paste clipboard
vim.opt.clipboard = "unnamedplus"

vim.opt.list = true

-- terminal setup
vim.opt.shell = "nu"
vim.api.nvim_create_autocmd("TermOpen", {
    pattern = "*",
    callback = function()
        vim.wo.number = false
        vim.cmd("startinsert")
        vim.keymap.set('n', 'q', ':q<CR>', { buffer = true })
    end
})
vim.keymap.set('n', '<leader>t', function()
    vim.cmd('botright split | resize 30% | terminal')
end, { desc = "Open terminal in vertical split" })
vim.keymap.set('t', '<C-\\>', [[<C-\><C-n>]], { desc = "Exit terminal mode with Ctrl-\\" })

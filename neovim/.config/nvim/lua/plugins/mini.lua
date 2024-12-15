return {
    {
        'echasnovski/mini.nvim',
        version = false,
        config = function()
            require('mini.statusline').setup()
            require('mini.icons').setup()
            require('mini.files').setup()

            vim.keymap.set("n", "<leader>mf", require('mini.files').open, { desc = "Open Mini File Explorer" })
        end
    },
}

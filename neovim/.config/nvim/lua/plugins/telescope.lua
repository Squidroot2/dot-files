return {
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8',
        dependencies = { 'nvim-lua/plenary.nvim', { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' } },
        config = function()
            require('telescope').setup {
                pickers = {
                    find_files = {
                        theme = "ivy",
                    },
                    live_grep = {
                        theme = "ivy",
                    }
                },
                extensions = {
                    fzf = {}
                }
            }
            require('telescope').load_extension('fzf')

            -- Find Help
            vim.keymap.set("n", "<space>fh", require('telescope.builtin').help_tags, { desc = "Fuzzy Find Help" })
            -- Find Files
            vim.keymap.set("n", "<space>ff", require('telescope.builtin').find_files, { desc = "Fuzzy Find File" })
            vim.keymap.set("n", "<leader>fs", require('telescope.builtin').live_grep,
                { desc = "Find String (Live Grep} )" })
        end
    }
}

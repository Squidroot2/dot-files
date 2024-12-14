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
                    }
                },
                extensions = {
                    fzf = {}
                }
            }
            require('telescope').load_extension('fzf')

            -- Find Help
            vim.keymap.set("n", "<space>fh", require('telescope.builtin').help_tags)
            -- Find Files
            vim.keymap.set("n", "<space>ff", require('telescope.builtin').find_files)
        end
    }
}

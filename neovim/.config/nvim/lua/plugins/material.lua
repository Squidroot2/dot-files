return {{
    'marko-cerovac/material.nvim',
    lazy = false,
    priority = 1000,
    config = function()
        -- Set the theme style (Options: 'darker', 'lighter', 'oceanic', 'palenight', 'deep ocean')
        vim.g.material_style = "deep ocean"

        vim.cmd("colorscheme material")
    end
}}

return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        opts = {
            transparent_background = true,
        },
        config = function ()
            vim.cmd.colorscheme "catppuccin-mocha"
        end
    },
    {
        'freddiehaddad/feline.nvim',
        opts = {},
        config = function(_, opts)
            local ctp_feline = require('catppuccin.groups.integrations.feline')
            ctp_feline.setup()
            require('feline').setup({
                components = ctp_feline.get(),
            })
            require('feline').winbar.setup()       -- to use winbar
            require('feline').statuscolumn.setup() -- to use statuscolumn
        end
    }
}

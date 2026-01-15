return {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
        'nvim-lua/plenary.nvim'
    },
    config = function()
        require('telescope').setup({})

        local telescope = require('telescope')
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>ff', builtin.find_files, {desc = "project [f]ind [f]iles "})
        vim.keymap.set('n', '<leader>fb', builtin.buffers, {desc = "project [f]ind [b]uffers "})
        vim.keymap.set('n', '<C-p>', builtin.git_files, {desc = "Search git files "})
        vim.keymap.set('n', '<leader>rs', function()
            builtin.grep_string({ search = vim.fn.input("Search > "), additional_args = { "-i" } })
        end)
        vim.keymap.set('n', '<leader>ds', function()
            builtin.grep_string({ search = vim.fn.input("Search (includes hidden files) > "),  additional_args = { "--hidden", "-i" }})
        end)
        vim.keymap.set('n', '<leader>es', function()
            builtin.grep_string({ search = vim.fn.input("Exact search > "),  additional_args = { "--hidden", "--only-matching" }})
        end)
    end
}



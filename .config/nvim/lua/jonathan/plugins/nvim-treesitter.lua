return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local treesitter = require("nvim-treesitter.configs")
    treesitter.setup({
      highlight = {
        enable = true,
      },
      indent = {
        enable = true,
      },
      ensure_installed = {
                "bash",
                "dockerfile",
                "gitignore",
                "go",
                "gomod",
                "gowork",
                "gosum",
                "html",
                "java",
                "json",
                "lua",
                "make",
                "markdown",
                "markdown_inline",
                "toml",
                "vim",
                "vimdoc",
                "xml",
                "yaml",
            },
        })
    end,
}

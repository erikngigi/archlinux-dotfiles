local options = {
    ensure_installed = {
        "awk",
        "bash",
        "bibtex",
        "c",
        "cmake",
        "dockerfile",
        "git_config",
        "git_rebase",
        "gitattributes",
        "gitcommit",
        "html",
        "javascript",
        "json",
        "latex",
        "lua",
        "luadoc",
        "make",
        "markdown",
        "markdown_inline",
        "printf",
        "nginx",
        "passwd",
        "python",
        "toml",
        "scss",
        "sql",
        "terraform",
        "vim",
        "vimdoc",
        "yaml",
    },

    highlight = {
        enable = true,
        use_languagetree = true,
    },

    indent = { enable = true },
}

require("nvim-treesitter.configs").setup(options)

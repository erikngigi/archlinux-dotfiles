local options = {
    formatters_by_ft = {
        bash = { "shfmt" },
        gitcommit = { "trim_whitespace" },
        lua = { "stylua" },
        python = { "ruff" },
        terraform = { "terraform_fmt" },
        tf = { "terraform_fmt" },
    },
    formatters = {
        -- Python
        -- ruff = {
        --     prepend_args = {
        --         "--line-length",
        --         "120",
        --     },
        -- },
        shfmt = {
            prepend_args = {
                "-i",
                "2",
                "-bn",
                "-ci",
            },
        },
    },
    format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 500,
        lsp_fallback = true,
    },
}

return options

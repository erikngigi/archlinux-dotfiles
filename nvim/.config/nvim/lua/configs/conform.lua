local options = {
    formatters_by_ft = {
        css = { "prettierd" },
        dockerfile = { "dockerfmt" },
        html = { "prettierd" },
        javascript = { "prettierd" },
        lua = { "stylua" },
        markdown = { "prettierd" },
        python = {
            "ruff_fix",
            "ruff_format",
        },
        scss = { "prettierd" },
        sh = { "shfmt" },
        terraform = { "terraform_fmt" },
        tf = { "terraform_fmt" },
        yaml = { "yamlfmt" },
    },
    formatters = {
        dockerfmt = {
            command = "dockerfmt",
            prepend_args = {
                "-i",
                "4",
            },
            stdin = true,
        },
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
        timeout_ms = 5000,
        lsp_fallback = true,
    },
}

return options

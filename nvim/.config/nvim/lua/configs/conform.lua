local options = {
    formatters_by_ft = {
        css = { "prettier" },
        dockerfile = { "dockerfmt" },
        hcl = { "terraform_fmt" },
        html = { "prettier" },
        javascript = { "prettier" },
        lua = { "stylua" },
        make = { "mbake" },
        markdown = { "prettier" },
        python = { "black" },
        scss = { "prettier" },
        sh = { "shfmt" },
        terraform = { "terraform_fmt" },
        ["terraform-vars"] = { "terraform_fmt" },
        tex = { "tex-fmt" },
        tf = { "terraform_fmt" },
        yaml = { "yamlfmt" },
    },
    formatters = {
        black = {
            prepend_args = {
                "--fast",
                "--line-length",
                "150",
            },
        },
        dockerfmt = {
            command = "dockerfmt",
            prepend_args = {
                "-i",
                "4",
            },
            stdin = true,
        },
        mbake = {
            command = "mbake",
            args = { "format", "$FILENAME" },
            stdin = false,
        },
        shfmt = {
            prepend_args = {
                "-i",
                "2",
                "-bn",
                "-ci",
            },
        },
        prettier = {
            prepend_args = {
                "--printWidth=150",
                "--tabWidth=2",
                "--singleQuote=true",
                "--trailingComma=all",
            },
        },
    },
    format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 5000,
        lsp_fallback = false,
    },
}

return options

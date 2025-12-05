local lint = require("lint")

lint.linters_by_ft = {
    dockerfile = { "hadolint" },
    html = { "htmlhint" },
    javascript = { "eslint_d" },
    lua = { "luacheck" },
    make = { "checkmake" },
    markdown = { "proselint" },
    -- python = { "ruff" },
    python = { "flake8" },
    sh = { "shellcheck" },
    scss = { "stylelint" },
    terraform = { "tflint" },
    tex = { "vale" },
}

lint.linters.luacheck.args = {
    unpack(lint.linters.luacheck.args),
    "--globals",
    "love",
    "vim",
}

lint.linters.hadolint.args = {
    unpack(lint.linters.hadolint.args),
    "--format=gcc",
    "--failure-threshold=warning",
    "--ignore=DL3008,DL3009", -- ignore specific rules
}

lint.linters.flake8.args = {
    unpack(lint.linters.flake8.args),
    "--max-line-length=150",
    "--ignore=E203,W503,E501",
    "--statistics",
}

lint.linters.shellcheck.args = {
    unpack(lint.linters.shellcheck.args),
    "--severity=style",
    "--enable=all",
}

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
    callback = function()
        lint.try_lint()
    end,
})

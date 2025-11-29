local lint = require("lint")

lint.linters_by_ft = {
    bash = { "shellcheck" },
    lua = { "luacheck" },
    python = { "ruff" },
    sh = { "shellcheck" },
    terraform = { "tflint" },
}

lint.linters.luacheck.args = {
    unpack(lint.linters.luacheck.args),
    "--globals",
    "love",
    "vim",
}

lint.linters.flake8.args = {
    unpack(lint.linters.flake8.args),
    "--max-line-length=150",
    "--ignore=E203,W503,E501",
    "--statistics",
}

lint.linters.shellcheck.args = {
    unpack(lint.linters.shellcheck.args),
    "--severity=warning",
    "--format=gcc",
}

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
    callback = function()
        lint.try_lint()
    end,
})

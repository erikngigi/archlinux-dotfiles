local lint = require("lint")

lint.linters_by_ft = {
    dockerfile = { "hadolint" },
    html = { "htmlhint" },
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
    "--severity=warning",
    "--format=gcc",
    "--shell=bash",
    "--disable=SC2086,SC2181",
}

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
    callback = function()
        lint.try_lint()
    end,
})

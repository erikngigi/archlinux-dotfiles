local null_ls = require("null-ls")

local sources = {
    null_ls.builtins.diagnostics.terraform_validate,
}

null_ls.setup({
    sources = sources,
})

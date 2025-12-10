local null_ls = require("null-ls")

-- Diagnostics
local diagnostics = {
    null_ls.builtins.diagnostics.terraform_validate.with({
        filetypes = { "hcl", "terraform", "terraform-vars", "tf" },
    }),
}

local sources = {}
for _, diagnostic in ipairs(diagnostics) do
    table.insert(sources, diagnostic)
end

null_ls.setup({
    sources = sources,
})

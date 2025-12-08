require("nvchad.options")

-- add yours here!

local o = vim.o

-- Indenting
o.shiftwidth = 4
o.tabstop = 4
o.softtabstop = 4

-- vim.diagnostic.config({
--     virtual_text = false,
--     virtual_lines = {
--         only_current_line = true, -- Only show diagnostics on the current line
--     },
-- })

vim.diagnostic.config({
    virtual_text = {
        prefix = "●", -- Custom symbol before message
        format = function(diagnostic)
            return diagnostic.message
        end,
    },
    -- virtual_lines = {
    --     current_line = true, -- Show on current line only
    --     only_current_line = true, -- Stricter: only show when line is current
    -- },
    signs = true, -- Show E/W icons in left gutter
    underline = true, -- Underline problematic code
    update_in_insert = false, -- Don't update diagnostics while typing
    severity_sort = true, -- Sort by severity (errors first)
})

vim.filetype.add({
    extension = {
        tf = "terraform",
        tfvars = "terraform-vars",
    },
})

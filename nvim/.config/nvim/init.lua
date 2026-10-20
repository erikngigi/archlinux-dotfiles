vim.g.base46_cache = vim.fn.stdpath("data") .. "/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
    local repo = "https://github.com/folke/lazy.nvim.git"
    vim.fn.system({ "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath })
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require("configs.lazy")

-- load plugins
require("lazy").setup({
    {
        "NvChad/NvChad",
        lazy = false,
        branch = "v2.5",
        import = "nvchad.plugins",
    },

    { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require("options")
require("autocmds")

vim.schedule(function()
    require("mappings")
end)

local orig_convert = vim.lsp.util.convert_input_to_markdown_lines
vim.lsp.util.convert_input_to_markdown_lines = function(input, contents)
    local result = orig_convert(input, contents)
    if result then
        for i, line in ipairs(result) do
            result[i] = line:gsub("<code>(.-)</code>", "`%1`")
                :gsub("<b>(.-)</b>", "**%1**")
                :gsub("<strong>(.-)</strong>", "**%1**")
                :gsub("<br%s*/?>", "\n")
                :gsub("<[^<>]+>", "") -- Strip any remaining stray tags
        end
    end
    return result
end

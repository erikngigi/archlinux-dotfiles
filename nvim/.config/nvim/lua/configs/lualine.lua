local M = {}

-- List LSP clients for current buffer (modern API)
local function lsp_clients()
    local clients = vim.lsp.get_clients({ bufnr = 0 })
    local names = {}

    for _, client in ipairs(clients) do
        -- skip null-ls if installed
        if client.name ~= "null-ls" then
            table.insert(names, client.name)
        end
    end

    return " : " .. (#names > 0 and table.concat(names, ", ") or "none")
end

-- Formatters from Conform.nvim
local function conform_formatters()
    local ok, conform = pcall(require, "conform")
    if not ok then
        return " : none"
    end

    local available = conform.list_formatters()
    if not available or #available == 0 then
        return " : none"
    end

    local names = {}
    for _, f in ipairs(available) do
        table.insert(names, f.name)
    end

    return " : " .. table.concat(names, ",")
end

-- Linters from nvim-lint
local function lint_linters()
    local ok, lint = pcall(require, "lint")
    if not ok then
        return " : none"
    end

    local ft = vim.bo.filetype
    local linters = lint.linters_by_ft[ft] or {}

    if #linters == 0 then
        return " : none"
    end

    return " : " .. table.concat(linters, ",")
end

-- Python environment detector
local function python_env()
    local ft = vim.bo.filetype
    if ft ~= "python" then
        return ""
    end

    -- Check for virtual environment
    local venv = os.getenv("VIRTUAL_ENV")
    if venv then
        local env_name = venv:match("([^/]+)$")
        return " : " .. env_name
    end

    -- Check for conda environment
    local conda_env = os.getenv("CONDA_DEFAULT_ENV")
    if conda_env then
        return " : " .. conda_env
    end

    return " : system"
end

function M.setup()
    -- import your custom theme
    local custom_nightfly = require("themes.nightfly_custom")

    require("lualine").setup({
        options = {
            theme = custom_nightfly,
            icons_enabled = true,
            component_separators = { left = "", right = "│" },
            -- component_separators = { left = "", right = "" },
            section_separators = { left = "", right = "" },
            -- section_separators = { left = "", right = "" },
        },

        sections = {
            lualine_a = {
                { "mode", icon = "" },
            },
            lualine_b = {
                { "branch", icon = "", color = { fg = "#32CD32" } },
                {
                    "diff",
                    colored = true,
                    symbols = { added = "+", modified = "~", removed = "-" },
                    diff_color = {
                        added = { fg = "#63f2f1", bg = "#011627" }, -- Cyan
                        modified = { fg = "#ffd900", bg = "#011627" }, -- Yellow
                        removed = { fg = "#fc514e", bg = "#011627" }, -- Red
                    },
                    "diagnostics",
                },
            },
            lualine_c = { { "filename", path = 0 } },

            -- 👇 Updated LSP + formatter + linter components
            lualine_x = {
                {
                    lsp_clients,
                    color = { fg = "#82aaff", bg = "#011627" }, -- Blue LSP
                },
                {
                    conform_formatters,
                    color = { fg = "#63f2f1", bg = "#011627" }, -- Cyan Formatter
                },
                {
                    lint_linters,
                    color = { fg = "#ffd900", bg = "#011627" }, -- Yellow Linter
                },
                {
                    python_env,
                    color = { fg = "#c792ea", bg = "#011627" }, -- Purple Python env
                    cond = function()
                        return vim.bo.filetype == "python"
                    end,
                },
                "filetype",
            },
            lualine_y = { { "progress", separator = { left = "│", right = "" } } },
            lualine_z = { "location" },
        },
    })
end

return M

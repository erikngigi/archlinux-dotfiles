local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities
local lspconfig = require("nvchad.configs.lspconfig") -- nvim 0.11

-- List of all servers configured
lspconfig.servers = {
    "lua_ls",
    -- "pyright",
}

-- List of servers configured with default config
local default_servers = { "pyright" }

-- LSPs with default config
for _, lsp in ipairs(default_servers) do
    vim.lsp.config(lsp, {
        on_attach = on_attach,
        on_init = on_init,
        capabilities = capabilities,
    })
end

-- Lua LSP custom setup
vim.lsp.config("lua_ls", {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
    settings = {
        Lua = {
            diagnostics = {
                enable = false, -- Disable all diagnostics from lua_ls
            },
            workspace = {
                library = {
                    vim.fn.expand("$VIMRUNTIME/lua"),
                    vim.fn.expand("$VIMRUNTIME/lua/vim/lsp"),
                    vim.fn.stdpath("data") .. "/lazy/ui/nvchad_types",
                    vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy",
                    "${3rd}/love2d/library",
                },
                maxPreload = 100000,
                preloadFileSize = 10000,
            },
        },
    },
})

-- Python LSP (Pyright) custom setup
-- vim.lsp.config("pyright", {
--     on_attach = on_attach,
--     on_init = on_init,
--     capabilities = capabilities,
--     settings = {
--         python = {
--             analysis = {
--                 autoSearchPaths = true,
--                 diagnosticMode = "workspace",
--                 useLibraryCodeForTypes = true,
--                 typeCheckingMode = "basic",
--             },
--         },
--     },
-- })

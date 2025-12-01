local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities
local lspconfig = require("nvchad.configs.lspconfig") -- nvim 0.11

-- List of all servers configured
lspconfig.servers = {
    "cssls",
    "docker_compose_language_service",
    "dockerls",
    "html",
    "lua_ls",
    "yamlls",
}

-- List of servers configured with default config
local default_servers = {
    "ruff",
}

-- LSPs with default config
for _, lsp in ipairs(default_servers) do
    vim.lsp.config(lsp, {
        on_attach = on_attach,
        on_init = on_init,
        capabilities = capabilities,
    })
end

vim.lsp.config("docker_compose_language_service", {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
    filetypes = { "yaml.docker-compose", "yaml" },
    root_markers = { "docker-compose.yaml", "docker-compose.yml", "compose.yaml", "compose.yml" },
})

vim.lsp.config("dockerls", {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
    settings = {
        docker = {
            languageserver = {
                diagnostics = {
                    deprecatedMaintainer = "warning",
                    directiveCasing = "warning",
                    emptyContinuationLine = "warning",
                    instructionCasing = "warning",
                    instructionCmdMultiple = "warning",
                    instructionEntrypointMultiple = "warning",
                    instructionHealthcheckMultiple = "warning",
                    instructionJSONInSingleQuotes = "warning",
                },
                formatter = {
                    ignoreMultilineInstructions = false,
                },
            },
        },
    },
    filetypes = { "dockerfile" },
    root_markers = { "Dockerfile" },
})

vim.lsp.config("html", {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
    settings = {
        html = {
            -- Auto-closing and quotes
            autoClosingTags = true,
            autoCreateQuotes = true,

            -- Completion
            completion = {
                attributeDefaultValue = "doublequotes",
            },

            -- Formatting (most important)
            format = {
                enable = true,
                contentUnformatted = "pre,code,textarea",
                extraLiners = "head, body, /html",
                indentHandlebars = false,
                indentInnerHtml = false,
                preserveNewLines = true,
                templating = false,
                unformatted = "wbr",
                unformattedContentDelimiter = "",
                wrapAttributes = "auto",
                wrapLineLength = 150,
            },

            -- Hover and suggestions
            hover = {
                documentation = true,
                references = true,
            },
            suggest = {
                html5 = true,
                hideEndTagSuggestions = false,
            },

            -- Validation
            validate = {
                scripts = true,
                styles = true,
            },

            -- Mirror cursor on matching tags
            mirrorCursorOnMatchingTag = true,
        },
    },
})

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
--                 autoImportCompletions = true,
--                 autoSearchPaths = true,
--                 diagnosticMode = "workspace",
--                 useLibraryCodeForTypes = true,
--                 typeCheckingMode = "basic",
--             },
--         },
--     },
-- })

-- Yaml LSP (Yamlls) custom setup
vim.lsp.config("yamlls", {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
    settings = {
        yaml = {
            completion = true,
            disableAdditionalProperties = false,
            format = {
                enable = true,
                printWidth = 120,
                proseWrap = "preserve",
                singleQuote = false,
            },
            hover = true,
            maxItemsComputed = 5000,
            schemaStore = {
                enable = true,
                url = "https://www.schemastore.org/api/json/catalog.json",
            },
            schemas = {
                "https://raw.githubusercontent.com/compose-spec/compose-go/master/schema/compose-spec.json",
            },
        },
    },
})

-- Python LSP (Ruff) custom setup
-- vim.lsp.config("ruff", {
--     on_attach = on_attach,
--     on_init = on_init,
--     capabilities = capabilities,
--     init_options = {
--         settings = {
--             lineLength = 50,
--             targetVersion = "py310",
--             select = { "E", "W", "F", "I" },
--             ignore = {},
--             fixAll = true,
--             showSyntaxErrors = true,
--         },
--     },
-- })
--
-- vim.lsp.enable("ruff")

local lspconfig = require("lspconfig")

-- Intelephense LSP settings
lspconfig.intelephense.setup({
	settings = {
		intelephense = {
			environment = {
				includePaths = { "/usr/include/php" }, -- Adjust if needed
			},
			files = {
				maxSize = 5000000, -- Increase max file size (in bytes) if needed
				associations = { "*.php", "*.phtml" },
			},
			stubs = {
				"apache",
				"bcmath",
				"bz2",
				"calendar",
				"Core",
				"curl",
				"date",
				"dom",
				"fileinfo",
				"filter",
				"gd",
				"gettext",
				"hash",
				"iconv",
				"intl",
				"json",
				"libxml",
				"mbstring",
				"mcrypt",
				"mysql",
				"mysqli",
				"openssl",
				"pdo",
				"pdo_mysql",
				"pdo_sqlite",
				"Phar",
				"readline",
				"Reflection",
				"session",
				"SimpleXML",
				"soap",
				"sockets",
				"SPL",
				"sqlite3",
				"standard",
				"tokenizer",
				"xml",
				"xmlreader",
				"xmlwriter",
				"zip",
				"zlib",
			},
			diagnostics = {
				enable = true,
				undefinedTypes = false,
				undefinedFunctions = false,
				undefinedConstants = false,
				undefinedVariables = false,
			},
		},
	},
})

-- YAML LSP with Hugo schema
lspconfig.yamlls.setup({
	settings = {
		redhat = {
			telemetry = { enabled = false }, -- disable telemetry
		},
		yaml = {
			completion = true, -- enable completion
			hover = true, -- enable hover info
			validate = true, -- enable validation
			format = {
				enable = true, -- allow formatting
				singleQuote = true, -- prefer single quotes
				printWidth = 100, -- wrap lines at 100 chars
			},
			schemaStore = {
				enable = true,
				url = "https://www.schemastore.org/api/json/catalog.json",
			},
			schemas = {
				-- Map schema URLs to file patterns
				["https://schemastore.org/hugo.json"] = "hugo.yaml",
				["https://schemastore.org/hugo-theme.json"] = "theme.yaml",
			},
			customTags = {
				"!Ref scalar",
				"!Sub scalar",
				"!GetAtt scalar", -- useful for AWS CloudFormation/SAM
			},
		},
	},
})

-- lspconfig.terraformls.setup({
-- settings = {
--     terraform = {
--         languageServer = {
--             enable = true,
--             ignoreSingleFileWarning = true, -- suppress warnings for child modules
--             args = { "serve" },
--         },
--         validation = {
--             enableEnhancedValidation = true,
--         },
--         experimentalFeatures = {
--             prefillRequiredFields = true,
--             validateOnSave = true,
--         },
--         codelens = {
--             referenceCount = true, -- inline references for resources/variables
--         },
--     },
-- },
-- Root detection: prefer .terraform, fallback to main.tf or provider.tf
--     root_dir = lspconfig.util.root_pattern(".terraform", "main.tf", "provider.tf")
-- })

-- Lunarvim formatters
local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
	{ name = "ruff" },
	{ name = "stylua" },
	{ name = "shfmt" },
	{ name = "stylelint" },
	{
		name = "prettierd",
		filetypes = {
			-- Web / App languages
			"javascript",
			"typescript",

			-- Styling
			"css",
			"scss",

			-- Markup
			"html",
			"markdown",

			-- Config / scripting
			"lua",
		},
		args = {
			"--print-width",
			"150",
			"--tab-width",
			"4",
			"--trailing-comma",
			"es5",
		},
	},
	{
		name = "terraform_fmt",
		filetypes = {
			"tf",
			"tfvars",
			"terraform",
		},
	},
	{
		name = "phpcsfixer",
		filetypes = {
			"php",
		},
	},
	{
		name = "yamlfmt",
		filetypes = {
			"yml",
			"yaml",
		},
	},
	{
		name = "latexindent",
		filetypes = {
			"tex",
			"latex",
		},
	},
})

local linters = require("lvim.lsp.null-ls.linters")
linters.setup({
	{
		name = "shellcheck",
		args = { "--severity", "warning" },
	},
	{ name = "terraform_validate", filetypes = { "tf", "tfvars", "terraform" } },
	{ name = "ruff", filetypes = { "python" } },
	{ name = "eslint_d", filetypes = { "typescript", "typescriptreact" } },
	{
		name = "hadolint",
		filetypes = {
			"docker-compose.yml",
		},
	},
	{ name = "trivy", filetypes = { "dockerfile" } },
	{
		name = "phpcs",
		args = {
			"--starnard=/home/eric/.config/lvim/lua/user/lspsettings/phpcs.xml",
		},
		filetypes = {
			"php",
		},
	},
	{
		name = "yamllint",
		args = {
			"-c",
			"/home/eric/.config/lvim/lua/user/lspsettings/yaml-config",
		},
		filetypes = {
			"yml",
			"yaml",
		},
	},
	{
		name = "vale",
		filetypes = {
			"tex",
			"latex",
		},
	},
})

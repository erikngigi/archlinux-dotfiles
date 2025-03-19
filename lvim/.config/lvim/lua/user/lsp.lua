-- Intelephense LSP settings
local lspconfig = require("lspconfig")
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

local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
	{ name = "ruff" },
	{ name = "stylua" },
	{ name = "shfmt" },
	{ name = "stylelint" },
	{
		name = "prettierd",
		---@usage arguments to pass to the formatter
		-- these cannot contain whitespace
		-- options such as `--line-width 80` become either `{"--line-width", "80"}` or `{"--line-width=80"}`
		---@usage only start in these filetypes, by default it will attach to all filetypes it supports
		filetypes = {
			"markdown",
			"sql",
			"lua",
			"typescript",
			"javascript",
			"javascriptreact",
			"typescriptreact",
			"html",
			"css",
			"scss",
		},
	},
	{
		name = "djlint",
		filetypes = {
			"html",
			"htmldjango",
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
		name = "goimports",
		filetypes = {
			"go",
		},
	},
})

local linters = require("lvim.lsp.null-ls.linters")
linters.setup({
	{
		name = "shellcheck",
		args = { "--severity", "warning" },
	},
	-- { name = "flake8", args = { "--ignore=E203", "--line-length=120" }, filetypes = { "python" } },
	{ name = "terraform_validate", filetypes = { "tf", "tfvars", "terraform" } },
	{ name = "ruff", filetypes = { "python" } },
	{ name = "eslint_d", filetypes = { "typescript", "typescriptreact" } },
	{
		name = "hadolint",
		filetypes = {
			"docker-compose.yml",
		},
	},
	{
		name = "djlint",
		filetypes = {
			"html",
			"htmldjango",
		},
	},
	{
		name = "phpcs",
		args = {
			"--starnard=/home/eric/.config/lvim/lua/user/lspsettings/phpcs.xml",
		},
		filetypes = {
			"php",
		},
	},
	-- {
	--   name = "yamllint",
	--   args = {
	--     "-c",
	--     "/home/eric/.config/lvim/lua/user/lspsettings/yaml-config",
	--   },
	--   filetypes = {
	--     "yml",
	--     "yaml",
	--   },
	-- },
	{
		name = "staticcheck",
		filetypes = {
			"go",
		},
	},
})

local code_actions = require("lvim.lsp.null-ls.code_actions")
code_actions.setup({
	{
		name = "ltrs",
	},
})

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
	{ name = "djlint", filetypes = {
		"html",
		"htmldjango",
	} },
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
})

local linters = require("lvim.lsp.null-ls.linters")
linters.setup({
	{
		name = "shellcheck",
		args = { "--severity", "warning" },
	},
	-- { name = "flake8", args = { "--ignore=E203", "--line-length=120" }, filetypes = { "python" } },
	{ name = "terraform_validate", filetypes = { "tf", "tfvars", "terraform" } },
	-- { name = "ruff", filetypes = { "python" } },
	{ name = "eslint_d", filetypes = { "typescript", "typescriptreact" } },
	{
		name = "hadolint",
		filetypes = { "yml" },
		root_pattern = { "docker-compose.yaml", "docker-compose.yml", "compose.yaml", "compose.yml" },
	},
	{ name = "djlint", filetypes = {
		"html",
		"htmldjango",
	} },
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
})

local code_actions = require("lvim.lsp.null-ls.code_actions")
code_actions.setup({
	{
		name = "ltrs",
	},
})

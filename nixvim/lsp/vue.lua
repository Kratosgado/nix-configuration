local lspconfig = require("lspconfig")
local vue_language_server_path =
"/home/kratosgado/.npm-packages/lib/node_modules/@vue/language-server"                                  -- Adjust this path

lspconfig.volar.setup({
	init_options = {
		plugins = {
			{
				name = "@vue/typescript-plugin",
				location = vue_language_server_path,
				languages = { "vue" },
				configNamespace = "typescript",
				enableForWorkspaceTypeScriptVersions = true,
			},
		},
		hybridMode = false,
	},
	filetypes = { "vue", "javascript", "javascriptreact", "typescript", "typescriptreact" },
	settings = {
		-- Volar specific settings can go here
	},
})

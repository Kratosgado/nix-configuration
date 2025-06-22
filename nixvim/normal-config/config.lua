require("neorg").setup({
	load = {
		["core.defaults"] = {},
		["core.concealer"] = {},
		["core.neorgcmd"] = {},
		["core.dirman"] = {
			config = {
				workspaces = {
					notes = "~/notes",
				},
				default_workspace = "notes",
			},
		},
	},
})
vim.g.db_ui_use_nerd_fonts = 1

require("lspconfig").ts_ls.setup({})

-- Setup vtsls with vue support
-- lspconfig.vtsls.setup({
-- 	filetypes = { "typescript", "javascript", "vue" },
-- 	settings = {
-- 		vtsls = {
-- 			tsserver = {
-- 				globalPlugins = {
-- 					{
-- 						name = "@vue/typescript-plugin",
-- 						location = vue_plugin_path,
-- 						languages = { "vue" },
-- 						configNamespace = "typescript",
-- 						enableForWorkspaceTypeScriptVersions = true,
-- 					},
-- 				},
-- 			},
-- 		},
-- 	},
-- })
vim.wo.foldlevel = 99
vim.wo.conceallevel = 2

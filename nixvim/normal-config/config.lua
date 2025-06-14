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

-- local lspconfig = require("lspconfig")

-- lspconfig.volar.setup({
-- 	-- add filetypes for typescript, javascript and vue
-- 	filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
-- 	init_options = {
-- 		vue = {
-- 			-- disable hybrid mode
-- 			hybridMode = true,
-- 		},
-- 	},
-- 	on_new_config = function(new_config, new_root_dir)
-- 		local lib_path = vim.fs.find("node_modules/typescript/lib", { path = new_root_dir, upward = true })[1]
-- 		if lib_path then
-- 			new_config.init_options.typescript.tsdk = lib_path
-- 		end
-- 	end,
-- })
-- local vue_plugin_path = vim.fn.stdpath("data")
-- .. "/nix/store/34nab311z94dnbhrnijpkkrdrw8v10h2-vue-language-server-2.2.8/lib/node_modules/@vue/language-server"

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

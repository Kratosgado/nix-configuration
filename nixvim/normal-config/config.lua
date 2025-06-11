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

-- sqls configurations
require("lspconfig").sqls.setup({
	on_attach = function(client, bufnr)
		require("sqls").on_attach(client, bufnr) -- require sqls.nvim
	end,
	settings = {
		sqls = {
			connections = {
				{
					driver = "postgresql",
					dataSourceName = "host=127.0.0.1 port=5432 user=kratosgado password=28935617 dbname=stealth sslmode=disable",
				},
			},
		},
	},
})

-- require("lspconfig").volar.setup({
-- 	init_options = {
-- 		typescript = {
-- 			-- replace with your global TypeScript library path
-- 			tsdk = "/path/to/node_modules/typescript/lib",
-- 		},
-- 	},
-- 	on_new_config = function(new_config, new_root_dir)
-- 		local lib_path = vim.fs.find("node_modules/typescript/lib", { path = new_root_dir, upward = true })[1]
-- 		if lib_path then
-- 			new_config.init_options.typescript.tsdk = lib_path
-- 		end
-- 	end,
-- })
vim.wo.foldlevel = 99
vim.wo.conceallevel = 2

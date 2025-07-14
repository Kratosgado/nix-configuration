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
vim.wo.foldlevel = 99
vim.wo.conceallevel = 2

-- require("lspconfig").ts_ls.setup({
-- 	filetypes = { "vue" },
-- })

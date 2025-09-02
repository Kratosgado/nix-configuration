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

local config = {
	cmd = {
		"jdtls",
		"-configuration",
		"/home/kratosgado/.cache/jdtls/config",
		"-data",
		"/home/kratosgado/.cache/jdtls/workspace",
		"--jvm-arg=" .. string.format(
			"-javaagent:%s",
			vim.fn.expand("/nix/store/p7pk8crxkpqsya18gk5lcmvj3xz3hgy9-lombok-1.18.36/share/java/lombok.jar")
		),
	},
	root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", "mvnw" }, { upward = true })[1]),
	-- java = {
	-- 	signatureHelp = { enabled = true },
	-- 	contentProvider = { preferred = "fernflower" }, -- Decompiler
	-- 	completion = {
	-- 		favoriteStaticMembers = {
	-- 			"org.junit.Assert.*",
	-- 			"org.junit.Assume.*",
	-- 			"org.junit.jupiter.api.Assertions.*",
	-- 			"org.junit.jupiter.api.Assumptions.*",
	-- 			"org.junit.jupiter.api.DynamicContainer.*",
	-- 			"org.junit.jupiter.api.DynamicTest.*",
	-- 		},
	-- 		filteredTypes = {
	-- 			"com.sun.*",
	-- 			"io.micrometer.shaded.*",
	-- 			"java.awt.*",
	-- 			"jdk.*",
	-- 			"sun.*",
	-- 		},
	-- 	},
	-- 	sources = {
	-- 		organizeImports = {
	-- 			starThreshold = 9999,
	-- 			staticStarThreshold = 9999,
	-- 		},
	-- 	},
	-- 	codeGeneration = {
	-- 		toString = {
	-- 			template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
	-- 		},
	-- 		hashCodeEquals = {
	-- 			useJava7Objects = true,
	-- 		},
	-- 	},
	-- 	configuration = {
	-- 		runtimes = {
	-- 			{
	-- 				name = "JavaSE-17",
	-- 				path = "/path/to/your/java-17-home",
	-- 			},
	-- 		},
	-- 	},
	-- },
}

vim.api.nvim_create_autocmd("FileType", {
	pattern = "java",
	callback = function()
		require("jdtls").start_or_attach(config)
	end,
})

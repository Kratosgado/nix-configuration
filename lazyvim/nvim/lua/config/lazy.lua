local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	spec = {
		-- add LazyVim and import its plugins
		{ "LazyVim/LazyVim", import = "lazyvim.plugins" },
		{ import = "lazyvim.plugins.extras.lang.typescript" },
		{ import = "lazyvim.plugins.extras.lang.json" },
  --
  --   { "lazyvim.plugins.extras.ai.copilot" },
  --   { "lazyvim.plugins.extras.ai.copilot-chat" },
  --   { "lazyvim.plugins.extras.coding.mini-comment" },
  -- {  "lazyvim.plugins.extras.coding.mini-surround"},
  -- {  "lazyvim.plugins.extras.coding.nvim-cmp"},
  -- {  "lazyvim.plugins.extras.coding.yanky"},
  -- {  "lazyvim.plugins.extras.editor.dial"},
  -- {  "lazyvim.plugins.extras.editor.fzf"},
  -- {  "lazyvim.plugins.extras.editor.mini-diff"},
  -- {  "lazyvim.plugins.extras.editor.mini-files"},
  -- {  "lazyvim.plugins.extras.editor.mini-move"},
  -- {  "lazyvim.plugins.extras.formatting.prettier"},
  -- {  "lazyvim.plugins.extras.lang.cmake"},
  -- {  "lazyvim.plugins.extras.lang.docker"},
  -- {  "lazyvim.plugins.extras.lang.git"},
  -- {  "lazyvim.plugins.extras.lang.java"},
  -- {  "lazyvim.plugins.extras.lang.json"},
  -- {  "lazyvim.plugins.extras.lang.kotlin"},
  -- {  "lazyvim.plugins.extras.lang.markdown"},
  -- {  "lazyvim.plugins.extras.lang.nix"},
  -- {  "lazyvim.plugins.extras.lang.prisma"},
  -- {  "lazyvim.plugins.extras.lang.python"},
  -- {  "lazyvim.plugins.extras.lang.svelte"},
  -- {  "lazyvim.plugins.extras.lang.tailwind"},
  -- {  "lazyvim.plugins.extras.lang.toml"},
  -- {  "lazyvim.plugins.extras.lang.typescript"},
  -- {  "lazyvim.plugins.extras.lang.yaml"},
  -- {  "lazyvim.plugins.extras.linting.eslint"},
  -- {  "lazyvim.plugins.extras.ui.mini-starter"},
  -- {  "lazyvim.plugins.extras.util.project"},
  -- {  "lazyvim.plugins.extras.util.rest"},
		-- import/override with your plugins
		{ import = "plugins" },
	},
	defaults = {
		lazy = false,
		version = false, -- always use the latest git commit
	},
	install = { missing = true, colorscheme = { "tokyonight" } },
	change_detection = { enabled = false },
	checker = {
		enabled = true, -- check for plugin updates periodically
		notify = false, -- notify on update
	}, -- automatically check for plugin updates
	performance = {
		rtp = {
			reset = false,
			-- disable some rtp plugins
			disabled_plugins = {
				"gzip",
				-- "matchit",
				-- "matchparen",
				-- "netrwPlugin",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
	dev = {
		path = vim.g.lazyPluginPath,
		pattern = { "/" },
		fallback = false,
	},
})

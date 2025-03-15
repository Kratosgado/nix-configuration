-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set(
  "n",
  "<leader>sx",
  require("telescope.builtin").resume,
  { noremap = true, silent = true, desc = "Resume last telescope session" }
)

-- vim.keymap.set({ "i", "t", "n", "v", "c", "o", "x" }, ";;", "<Esc>", { noremap = true, silent = true })
-- vim.keymap.set({ "n", "t" }, ";;", function()
-- 	if vim.fn.pumvisible() == 1 then
-- 		return "<C-e>" -- close the popup menu
-- 	else
-- 		return "<Esc>"
-- 	end
-- end, { expr = true, noremap = true, silent = true })
vim.keymap.set("n", "<leader>gg", "<Plug>(git-conflict-ours)", { desc = "Use the current buffer's changes" })
vim.keymap.set("n", "<leader>gi", "<Plug>(git-conflict-theirs)", { desc = "Use the other buffer's changes" })
vim.keymap.set("n", "<leader>ga", "<Plug>(git-conflict-both)", { desc = "Use both changes" })
vim.keymap.set("n", "<leader>g0", "<Plug>(git-conflict-none)", { desc = "Use no changes" })
vim.keymap.set("n", "<leader>gp", "<Plug>(git-conflict-prev-conflict)", { desc = "Jump to the previous conflict" })
vim.keymap.set("n", "<leader>gn", "<Plug>(git-conflict-next-conflict)", { desc = "Jump to the next conflict" })

-- In lua/config/keymaps.lua or as part of your kotlin.lua plugin file
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "kotlin", "java" },
  callback = function()
    vim.keymap.set("n", "<leader>rr", function()
      -- Run Kotlin file
      local file = vim.fn.expand("%:p")
      vim.cmd("split term://kotlin " .. file)
    end, { desc = "Run Kotlin file", buffer = true })

    vim.keymap.set("n", "<leader>rb", function()
      -- Build with Gradle
      vim.cmd("split term://./gradlew build")
    end, { desc = "Build with Gradle", buffer = true })

    vim.keymap.set("n", "<leader>rt", function()
      -- Run tests with Gradle
      vim.cmd("split term://./gradlew test")
    end, { desc = "Run tests", buffer = true })

    vim.keymap.set("n", "<leader>rf", function()
      -- Format with ktlint
      vim.cmd("!ktlint --format " .. vim.fn.expand("%:p"))
    end, { desc = "Format with ktlint", buffer = true })
  end,
})

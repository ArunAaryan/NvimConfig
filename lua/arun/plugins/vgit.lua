return {
  "tanvirtin/vgit.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    config = function()
      -- set keymaps
      local keymap = vim.keymap -- for conciseness
      local vgit = require("vgit")
      vgit.setup()

      keymap.set("n", "<leader>gdp", "<cmd>VGit buffer_diff_preview<cr>", { desc = "vgit buffer diff preview" })
      keymap.set("n", "<leader>gpdp", "<cmd>VGit project_diff_preview<cr>", { desc = "vgit project diff preview" })
    end,
  },
}

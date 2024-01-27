return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    -- Define GitSigns setup inside on_attach
    local on_attach = function()
      local keymap = vim.keymap

      -- Setup GitSigns

      -- Custom keymaps
      keymap.set(
        "n",
        "<leader>gbl",
        "<cmd>lua require('gitsigns').toggle_current_line_blame()<cr>",
        { desc = "Toggle Blame" }
      )
      keymap.set("n", "<leader>gsh", "<cmd>lua require('gitsigns').stage_hunk()<cr>", { desc = "Stage Hunk" })
      keymap.set("n", "<leader>grh", "<cmd>lua require('gitsigns').reset_hunk()<cr>", { desc = "Reset Hunk" })

      keymap.set(
        "v",
        "<leader>gsh",
        "<cmd>lua require('gitsigns').stage_hunk {vim.fn.line('.'), vim.fn.line('v')}<cr>",
        { desc = "Stage Selected Hunk" }
      )
      keymap.set(
        "v",
        "<leader>grh",
        "<cmd>lua require('gitsigns').reset_hunk {vim.fn.line('.'), vim.fn.line('v')}<cr>",
        { desc = "Reset Selected Hunk" }
      )

      keymap.set("n", "<leader>gsb", "<cmd>lua require('gitsigns').stage_buffer()<cr>", { desc = "Stage Buffer/ File" })
      keymap.set("n", "<leader>gush", "<cmd>lua require('gitsigns').stage_hunk()<cr>", { desc = "Undo Stage Hunk" })
      keymap.set("n", "<leader>grb", "<cmd>lua require('gitsigns').reset_buffer()<cr>", { desc = "Reset Buffer" })
      keymap.set("n", "<leader>gph", "<cmd>lua require('gitsigns').preview_hunk()<cr>", { desc = "Preview Hunk" })
      keymap.set(
        "n",
        "<leader>gbfl",
        "<cmd>lua require('gitsigns').blame_line({full = true})<cr>",
        { desc = "Blame Line" }
      )
      keymap.set("n", "<leader>gdt", "<cmd>lua require('gitsigns').diffthis()<cr>", { desc = "Diff This" })
      keymap.set("n", "<leader>gDt", "<cmd>lua require('gitsigns').diffthis('~')<cr>", { desc = "Diff This ~" })
      keymap.set("n", "<leader>gtd", "<cmd>lua require('gitsigns').toggle_deleted()<cr>", { desc = "Toggle Deleted" })
    end

    -- Lazy load GitSigns on attach
    require("gitsigns").setup({
      on_attach = on_attach,
      -- defer = true,
    })
  end,
}
-- map('n', '<leader>hs', gs.stage_hunk)
--     map('n', '<leader>hr', gs.reset_hunk)
--     map('v', '<leader>hs', function() gs.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
--     map('v', '<leader>hr', function() gs.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
--     map('n', '<leader>hS', gs.stage_buffer)
--     map('n', '<leader>hu', gs.undo_stage_hunk)
--     map('n', '<leader>hR', gs.reset_buffer)
--     map('n', '<leader>hp', gs.preview_hunk)
--     map('n', '<leader>hb', function() gs.blame_line{full=true} end)
--     map('n', '<leader>tb', gs.toggle_current_line_blame)
--     map('n', '<leader>hd', gs.diffthis)
--     map('n', '<leader>hD', function() gs.diffthis('~') end)
--     map('n', '<leader>td', gs.toggle_deleted)

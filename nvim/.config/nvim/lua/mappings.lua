require("nvchad.mappings")

local map = vim.keymap.set
local nomap = vim.keymap.del

-- Unset keymappings
nomap("n", "<Tab>")
nomap("n", "<S-Tab>")

-- Set new keymappings
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
-- Change mapping from Tab to Shift+l to go to next tab
map("n", "<S-l>", function()
    require("nvchad.tabufline").next()
end, { desc = "buffer goto next" })
-- Change mapping from Shift+Tab to Shift+h to go to previous tab
map("n", "<S-h>", function()
    require("nvchad.tabufline").prev()
end, { desc = "buffer goto prev" })

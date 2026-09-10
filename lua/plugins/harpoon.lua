return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    { "<leader>ha", "<cmd>lua require('harpoon'):list():add()<cr>", desc = "Harpoon add file" },
    { "<leader>he", "<cmd>lua local h = require('harpoon') h.ui:toggle_quick_menu(h:list())<cr>", desc = "Harpoon quick menu" },
    { "<leader>h1", "<cmd>lua require('harpoon'):list():select(1)<cr>", desc = "Harpoon to file 1" },
    { "<leader>h2", "<cmd>lua require('harpoon'):list():select(2)<cr>", desc = "Harpoon to file 2" },
    { "<leader>h3", "<cmd>lua require('harpoon'):list():select(3)<cr>", desc = "Harpoon to file 3" },
    { "<leader>h4", "<cmd>lua require('harpoon'):list():select(4)<cr>", desc = "Harpoon to file 4" },
  },
  config = function()
    require("harpoon"):setup()
  end,
}

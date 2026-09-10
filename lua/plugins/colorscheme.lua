return {
  "ellisonleao/gruvbox.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    italic = {
      strings = false,
      comments = false,
      operators = false,
      folds = false,
    },
  },
  config = function(_, opts)
    require("gruvbox").setup(opts)
    vim.o.background = "dark"
    vim.cmd.colorscheme("gruvbox")
  end,
}

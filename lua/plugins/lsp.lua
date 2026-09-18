return {
  { "mason-org/mason.nvim", opts = {} },
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      "mason-org/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    -- add more server names here to have mason install + enable them automatically,
    -- e.g. { "lua_ls", "pyright" }
    opts = {
      ensure_installed = { "lua_ls", "gopls" },
      -- without this, mason-lspconfig auto-enables every mason-installed server it
      -- finds (leftovers from other configs included), not just ensure_installed
      automatic_enable = { "lua_ls", "gopls" },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      vim.diagnostic.config({
        virtual_text = { severity = { min = vim.diagnostic.severity.WARN } },
        signs = true,
        underline = true,
        severity_sort = true,
        float = { border = "rounded" },
      })

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local bufnr = args.buf
          local map = function(mode, lhs, rhs, desc)
            vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
          end

          map("n", "gd", vim.lsp.buf.definition, "Goto definition")
          map("n", "gD", vim.lsp.buf.declaration, "Goto declaration")
          map("n", "gr", vim.lsp.buf.references, "Goto references")
          map("n", "gi", vim.lsp.buf.implementation, "Goto implementation")
          map("n", "K", vim.lsp.buf.hover, "Hover docs")
          map("n", "<leader>rn", vim.lsp.buf.rename, "Rename symbol")
          map("n", "<leader>ca", vim.lsp.buf.code_action, "Code action")
          map("n", "[d", vim.diagnostic.goto_prev, "Previous diagnostic")
          map("n", "]d", vim.diagnostic.goto_next, "Next diagnostic")
          map("n", "<leader>e", vim.diagnostic.open_float, "Show line diagnostics")
          map("n", "<leader>xq", vim.diagnostic.setqflist, "Diagnostics to quickfix")

          -- LSP-driven autocomplete stays off: no vim.lsp.completion.enable() call here,
          -- so no popup fires as you type. Manual completion still works via <C-x><C-o>.
        end,
      })
    end,
  },
}

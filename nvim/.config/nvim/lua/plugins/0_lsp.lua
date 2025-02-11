-- https://www.lazyvim.org/plugins/lsp#nvim-lspconfig

vim.lsp.set_log_level(vim.log.levels.OFF)

local vscode = require("util.vscode")

vim.g.autoformat = vscode.get_setting("editor.formatOnSave")

return {
  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
    },
    opts = {
      log_level = vim.log.levels.OFF,
    },
  },

  -- lsp config
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ruff = {
          init_options = {
            settings = {
              lint = {
                enable = false,
              },
            },
          },
        },
      },
    },
  },

  -- lsp settings
  {
    "tamago324/nlsp-settings.nvim",
    cmd = "LspSettings",
    opts = {
      servers = {
        vtsls = {
          enabled = false,
        },
        tsserver = {
          enabled = true,
          settings = {
            typescript = {
              inlayHints = {
                includeInlayEnumMemberValueHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayParameterNameHints = "literals",
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayVariableTypeHints = false,
                includeInlayVariableTypeHintsWhenTypeMatchesName = false,
              },
            },
            completions = {
              completeFunctionCalls = true,
            },
          },
          keys = {
            {
              "<leader>co",
              function()
                vim.lsp.buf.code_action({
                  apply = true,
                  context = {
                    only = { "source.organizeImports.ts" },
                    diagnostics = {},
                  },
                })
              end,
              desc = "Organize Imports",
            },
            {
              "<leader>cR",
              function()
                vim.lsp.buf.code_action({
                  apply = true,
                  context = {
                    only = { "source.removeUnused.ts" },
                    diagnostics = {},
                  },
                })
              end,
              desc = "Remove Unused Imports",
            },
          },
        },
        astro = {},
        somesass_ls = {
          root_dir = function(...)
            return require("lspconfig.util").root_pattern(".git")(...)
          end,
          init_options = {
            workspace = root_dir,
          },
        },
      },
      setup = {
        tsserver = function()
          return false
        end,
        vtsls = function()
          return true
        end,
      },
    },
  },

  -- stop inactive lsp clients
  {
    "zeioth/garbage-day.nvim",
    event = "VeryLazy",
    opts = {
      excluded_lsp_clients = {
        "copilot",
      },
    },
  },
}

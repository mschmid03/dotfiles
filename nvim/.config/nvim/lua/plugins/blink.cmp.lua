-- vscode like snippet keymaps
-- https://www.lazyvim.org/plugins/coding#nvim-cmp-1

return {
  {
    "saghen/blink.cmp",
    opts = {
      keymap = {
        preset = "default",
        ["<C-y>"] = {},
        ["<C-space>"] = { "select_and_accept" },
        ["<C-b>"] = { "show", "show_documentation", "hide_documentation" },
      },
    },
  },
}

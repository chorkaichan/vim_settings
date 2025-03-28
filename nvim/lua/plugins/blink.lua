return {
  "saghen/blink.cmp",
  version = "*",
  dependencies = { "L3MON4D3/LuaSnip", version = "v2.*" },
  opts = {
    snippets = {
      preset = 'luasnip',
      active = function(filter)
        if filter and filter.direction then
          return require("luasnip").jumpable(filter.direction)
        end
        return require("luasnip").in_snippet()
      end,
      jump = function(direction)
        require("luasnip").jump(direction)
      end,
    },
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
    },
  },
}

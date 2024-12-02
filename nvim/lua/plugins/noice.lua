return {
  "folke/noice.nvim",
  opts = function(_, opts)
    table.insert(opts.routes, {
      filter = {
        event = "notify",
        find = "No information available",
      },
      opts = {
        skip = true,
      },
    })

    -- Configure the hover option directly in opts
    opts.lsp = opts.lsp or {}  -- Ensure `opts.lsp` table exists
    opts.lsp.hover = opts.lsp.hover or {}  -- Ensure `opts.lsp.hover` table exists
    opts.lsp.hover.enabled = false
  end
}

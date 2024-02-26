return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    if type(opts.ensure_installed) == "table" then
      vim.list_extend(
        opts.ensure_installed,
        { "json", "json5", "jsonc", "markdown", "markdown_inline", "ron", "rust", "toml", "typescript", "tsx", "yaml" }
      )
    end
  end,
}

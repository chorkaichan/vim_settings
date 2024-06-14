return {
  "williamboman/mason.nvim",
  opts = function(_, opts)
    opts.ensure_installed = opts.ensure_installed or {}
    vim.list_extend(opts.ensure_installed, {
      "markdownlint",
      "marksman",
      "codelldb",
      "js-debug-adapter",
      "prettier",
      "blade-formatter",
      "ansible-language-server",
      "ansible-lint",
      "docker-compose-language-service",
      "dockerfile-language-server",
      "intelephense",
      "php-debug-adapter",
      "phpstan",
      "pint",
      "stylelint-lsp",
    })
  end,
}

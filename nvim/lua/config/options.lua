-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.relativenumber = false
vim.opt.shell = "/bin/bash"
vim.g.autoformat = false

vim.diagnostic.config({
  virtual_text = false
})

-- Show line diagnostics automatically in hover window
vim.o.updatetime = 250
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false
    }
)
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover, { focusable = false }
)

-- Disable Prettier autoformat by default
vim.g['prettier#autoformat'] = 0

-- Check if .prettierrc.js is readable in the current or any parent directory
local function is_prettier_config_available()
  local findfile = vim.fn.findfile('.prettierrc', '.;')
  return vim.fn.filereadable(findfile) ~= 0
end

if is_prettier_config_available() then
  print("Using prettier...")

  -- Setup autocommand for Prettier formatting on save for specified file types
  vim.api.nvim_create_autocmd('BufWritePre', {
    pattern = {'*.js', '*.jsx', '*mjs', '*.ts', '*.tsx', '*.css', '*.less', '*.scss', '*.json', '*.graphql', '*.md', '*.vue', '*.yaml', '*.html'},
    callback = function()
      vim.cmd('PrettierAsync')
    end
  })
end


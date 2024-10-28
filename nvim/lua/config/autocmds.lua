-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.api.nvim_create_autocmd("VimEnter", {
  pattern = { "*" },
  callback = function()
    -- vim.cmd("Neotree action=show")
    vim.cmd("NoNeckPain")
    vim.cmd("NoNeckPainResize 120")
  end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.ts", "*.tsx" },
  callback = function()
    vim.cmd("EslintFixAll")
  end,
})

vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
  pattern = { "*.ts", "*.tsx" },
  callback = function()
    vim.diagnostic.open_float(nil, {focus=false})
  end,
})

vim.api.nvim_create_autocmd({ "CursorHold" }, {
  pattern = { "*.ts", "*.tsx" },
  callback = function()
    vim.lsp.buf.hover()
  end,
})

-- Define an autocmd group for the blade workaround
local augroup = vim.api.nvim_create_augroup("lsp_blade_workaround", { clear = true })

-- Autocommand to temporarily change 'blade' filetype to 'php' when opening for LSP server activation
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  group = augroup,
  pattern = "*.blade.php",
  callback = function()
    vim.bo.filetype = "php"
  end,
})

-- Additional autocommand to switch back to 'blade' after LSP has attached
vim.api.nvim_create_autocmd("LspAttach", {
  pattern = "*.blade.php",
  callback = function(args)
    vim.schedule(function()
      -- Check if the attached client is 'intelephense'
      for _, client in ipairs(vim.lsp.get_active_clients()) do
        if client.name == "intelephense" and client.attached_buffers[args.buf] then
          vim.api.nvim_buf_set_option(args.buf, "filetype", "blade")
          -- update treesitter parser to blade
          vim.api.nvim_buf_set_option(args.buf, "syntax", "blade")
          break
        end
      end
    end)
  end,
})

-- make $ part of the keyword for php.
vim.api.nvim_exec(
  [[
autocmd FileType php set iskeyword+=$
]],
  false
)

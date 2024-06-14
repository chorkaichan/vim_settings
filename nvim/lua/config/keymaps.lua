-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local Util = require("lazyvim.util")
local map = Util.safe_keymap_set
local ls = require("luasnip")

map("n", "lg", ":LazyGit<CR>", { desc = "open lazygit" })
map({ "n", "x", "i" }, "<ScrollWheelUp>", "k", { desc = "scroll up with mouse wheel" })
map({ "n", "x", "i" }, "<ScrollWheelDown>", "j", { desc = "scroll down with mouse wheel" })
map("i", "<C-R>", function()
  ls.jump(1)
end, { desc = "luasnip jump", silent = true })
map("n", "bd", ":bp<bar>sp<bar>bn<bar>bd<CR>", { desc = "delete buffer" })
map({ "n", "v" }, "ch", ":CopilotChat<CR>", { desc = "open copilot chat" })

-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- im switch
local autocmd = vim.api.nvim_create_autocmd

local myAutoGroup = vim.api.nvim_create_augroup("myAutoGroup", {
  clear = true,
})

autocmd("InsertLeave", {
  group = myAutoGroup,
  callback = require("utils.im-select").macInsertLeave,
})
autocmd("InsertEnter", {
  group = myAutoGroup,
  callback = require("utils.im-select").macInsertEnter,
})
autocmd("FocusGained", {
  group = myAutoGroup,
  callback = require("utils.im-select").macFocusGained,
})
autocmd("FocusLost", {
  group = myAutoGroup,
  callback = require("utils.im-select").macFocusLost,
})

-- toggle markdown conceal
autocmd("FileType", {
  pattern = "markdown",
  command = "setlocal conceallevel=0",
})

-- close markdown spellcheck
autocmd("FileType", {
  pattern = "markdown",
  command = "setlocal nospell",
})

local function disable_diagnostics()
  vim.diagnostic.enable(false)
end

autocmd("FileType", {
  pattern = "markdown",
  callback = disable_diagnostics,
})

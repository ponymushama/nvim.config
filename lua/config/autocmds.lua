-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- 自动切换输入法，需要安装 im-select
-- https://github.com/daipeihust/im-select

local myAutoGroup = vim.api.nvim_create_augroup("myAutoGroup", {
  clear = true,
})

local autocmd = vim.api.nvim_create_autocmd
local system = vim.loop.os_uname().sysname

if system == "Darwin" then
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
end

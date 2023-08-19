-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
local myAutoGroup = vim.api.nvim_create_augroup("myAutoGroup", {
  clear = true,
})

local autocmd = vim.api.nvim_create_autocmd

local system = vim.loop.os_uname().sysname

if system == "Linux" then
elseif system == "Darwin" then
  -- 自动切换输入法，需要安装 im-select
  -- https://github.com/daipeihust/im-select
  autocmd("InsertLeave", {
    group = myAutoGroup,
    callback = require("utils.im-select").macInsertLeave,
  })
  autocmd("InsertEnter", {
    group = myAutoGroup,
    callback = require("utils.im-select").macInsertEnter,
  })
  -- 当vim获得焦点和失去焦点的时候触发
  autocmd("FocusGained", {
    group = myAutoGroup,
    callback = require("utils.im-select").macFocusGained,
  })
  autocmd("FocusLost", {
    group = myAutoGroup,
    callback = require("utils.im-select").macFocusLost,
  })
elseif system == "Windows" then
end

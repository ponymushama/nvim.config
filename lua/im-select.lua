local M = {}

-- 使用这个autocmd的条件是使用mac输入法
M.sougouIM = "com.sogou.inputmethod.sogou.pinyin"
M.rime = "im.rime.inputmethod.Squirrel.Hans"
M.defaultIM = "com.apple.keylayout.ABC"
M.leaveVimIM = M.defaultIM

M.macFocusGained = function()
  vim.cmd(":silent :!im-select" .. " " .. M.leaveVimIM)
end

M.macFocusLost = function()
  M.leaveVimIM = vim.fn.system({ "im-select" })
  vim.cmd(":silent :!im-select" .. " " .. M.rime)
end

M.macInsertLeave = function()
  vim.cmd(":silent :!im-select" .. " " .. M.defaultIM)
end

M.macInsertEnter = function()
  vim.cmd(":silent :!im-select" .. " " .. M.rime)
end

return M

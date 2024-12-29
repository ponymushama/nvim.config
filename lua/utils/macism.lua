local M = {}

M.rime = "im.rime.inputmethod.Squirrel.Hans"
M.defaultIM = "com.apple.keylayout.ABC"

M.macInsertLeave = function()
  vim.cmd(":silent :!macism" .. " " .. M.defaultIM)
end

M.macInsertEnter = function()
  vim.cmd(":silent :!macism" .. " " .. M.rime)
end

return M

-- -- remove IM switch Focus
-- M.macFocusGained = function()
--   vim.cmd(":silent :!macism" .. " " .. M.defaultIM)
-- end
-- M.macFocusLost = function()
--   M.defaultIM = vim.fn.system({ "im-select" })
--   vim.cmd(":silent :!macism" .. " " .. M.rime)
-- end

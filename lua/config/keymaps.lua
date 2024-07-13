-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    if opts.remap and not vim.g.vscode then
      opts.remap = nil
    end
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

-- Normal Mode --
-- H 行首 L 行尾
map({ "n", "x" }, "H", "v:count == 0 ? '^' : 'H'", { expr = true, silent = true })
map({ "n", "x" }, "L", "v:count == 0 ? '$' : 'L'", { expr = true, silent = true })
-- C-hjkl 切换窗口
map("n", "<C-h>", "<cmd> TmuxNavigateLeft<CR>", { desc = "Go to left window", remap = true })
map("n", "<C-j>", "<cmd> TmuxNavigateDown<CR>", { desc = "Go to lower window", remap = true })
map("n", "<C-k>", "<cmd> TmuxNavigateUp<CR>", { desc = "Go to upper window", remap = true })
map("n", "<C-l>", "<cmd> TmuxNavigateRight<CR>", { desc = "Go to right window", remap = true })
-- Move text up and down
map("n", "<A-j>", "<Esc>:m .+1<CR>==gi", { remap = true })
map("n", "<A-k>", "<Esc>:m .-2<CR>==gi", { remap = true })
-- Disable arrow keys in normal mode
vim.keymap.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')

-- Insert Mode --
-- press jk fast to exit insert mode
map("i", "jk", "<ESC>", { remap = true })
map("i", "kj", "<ESC>", { remap = true })

-- Visual Mode --
-- Stay in indent mode
map("v", "<", "<gv", { remap = true })
map("v", ">", ">gv", { remap = true })

-- Move text up and down
map("v", "<A-j>", ":m .+1<CR>==", { remap = true })
map("v", "<A-k>", ":m .-2<CR>==", { remap = true })
map("v", "p", '"_dP', { remap = true })

-- Visual Block --
-- Move text up and down
map("x", "J", ":move '>+1<CR>gv-gv", { remap = true })
map("x", "K", ":move '<-2<CR>gv-gv", { remap = true })
map("x", "<A-j>", ":move '>+1<CR>gv-gv", { remap = true })
map("x", "<A-k>", ":move '<-2<CR>gv-gv", { remap = true })

-- Search hidden files except .git --
map(
  "n",
  "<leader>ff",
  "<cmd>lua require'telescope.builtin'.find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' }})<cr>",
  { remap = true }
)

-- which-key --
local wk = require("which-key")

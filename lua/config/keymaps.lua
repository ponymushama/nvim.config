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

-- ChatGPT --
-- wk.register({
--  c = {
--    name = "ChatGPT",
--    c = { "<cmd>ChatGPT<CR>", "ChatGPT" },
--    e = { "<cmd>ChatGPTEditWithInstruction<CR>", "Edit with instruction" },
--    g = { "<cmd>ChatGPTRun grammar_correction<CR>", "Grammar Correction" },
--    t = { "<cmd>ChatGPTRun translate<CR>", "Translate" },
--    k = { "<cmd>ChatGPTRun keywords<CR>", "Keywords" },
--    d = { "<cmd>ChatGPTRun docstring<CR>", "Docstring" },
--    a = { "<cmd>ChatGPTRun add_tests<CR>", "Add Tests" },
--    o = { "<cmd>ChatGPTRun optimize_code<CR>", "Optimize Code" },
--    s = { "<cmd>ChatGPTRun summarize<CR>", "Summarize" },
--    f = { "<cmd>ChatGPTRun fix_bugs<CR>", "Fix Bugs" },
--    x = { "<cmd>ChatGPTRun explain_code<CR>", "Explain Code" },
--    r = { "<cmd>ChatGPTRun roxygen_edit<CR>", "Roxygen Edit" },
--    l = { "<cmd>ChatGPTRun code_readability_analysis<CR>", "Code Readability Analysis" },
--  },
-- }, { prefix = "<leader>" })

-- writing --

wk.register({
  m = {
    name = "writing",
    p = { "<cmd>MarkdownPreviewToggle<CR>", "MarkdownPreviewToggle" },
    z = { "<cmd>ZenMode<CR>", "ZenMode" },
    w = { "<cmd>WordCount<CR>", "WordCount" },
  },
}, { prefix = "<leader>" })

-- obsidian --

wk.register({
  o = {
    name = "Obsidian",
    o = { "<cmd>ObsidianOpen<CR>", "ObsidianOpen" },
    t = { "<cmd>ObsidianTemplate<CR>", "ObsidianTemplate" },
    l = { "<cmd>ObsidianLink<CR>", "ObsidianLink" },
    L = { "<cmd>ObsidianLinkNew<CR>", "ObsidianLinkNew" },
    f = { "<cmd>ObsidianFollowLink<CR>", "ObsidianFollowLink" },
    b = { "<cmd>ObsidianBacklink<CR>", "ObsidianBacklink" },
    s = { "<cmd>ObsidianQuickSwitch<CR>", "ObsidianQuickSwitch" },
    n = { "<cmd>ObsidianNew<CR>", "ObsidianNew" },
    d = { "<cmd>ObsidianToday<CR>", "ObsidianToday" },
  },
}, { prefix = "<leader>" })

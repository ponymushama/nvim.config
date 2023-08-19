return {
  "jackMort/ChatGPT.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    require("chatgpt").setup({
      api_key_cmd = "echo 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",
    })
  end,
}

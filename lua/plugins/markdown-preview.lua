return {
  {
    {
      "iamcco/markdown-preview.nvim",
      ft = "markdown",
      -- build = "cd app && yarn install",
      build = ":call mkdp#util#install()",
      config = function()
        vim.g.mkdp_markdown_css = "/Users/ponymushama/latex.css"
        vim.g.mkdp_highlight_css = "/Users/ponymushama/latex.css"
        vim.g.mkdp_browser = "/Applications/LibreWolf.app/"
      end,
    },
  },
}

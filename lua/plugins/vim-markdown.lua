return {
  "preservim/vim-markdown",
  config = function()
    -- disable folding
    vim.g.vim_markdown_folding_disabled = 1
    vim.g.vim_markdown_frontmatter = 0
  end,
}

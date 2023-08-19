return {
  -- add colorscheme
  {
    "sainnhe/gruvbox-material",
    -- config colorscheme
    config = function()
      vim.g.gruvbox_material_enable_italic = 1
      vim.g.gruvbox_material_background = "soft"
    end,
  },
  -- Configure LazyVim to load colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox-material",
    },
  },
}

--[[
return {
  -- add colorscheme
  {
    "sainnhe/everforest",
    -- config colorscheme
    config = function()
      vim.g.everforest_enable_italic = 1
      vim.g.everforest_background = "soft"
    end,
  },
  -- Configure LazyVim to load colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "everforest",
    },
  },
}
--]]

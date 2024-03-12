return {
  -- add colorscheme
  {
    "sainnhe/gruvbox-material",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
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

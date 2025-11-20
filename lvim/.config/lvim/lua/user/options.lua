-- =====================================
-- 🌙 LunarVim Configuration
-- =====================================

-- General settings
lvim.log.level = "warn"
lvim.colorscheme = "catppuccin-macchiato"
lvim.transparent_window = true
lvim.reload_config_on_save = true

-- LSP (Language Server Protocol)
lvim.lsp.automatic_servers_installation = false

-- =====================================
-- 🔧 Builtin Plugin Configurations
-- =====================================

-- UI and appearance
lvim.builtin.alpha.active = false
lvim.builtin.illuminate.active = false
lvim.builtin.breadcrumbs.active = true
lvim.builtin.bufferline.active = true
lvim.builtin.bufferline.options.indicator.style = "none"
lvim.builtin.bufferline.options.separator_style = { "", "" }

-- Custom bufferline colors
lvim.builtin.bufferline.highlights = {
  buffer_selected = {
    fg = "#00ff00", -- selected buffer text
    bg = "#000000",
    bold = true,
    italic = false,
  },
  buffer_visible = {
    fg = "#ffffff", -- visible but not selected
    bg = "#000000",
    bold = true,
    italic = false,
  },
  buffer = {
    fg = "#ffffff", -- inactive buffer
    bg = "#000000",
    bold = true,
    italic = false,
  },
  close_button_visible = {
    fg = "#ffffff",
    bg = "#000000",
  },
  close_button_selected = {
    fg = "#800000",
    bg = "#000000",
  },
  error_selected = {
    bold = true,
    italic = false,
  },
}

-- Statusline (lualine)
lvim.builtin.lualine.style = "lvim"
lvim.builtin.lualine.options.theme = "auto"

-- File explorer (NvimTree)
lvim.builtin.nvimtree.setup.view.adaptive_size = true
lvim.builtin.nvimtree.setup.actions.open_file.quit_on_open = true

-- Project settings
lvim.builtin.project.manual_mode = true

-- File explorer (lir)
lvim.builtin.lir.show_hidden_files = true

-- Autocompletion window styling
lvim.builtin.cmp.window = {
  completion = {
    winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
  },
}

-- Debugging
lvim.builtin.dap.active = true

-- =====================================
-- 🧠 Vim Options
-- =====================================
vim.opt.wrap = true           -- Enable line wrapping
vim.opt.textwidth = 150       -- Auto line break after 150 chars
vim.opt.tabstop = 4           -- Display width of a tab character
vim.opt.shiftwidth = 4        -- Indentation width
vim.opt.softtabstop = 4       -- Tab behavior in insert mode

-- Optional extras (recommended)
vim.opt.linebreak = true      -- Wrap at word boundaries
vim.opt.expandtab = true      -- Use spaces instead of tabs

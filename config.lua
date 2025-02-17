-- doom_config - Doom Nvim user configurations file
--
-- This file contains the user-defined configurations for Doom nvim.
-- Just override stuff in the `doom` global table (it's injected into scope
-- automatically).

-- ADDING A PACKAGE
--
-- doom.use_package("EdenEast/nightfox.nvim", "sainnhe/sonokai")
-- doom.use_package({
--   "ur4ltz/surround.nvim",
--   config = function()
--     require("surround").setup({mappings_style = "sandwich"})
--   end
-- })
doom.use_package(
  -- "github/copilot.vim",
  -- "zbirenbaum/copilot.lua",
  "jspringyc/vim-word",
  "lervag/vimtex",
  "dhruvasagar/vim-table-mode",
  "voldikss/vim-translator"
)
doom.use_package({
  "zbirenbaum/copilot.lua",
  config = function()
    vim.defer_fn(function()
      require("copilot").setup({
        suggestion = {
          auto_trigger = true,
          keymap = {
            accept = "<M-l>",
            next = "<M-]>",
            prev = "<M-[>",
            dismiss = "<C-]>",
          },
        },
      })
    end, 100)
  end,
}, {
  "zbirenbaum/copilot-cmp",
  after = { "copilot.lua" },
  config = function()
    require("copilot_cmp").setup()
  end,
})
doom.use_package("rafcamlet/nvim-luapad", "m-pilia/vim-pkgbuild")
doom.use_package("Shatur/neovim-ayu")
doom.use_package({
  "ellisonleao/glow.nvim",
  config = true,
  cmd = "Glow",
})
doom.use_package("chrisbra/csv.vim")
doom.use_package({
  "akinsho/git-conflict.nvim",
  config = function()
    require("git-conflict").setup()
  end,
})
doom.use_package({
  "Vonr/align.nvim",
})
-- ADDING A KEYBIND
--
-- doom.use_keybind({
--   -- The `name` field will add the keybind to whichkey
--   {"<leader>s", name = '+search', {
--     -- Bind to a vim command
--     {"g", "Telescope grep_string<CR>", name = "Grep project"},
--     -- Or to a lua function
--     {"p", function()
--       print("Not implemented yet")
--     end, name = ""}
--   }}
-- })
doom.use_keybind({
  mode = "i",
  "cc",
  function()
    require("copilot.suggestion").accept()
  end,
  -- 'copilot#Accept("<LF>")',
  -- options = { expr = true, silent = true },
}, {
  mode = "niv",
  "qq",
  function()
    vim.cmd("q")
  end,
}, {
  mode = "niv",
  "qqq",
  function()
    vim.cmd("qall!")
  end,
}, {
  "WW",
  function()
    vim.cmd("w")
  end,
}, {
  "]<space>",
  function()
    -- add new line without leaving normal mode and back
    vim.cmd("normal! o")
  end,
}, {
  "[<space>",
  function()
    vim.cmd("normal! O")
  end,
}, {
  "dor",
  function()
    vim.cmd("diffget REMOTE")
  end,
}, {
  "dol",
  function()
    vim.cmd("diffget LOCAL")
  end,
}, {
  "dob",
  function()
    vim.cmd("diffget BASE")
  end,
}, {
  mode = "n",
  "gaa",
  function()
    local a = require("align")
    a.operator(a.align_to_char, { length = 1, reverse = true })
  end,
  { noremap = true, silent = true },
}, {
  mode = "n",
  "gaw",
  function()
    local a = require("align")
    a.operator(a.align_to_string, { is_pattern = false, reverse = true, preview = true })
  end,
  { noremap = true, silent = true },
})
-- ADDING A COMMAND
--
-- doom.use_cmd({
--   {"CustomCommand1", function() print("Trigger my custom command 1") end},
--   {"CustomCommand2", function() print("Trigger my custom command 2") end}
-- })
doom.use_cmd({
  {
    "W",
    function()
      vim.cmd("SudaWrite")
    end,
  },
  {
    "Wq",
    function()
      vim.cmd("SudaWrite")
      vim.cmd("q!")
    end,
  },
})

-- ADDING AN AUTOCOMMAND
--
-- doom.use_autocmd({
--   { "FileType", "javascript", function() print('This is a javascript file') end }
-- })

doom.indent = 2
doom.core.treesitter.settings.show_compiler_warning_message = false
doom.core.reloader.settings.reload_on_save = true
-- vim.g.copilot_no_tab_map = true
vim.g.copilot_no_tab_map = true

vim.g.tex_flavor = "xelatex"
vim.g.vimtex_quickfix_mode = 0
vim.g.vimtex_view_general_viewer = "zathura"
vim.g.vimtex_view_method = "zathura"

vim.opt.foldtext =
  "v:folddashes.substitute(getline(v:foldstart),'/\\\\*\\\\\\|\\\\*/\\\\\\|{{{\\\\d\\\\=','','g')"

vim.opt.background = "light"

doom.indent = 2 -- Sets vim.opt.shiftwith, vim.opt.softtabstop, vim.opt.tabstop to 2
doom.colorscheme = "ayu" -- Select a colorscheme
doom.disable_ex = true -- Disable Ex mode
doom.disable_macros = true -- Disable macros
doom.use_floating_win_packer = true -- Use floating window packer
doom.preserve_edit_pos = true -- Preserve the cursor position when switching buffers
doom.auto_comment = true -- Enable auto-commenting
doom.undo_dir = vim.fn.getenv("HOME") .. "/.cache/nvim/undo" -- Set the undo directory
doom.logging = "fatal"
doom.max_columns = 0
-- vim: sw=2 sts=2 ts=2 expandtab

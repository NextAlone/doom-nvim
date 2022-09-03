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
doom.use_package("github/copilot.vim", "jspringyc/vim-word", "rmehri01/onenord.nvim", "lervag/vimtex",
  "dhruvasagar/vim-table-mode", "voldikss/vim-translator")
doom.use_package("rafcamlet/nvim-luapad", "m-pilia/vim-pkgbuild")
doom.use_package("Shatur/neovim-ayu")
doom.use_package({
  "ellisonleao/glow.nvim",
  branch = "main",
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
  'copilot#Accept("<CR>")',
  options = { expr = true, silent = true },
}, {
  mode = "niv",
  "qq",
  function() vim.cmd("q!") end,
}, {
  "wq",
  function()
    vim.cmd("wq")
  end,
}, {
  "ww",
  function()
    vim.cmd("w")
  end,
}
)
-- ADDING A COMMAND
--
-- doom.use_cmd({
--   {"CustomCommand1", function() print("Trigger my custom command 1") end},
--   {"CustomCommand2", function() print("Trigger my custom command 2") end}
-- })
doom.use_cmd({
  { "W", function() vim.cmd("SudaWrite") end },
  { "Wq", function() vim.cmd("SudaWrite") vim.cmd("q!") end },
})

-- ADDING AN AUTOCOMMAND
--
-- doom.use_autocmd({
--   { "FileType", "javascript", function() print('This is a javascript file') end }
-- })

doom.indent = 2
doom.core.treesitter.settings.show_compiler_warning_message = false
doom.core.reloader.settings.reload_on_save = false
-- vim.g.copilot_no_tab_map = true
vim.g.copilot_no_tab_map = true

vim.g.tex_flavor = "xelatex"
vim.g.vimtex_quickfix_mode = 0
vim.g.vimtex_view_general_viewer = 'zathura'
vim.g.vimtex_view_method = 'zathura'

vim.opt.background = "light"

doom.indent = 2 -- Sets vim.opt.shiftwith, vim.opt.softtabstop, vim.opt.tabstop to 2
doom.colorscheme = "ayu" -- Select a colorscheme
doom.disable_ex = true -- Disable Ex mode
doom.disable_macros = true -- Disable macros
doom.use_floating_win_packer = true -- Use floating window packer
doom.preserve_edit_pos = true -- Preserve the cursor position when switching buffers
doom.auto_comment = true -- Enable auto-commenting
doom.undo_dir = "/home/nextalone/.cache/nvim/undo" -- Set the undo directory
doom.logging = "fatal"
doom.max_columns = 0
-- vim: sw=2 sts=2 ts=2 expandtab

local groovy = {}

groovy.settings = {
  --- Disables auto installing the treesitter
  --- @type boolean
  disable_treesitter = false,
  --- Treesitter grammars to install
  --- @type string|string[]
  treesitter_grammars = "java",

  --- Disables default LSP config
  --- @type boolean
  disable_lsp = false,
  --- Name of the language server
  --- @type string
  lsp_name = "jdtls",
  --- Custom config to pass to nvim-lspconfig
  --- @type table|nil
  lsp_config = nil,

  --- Disables null-ls formatting sources
  --- @type boolean
  disable_formatting = false,
  --- WARN: No package. Mason.nvim package to auto install the formatter from
  --- @type nil
  formatting_package = nil,
  --- String to access the null_ls diagnositcs provider
  --- @type string
  formatting_provider = "builtins.formatting.google_java_format",
  --- Function to configure null-ls formatter
  --- @type function|nil
  formatting_config = nil,
}

local langs_utils = require("doom.modules.langs.utils")
groovy.autocmds = {
  {
    "BufWinEnter",
    "*.groovy",
    langs_utils.wrap_language_setup("groovy", function()
      if not groovy.settings.disable_lsp then
        langs_utils.use_lsp_mason(groovy.settings.lsp_name, {
          config = groovy.settings.lsp_config,
        })
      end

      if not groovy.settings.disable_treesitter then
        langs_utils.use_tree_sitter(groovy.settings.treesitter_grammars)
      end

      if not groovy.settings.disable_formatting then
        langs_utils.use_null_ls(
          groovy.settings.diagnostics_package,
          groovy.settings.formatting_provider,
          groovy.settings.formatting_config
        )
      end
    end),
    once = true,
  },
}

return groovy

require'nvim-treesitter.configs'.setup {
  -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ensure_installed = { "javascript", "typescript", "java", "css", "lua", "scss" },
  sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
  ignore_install = { "haskell" }, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
  },
  indent = { enable = true }
}


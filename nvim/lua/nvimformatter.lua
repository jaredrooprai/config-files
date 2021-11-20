require'formatter'.setup({
  logging = false,
  filetype = {
    typescriptreact = {
       function()
          return {
            exe = "prettierd",
            args = {vim.api.nvim_buf_get_name(0)},
            stdin = true
          }
        end
    },
  }
})

function format_prettier()
   return {
     exe = "npx",
     args = {"prettier", "--stdin-filepath", vim.api.nvim_buf_get_name(0)},
     stdin = true
   }
end

require("formatter").setup({
    filetype = {
      typescriot = { format_prettier },
      typescriptreact = { format_prettier }
    }
})

vim.api.nvim_exec([[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.js,*.jsx,*.ts,*.tsx FormatWrite
augroup END
]], true)

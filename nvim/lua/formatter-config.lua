
function string.insert(str1, str2, pos)
    return str1:sub(1,pos)..str2..str1:sub(pos+1)
end

function FixFilePath (file)
  local lastBracket = string.find(file, '%]')
  local firstBracket = string.find(file, '%[')

  if not lastBracket or not firstBracket then
    return file
  end

  local newFilePath = file
  newFilePath = string.insert(newFilePath, '\\', lastBracket - 1)
  newFilePath = string.insert(newFilePath, '\\', firstBracket - 1)

  return newFilePath
end

require'formatter'.setup({
  logging = false,
  filetype = {
    typescript = {
       function()
          return {
            exe = "prettierd",
            args = {vim.api.nvim_buf_get_name(0)},
            stdin = true
          }
        end
    },
    typescriptreact = {
       function()
          return {
            exe = "prettierd",
            args = {FixFilePath(vim.api.nvim_buf_get_name(0))},
            stdin = true
          }
        end
    },
    javascript = {
       function()
          return {
            exe = "prettierd",
            args = {vim.api.nvim_buf_get_name(0)},
            stdin = true
          }
        end
    },
    javascriptreact = {
       function()
          return {
            exe = "prettierd",
            args = {vim.api.nvim_buf_get_name(0)},
            stdin = true
          }
        end
    },
    html = {
       function()
          return {
            exe = "prettierd",
            args = {vim.api.nvim_buf_get_name(0)},
            stdin = true
          }
        end
    },
    scss = {
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

vim.api.nvim_exec([[
augroup FormatAutoGroup
  autocmd!
  autocmd BufWritePost *.ts,*.tsx FormatWrite
augroup END
]], true)

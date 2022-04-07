vim.api.nvim_exec([[
  let g:startify_bookmarks = ['~/config-files/', '~/Sites/showpass-frontend', '~/Sites/web-app']
  let g:startify_change_to_vcs_root = 1
  let g:startify_lists = [{'type': 'bookmarks', 'header': ['Bookmarks']}, {'type': 'files', 'header': ['Files']}]
]], false);


vim.cmd('set shell=/bin/zsh')

if vim.g.vscode == nil then
    require("plugins")
end

require("settings")
require("mappings")

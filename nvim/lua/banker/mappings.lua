function Map(mode, shortcut, command, opts)
    opts = opts or {}
    opts.noremap = opts.noremap ~= false -- Default to `true` if not specified
    opts.silent = opts.silent ~= false -- Default to `true` if not specified
    vim.keymap.set(mode, shortcut, command, opts)
end

function Nmap(shortcut, command, opts)
    Map("n", shortcut, command, opts)
end

function Imap(shortcut, command, opts)
    Map("i", shortcut, command, opts)
end

function Vmap(shortcut, command, opts)
    Map("v", shortcut, command, opts)
end

function Cmap(shortcut, command, opts)
    Map("c", shortcut, command, opts)
end

function Tmap(shortcut, command, opts)
    Map("t", shortcut, command, opts)
end

-- yank to clipboard
Vmap("<leader>y", '"*y')

Nmap("<S-j>", "}")
Nmap("<S-k>", "{")

Vmap("<S-j>", "}")
Vmap("<S-k>", "{")

if vim.g.vscode == nil then
    Imap("jk", "<Esc>")

    -- Telescope
    local builtin = require('telescope.builtin')
    Nmap('<C-p>', builtin.find_files, {
        desc = 'Telescope find files'
    })
    Nmap('<C-f>', builtin.live_grep, {
        desc = 'Telescope live grep'
    })
    Nmap('<leader>fb', builtin.buffers, {
        desc = 'Telescope buffers'
    })
    Nmap('<leader>fh', builtin.help_tags, {
        desc = 'Telescope help tags'
    })
end


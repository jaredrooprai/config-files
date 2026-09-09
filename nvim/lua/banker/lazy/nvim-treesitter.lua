if vim.g.vscode == nil then
    return {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        lazy = false,
        build = ":TSUpdate",
        config = function()
            local treesitter = require("nvim-treesitter")
            local parsers = {"c", "lua", "vim", "vimdoc", "elixir", "javascript", "html", "python", "typescript"}

            treesitter.setup()
            treesitter.install(parsers)

            vim.api.nvim_create_autocmd("FileType", {
                pattern = {"c", "lua", "vim", "help", "elixir", "javascript", "html", "python", "typescript"},
                callback = function()
                    pcall(vim.treesitter.start)
                    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                end
            })
        end
    }
else
    return {}
end

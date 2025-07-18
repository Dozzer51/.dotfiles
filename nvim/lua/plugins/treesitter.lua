return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function ()
        local configs = require("nvim-treesitter.configs")
        configs.setup({
            ensure_installed =
                {
                    "c",
                    "cpp",
                    "lua",
                    "luadoc",
                    "vim",
                    "vimdoc",
                    "hyprlang",
                    "css",
                    "cmake",
                    "json",
                    "jsonc",
                },
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },  
        })
    end,
    opts = function ()
        vim.filetype.add({
            pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
        })
    end
}

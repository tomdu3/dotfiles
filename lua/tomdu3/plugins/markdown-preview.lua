return {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    -- build = "cd app && npm install",
    build = ":call mkdp#util#install()", -- https://github.com/kiyoon/dotfiles/blob/b506a0cfe3cdc17e7bedcde151918c797bead179/nvim/lua/user/lazy.lua#L770-L775
    init = function()
        vim.g.mkdp_filetypes = { "markdown" }

        vim.keymap.set("n", "<leader>mp", ":MarkdownPreview<CR>", {})
        vim.keymap.set("n", "<leader>ms", ":MarkdownPreviewStop<CR>", {})
        vim.keymap.set("n", "<leader>mt", ":MarkdownPreviewToggle<CR>", {})
    end,
    ft = { "markdown" },
}

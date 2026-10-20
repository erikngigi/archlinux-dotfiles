require("nvchad.autocmds")

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = {
        "*/playbooks/*.yml",
        "*/playbooks/*.yaml",
        "*/roles/*.yml",
        "*/roles/*.yaml",
        "*/inventory/*.yml",
        "*/inventory/*.yaml",
        "*/inventories/*.yml",
        "*/inventories/*.yaml",
        "*.ansible.yml",
        "*.ansible.yaml",
    },
    callback = function()
        vim.bo.filetype = "ansible"
    end,
})

local lsp_servers = {
    "lua_ls",
}

-- Enable lsp completion
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspAttach", { clear = true }),
    callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        local buf = ev.buf

        if not client then
            vim.notify("couldn't find lsp client", vim.log.levels.ERROR)
            return
        end

        if client:supports_method('textDocument/completion') then
            vim.lsp.completion.enable(true, client.id, buf, { autotrigger = false })
        end
    end,
})

vim.lsp.enable(lsp_servers)

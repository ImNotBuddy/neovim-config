local function augroup(name)
    return vim.api.nvim_create_augroup("tohsaka_" .. name, { clear = true })
end

local lsp_group = augroup("lsp")
local command_line_group = augroup("command_line")

-- Highlight text that has been yanked
vim.api.nvim_create_autocmd("TextYankPost", {
    group = augroup("highlight_yank"),
    callback = function()
        (vim.hl or vim.highlight).on_yank({
            higroup = "IncSearch", -- Default value is IncSearch
            timeout = 40, -- Default is 150
        })
    end,
})

-- Show the command line when focused
vim.api.nvim_create_autocmd({ "CmdlineEnter", "RecordingEnter" }, {
    group = command_line_group,
    callback = function()
        vim.opt.cmdheight = 1
    end,
})

-- Hide the command line when unfocused
vim.api.nvim_create_autocmd({ "CmdlineLeave", "RecordingLeave" }, {
    group = command_line_group,
    callback = function()
        vim.opt.cmdheight = 0
    end,
})

-- When the LSP client attaches to a buffer, set the keybinds
vim.api.nvim_create_autocmd("LSPAttach", {
    group = lsp_group,
    callback = function(event)
        local opts = { buffer = event.buf }

        vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, opts)

        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- Useful for C languages, takes you to the header file

        vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)

        vim.keymap.set("n", "K", function() vim.lsp.buf.hover({ border = "rounded" }) end, opts)
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help({ border = "rounded" }) end, opts)
    end,
})

-- When writing a file, remove trailing whitespace
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    group = augroup("TrimWhitespace"),
    pattern = { "*", "!*.md" },
    command = [[%s/\s\+$//e]],
})

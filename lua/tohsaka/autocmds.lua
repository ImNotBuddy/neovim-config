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

-- When the LSP client attaches to a buffer, set the keybinds. NOTE: some keybinds set in telescope
vim.api.nvim_create_autocmd("LSPAttach", {
    group = lsp_group,
    callback = function(event)
        local opts = { buffer = event.buf }
        -- vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts) -- Using the telescope version instead
        -- vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end, opts) -- Using the telescope version instead

        vim.keymap.set("n", "<leader>vd", function()
            vim.diagnostic.open_float()
        end, opts)
        vim.keymap.set("n", "K", function()
            vim.lsp.buf.hover({ border = "rounded" })
        end, opts)
        vim.keymap.set("i", "<C-h>", function()
            vim.lsp.buf.signature_help({ border = "rounded" })
        end, opts)

        vim.keymap.set("n", "gD", function()
            vim.lsp.buf.declaration()
        end, opts) -- Useful for C languages, takes you to the header file
        vim.keymap.set("n", "<F2>", function()
            vim.lsp.buf.rename()
        end, opts)

        vim.keymap.set("n", "]d", function()
            vim.diagnostic.goto_next()
        end, opts)
        vim.keymap.set("n", "[d", function()
            vim.diagnostic.goto_prev()
        end, opts)
    end,
})

-- When writing a file, remove trailing whitespace
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    group = augroup("TrimWhitespace"),
    pattern = { "*", "!*.md" },
    command = [[%s/\s\+$//e]],
})

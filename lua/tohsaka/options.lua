-- Line numbers
vim.wo.number = true -- Show line numbers
vim.o.relativenumber = true -- Make line numbers relative
vim.o.cursorline = true -- Highlight the number of the current line

-- Wrapping
vim.o.wrap = false -- Display lines as one long line
vim.o.linebreak = true -- Requires wrap to be true. Don't split words when wrapping

-- Searching
vim.o.ignorecase = true -- Case-insensitive searching
vim.o.smartcase = true -- Override ignorecase when search has capitals
vim.o.hlsearch = false -- Should the search result be highlighted
vim.o.incsearch = true -- Match as typing

-- Indentation
vim.o.autoindent = true -- Automatically copy indent from current line when starting a new one
vim.o.shiftwidth = 4 -- Spaces added for indentation
vim.o.tabstop = 4 -- Display the tab character, \t, as n spaces
vim.o.softtabstop = 4 -- Insert n spaces for a tab
vim.o.expandtab = true -- Use spaces and not the tab character
vim.o.hlsearch = false -- Should the search result be highlighted

-- Files
vim.o.swapfile = false -- Swap file in case of a crash
vim.o.undofile = true -- Save your undo history for when the file is reopened
vim.o.undolevels = 10000 -- How much to save

-- Command line and status line
vim.o.cmdheight = 0 -- Commandline height
vim.o.showmode = false -- Show the current mode
--vim.o.laststatus = 3 -- How the status line should behave, 3 means the bar is global for all splits

-- Folding
vim.o.foldlevel = 99 -- Fold level, set to 99 to open them by default
vim.o.foldmethod = "indent" -- How folding should happen- overriden in treesitter.lua
vim.o.foldtext = "getline(v:foldstart) . '...'" -- What the foldtext looks like

-- Misc
vim.o.mouse = "a" -- Enable mouse mode
vim.o.clipboard = "unnamedplus" -- Use the system clipboard
vim.o.termguicolors = true -- Set termguicolors to enable highlight groups
vim.g.netrw_banner = 0 -- Hides the netrw help banner
vim.o.scrolloff = 8 -- Min number of lines to keep above and below the cursor
vim.o.sidescrolloff = 8 -- Keep n lines left and right from the cursor
vim.o.confirm = true -- If performing an operation that would fail due to unsaved changes in the buffer (like `:q`), instead raise a dialog asking if you wish to save the current file(s)
vim.o.signcolumn = "yes" -- Reserve space for a column on the left (stops the diagnostic icons changing line number padding)
vim.o.updatetime = 250 -- Time (in ms) before the cursor is considered idle

-- Diagnostics
vim.diagnostic.config({
    severity_sort = true,
    float = {
        border = "rounded",
        source = true,
        header = "",
    },
    update_in_insert = true,
    underline = {
        severity = vim.diagnostic.severity.ERROR,
    },
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "󰅚 ",
            [vim.diagnostic.severity.WARN] = "󰀪 ",
            [vim.diagnostic.severity.INFO] = "󰋽 ",
            [vim.diagnostic.severity.HINT] = "󰌶 ",
        },
    },
})

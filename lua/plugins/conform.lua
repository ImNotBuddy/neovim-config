return {
	"stevearc/conform.nvim",
	lazy = true,
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>fc",
			function()
				require("conform").format({ lsp_format = "fallback" })
			end,
			mode = { "n", "x" },
		},
		{
			"<leader>fd",
			function()
				vim.g.auto_format = not vim.g.auto_format
				local status = vim.g.auto_format and "On" or "Off"

				vim.notify("Format on-save is now " .. status)
			end,
			mode = { "n", "x" },
		},
	},
	opts = {
		format_on_save = function(bufnr)
			if not vim.g.auto_format then
				return
			end
			return { timeout_ms = 500, lsp_format = "fallback" }
		end,
		formatters_by_ft = {
			lua = { "stylua" },
            cpp = { "clang_format" },
			rust = { "rustfmt", lsp_format = "fallback" },
		},
	},
}

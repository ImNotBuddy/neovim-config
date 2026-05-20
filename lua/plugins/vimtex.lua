return {
	"lervag/vimtex",
	lazy = false, -- we don"t want to lazy load VimTeX
	init = function()
		vim.g.vimtex_quickfix_mode = 2
		-- vim.g.vimtex_compiler_latexmk_engines = {
		--     ["_"] = "-lualatex -shell-escape"
		-- }
		-- vim.g.vimtex_compiler_latexmk = {
		-- 	options = {
		-- 		"-pdf",
		-- 		"-outdir=build",
		-- 	},
		-- }
		vim.g.vimtex_view_method = "zathura"

		-- In normal mode chance \alpha to α for example
		vim.opt.conceallevel = 2
		vim.opt.concealcursor = "nc"
		vim.g.vimtex_syntax_conceal = {
			accents = 1,
			cites = 1,
			fancy = 1,
			greek = 1,
			ligatures = 1,
			math_bounds = 0,
			math_delimiters = 0,
			math_fracs = 0,
			math_super_sub = 0,
			math_symbols = 1,
			sections = 0,
			spacing = 0,
			styles = 1,
			texTabularChar = 1,
		}
    end,
}

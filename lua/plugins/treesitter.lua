return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter").setup({
				install_dir = vim.fn.stdpath("data") .. "/site",
			})

			require("nvim-treesitter").install({ "lua", "c", "markdown" })

			vim.api.nvim_create_autocmd("FileType", {
				pattern = { "lua", "c", "markdown" },
				callback = function()
					vim.treesitter.start()
				end,
			})

			vim.api.nvim_create_autocmd("FileType", {
				pattern = { "lua", "c" },
				callback = function()
					vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
				end,
			})
		end,
	}

}

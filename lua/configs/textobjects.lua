require("nvim-treesitter.configs").setup({
	textobjects = {
		select = {
			enable = true,
			lookahead = true,
			keymaps = {
				["a="] = {
					query = "@assignment.outer",
					desc = "Select outer part of an assignment",
				},
				["i="] = {
					query = "@assignment.inner",
					desc = "Select inner part of an assignment",
				},
				["l="] = {
					query = "@assignment.lhs",
					desc = "Select left hand side of an assignment",
				},
				["r="] = {
					query = "@assignment.rhs",
					desc = "Select right hand side of an assignment",
				},

				["aa"] = {
					query = "@parameter.outer",
					desc = "Select outer part of a parameter/argument",
				},
				["ia"] = {
					query = "@parameter.inner",
					desc = "Select inner part of a parameter/argument",
				},

				["al"] = {
					query = "@loop.outer",
					desc = "Select outer part of a loop",
				},
				["il"] = {
					query = "@loop.inner",
					desc = "Select inner part of a loop",
				},

				["af"] = {
					query = "@call.outer",
					desc = "Select outer part of a function call",
				},
				["if"] = {
					query = "@call.inner",
					desc = "Select inner part of a function call",
				},

				["am"] = {
					query = "@function.outer",
					desc = "Select outer part of a method/function body",
				},
				["im"] = {
					query = "@function.inner",
					desc = "Select inner part of a method/function body",
				},

				["ac"] = {
					query = "@class.outer",
					desc = "Select outer part of a class",
				},
				["ic"] = {
					query = "@class.inner",
					desc = "Select outer part of a class",
				},
			},
		},
		move = {
			enable = true,
			set_jumps = true,
			goto_next_start = {
				["]f"] = {
					query = "@call.outer",
					desc = "Next function call start",
				},
				["]m"] = {
					query = "@function.outer",
					desc = "Next method/function body start",
				},
				["]c"] = { query = "@class.outer", desc = "Next class start" },
				["]i"] = {
					query = "@conditional.outer",
					desc = "Next conditional start",
				},
				["]l"] = { query = "@loop.outer", desc = "Next loop start" },
			},
			goto_next_end = {
				["]F"] = {
					query = "@call.outer",
					desc = "Next function call end",
				},
				["]M"] = {
					query = "@function.outer",
					desc = "Next method/function body end",
				},
				["]C"] = { query = "@class.outer", desc = "Next class end" },
				["]I"] = {
					query = "@conditional.outer",
					desc = "Next conditional end",
				},
				["]L"] = { query = "@loop.outer", desc = "Next loop end" },
			},
			goto_previous_start = {
				["[f"] = {
					query = "@call.outer",
					desc = "Previous function call start",
				},
				["[m"] = {
					query = "@function.outer",
					desc = "Previous method/function body start",
				},
				["[c"] = {
					query = "@class.outer",
					desc = "Previous class start",
				},
				["[i"] = {
					query = "@conditional.outer",
					desc = "Previous conditional start",
				},
				["[l"] = { query = "@loop.outer", desc = "Previous loop start" },
			},
			goto_previous_end = {
				["[F"] = {
					query = "@call.outer",
					desc = "Previous function call end",
				},
				["[M"] = {
					query = "@function.outer",
					desc = "Previous method/function body end",
				},
				["[C"] = { query = "@class.outer", desc = "Previous class end" },
				["[I"] = {
					query = "@conditional.outer",
					desc = "Previous conditional end",
				},
				["[L"] = { query = "@loop.outer", desc = "Previous loop end" },
			},
		},
	},
})


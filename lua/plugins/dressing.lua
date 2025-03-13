return {
	"stevearc/dressing.nvim",
	opts = {
		input = {
			enabled = true,
			default_prompt = "Input",
			trim_prompt = true,
			start_in_insert = true,
		},
		select = {
			enabled = true,
			backend = { "fzf_lua", "fzf" },
			trim_prompt = true,
			telescope = nil,
		}
	}
}

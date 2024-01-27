local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope files" })
vim.keymap.set("n", "<leader>fg", builtin.git_files, { desc = "Telescope git files" })
vim.keymap.set("n", "<leader>fw", builtin.live_grep, { desc = "Telescope grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope Buffers" })


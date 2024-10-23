-- Passa alla finestra a sinistra (nvim-tree) con <leader>h
vim.api.nvim_set_keymap('n', '<C-Left>', '<C-w>h', { noremap = true, silent = true })

-- Passa alla finestra a destra (editor) con <leader>l
vim.api.nvim_set_keymap('n', '<C-Right>', '<C-w>l', { noremap = true, silent = true })

-- Apri chiudi il file explorer
vim.api.nvim_set_keymap('n', '<leader>e', ':NvimTreeToggle | NvimTreeFocus<CR>', { noremap = true, silent = true })

local cmp = require'cmp'
cmp.setup({
	mapping = {
		['<Down>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),  -- Seleziona l'opzione successiva
		['<Up>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),  -- Seleziona l'opzione precedente
		['<C-Space>'] = cmp.mapping.complete(),  -- Attiva il completamento manualmente
		['<CR>'] = cmp.mapping.confirm({ select = true }),  -- Seleziona l'opzione attualmente evidenziata
	}
})

-- mapping for BarBar
-- muoversi tra i buffer
vim.api.nvim_set_keymap('n', '<C-PageUP>', '<Cmd>BufferPrevious<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-PageDown>', '<Cmd>BufferNext<CR>', {noremap = true, silent = true})

-- spostare i buffer
vim.api.nvim_set_keymap('n', '<C-A-PageUP>', '<Cmd>BufferMovePrevious<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-A-PageDown>', '<Cmd>BufferMoveNext<CR>', {noremap = true, silent = true})

-- Mappatura per chiudere il buffer corrente con Alt + c
vim.api.nvim_set_keymap('n', '<A-c>', '<Cmd>BufferClose<CR>', {noremap = true, silent = true})

-- Passa alla finestra a sinistra (nvim-tree) con Control + freccia sx
vim.api.nvim_set_keymap('n', '<C-Left>', '<C-w>h', { noremap = true, silent = true })

-- Passa alla finestra a destra (editor) con Control + freccia dx
vim.api.nvim_set_keymap('n', '<C-Right>', '<C-w>l', { noremap = true, silent = true })

-- Apri chiudi il file explorer Control + e
vim.api.nvim_set_keymap('n', '<C-e>', ':NvimTreeToggle | NvimTreeFocus<CR>', { noremap = true, silent = true })

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
-- muoversi tra i buffer Control + Alt + PageUp/PageDown
vim.api.nvim_set_keymap('n', '<C-A-PageUP>', '<Cmd>BufferPrevious<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-A-PageDown>', '<Cmd>BufferNext<CR>', {noremap = true, silent = true})

-- spostare i buffer Control + Shift + PageUP/PageDown
vim.api.nvim_set_keymap('n', '<C-S-PageUP>', '<Cmd>BufferMovePrevious<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-S-PageDown>', '<Cmd>BufferMoveNext<CR>', {noremap = true, silent = true})

-- Mappatura per chiudere il buffer corrente con Alt + w
vim.api.nvim_set_keymap('n', '<A-w>', '<Cmd>BufferClose<CR>', {noremap = true, silent = true})

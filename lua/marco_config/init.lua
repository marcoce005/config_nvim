-- Line vim style on the bottom
require('hardline').setup {}

-- file manager
require('nvim-tree').setup{
	update_focused_file = {
        enable = true,  -- Abilita l'aggiornamento del file attivo
        update_cwd = true,  -- Aggiorna la directory di lavoro attiva
    },
}

-- personal remap
require('marco_config.remap')

-- autopairs of parenteses etc...
require('nvim-autopairs').setup{}

-- numers on the left
vim.cmd("set number")

-- tab size
vim.cmd("set tabstop=4")
vim.cmd("set shiftwidth=4")

-- Funzione per aprire Nvim Tree e mantenere il focus sul buffer attivo
vim.cmd([[autocmd VimEnter * NvimTreeOpen | NvimTreeClose]])

-- config for line of indetation
require("ibl").setup()

-- color theme
require('fluoromachine').setup {
    glow = false,  -- Abilita il glow per un effetto neon
    theme = 'retrowave',  -- Tema principale (puoi aggiustare con altri temi inclusi)
}

vim.cmd[[colorscheme fluoromachine]]

-- config treesitter for better color theme
require('nvim-treesitter.configs').setup {
    -- Specifica i linguaggi che vuoi installare o usa "all" per tutti
    ensure_installed = { "lua", "python", "javascript", "html", "css", "c", "bash", "svelte" },

    -- Abilita l'evidenziazione della sintassi
    highlight = {
        enable = true,          -- Abilita l'evidenziazione
        additional_vim_regex_highlighting = false,  -- Disabilita la vecchia sintassi di Vim
    },

    -- Opzioni aggiuntive (facoltative)
    indent = {
        enable = true           -- Abilita indentazione basata su Treesitter
    }
}

-- configurazione toggleterm
require("toggleterm").setup{
	-- Configurazione del terminale
	-- Qui puoi configurare le tue preferenze
	size = 15,
	open_mapping = [[<C-\>]], -- Mappa per aprire/chiudere il terminale
	shade_filetypes = {},
	shading_factor = 2,
	direction = 'float', -- O 'horizontal', 'vertical'
	float_opts = {
		border = 'curved',
	}
}

-- Configurazione di Mason per installare LSP
require("mason").setup()
require("mason-lspconfig").setup()

-- Configurazione di Pyright come Language Server per Python
-- install with sudo npm install -g pyright
local lspconfig = require('lspconfig')

lspconfig.pyright.setup{}

-- Autocompletamento con nvim-cmp
local cmp = require'cmp'
cmp.setup({
	sources = {
		{ name = 'nvim_lsp' },
	},
	mapping = {
		['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
		['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
		['<C-Space>'] = cmp.mapping.complete(),
		['<CR>'] = cmp.mapping.confirm({ select = true }),
	}
})

-- Configurazione del Language Server per TypeScript (usa ts_ls)
-- install with sudo npm install -g typescript typescript-language-server
local lspconfig = require('lspconfig')

lspconfig.ts_ls.setup({
	on_attach = function(_, bufnr)
		local opts = { noremap=true, silent=true }
		vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)  -- Vai alla definizione
		vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)        -- Mostra la documentazione
		vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts) -- Rinomina
		vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)     -- Riferimenti
		vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts) -- Azioni di codice
	end
})

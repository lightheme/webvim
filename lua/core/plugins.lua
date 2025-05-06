
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({

	{ 'nvim-treesitter/nvim-treesitter' },
	{ 'pantharshit00/vim-prisma' },

	{ 'neovim/nvim-lspconfig' },
	{
        'barrett-ruth/import-cost.nvim',
        build = 'pwsh install.ps1 yarn',
        config = true
    },

	-- Autocomplete support
	{ 'hrsh7th/cmp-nvim-lsp' },
	{ 'hrsh7th/cmp-buffer' },
	{ 'hrsh7th/cmp-path' },
	{ 'hrsh7th/cmp-cmdline' },
	{ 'hrsh7th/nvim-cmp' },
	{ 'prettier/vim-prettier' },
	{
    "williamboman/mason.nvim",
    config = function()
    	require("mason").setup()
      local registry = require("mason-registry")
      if not registry.is_installed("prettier") then
      	registry.get_package("prettier"):install()
    	end
    end
  },

  {
		'nvim-telescope/telescope.nvim', tag = '0.1.8',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},

	{
	  'nvimdev/dashboard-nvim',
	  event = 'VimEnter',
	  config = function()
	    require('dashboard').setup {}
	  end,
	  dependencies = { {'nvim-tree/nvim-web-devicons'}}
	},

	{ 'Eandrju/cellular-automaton.nvim' },
	{ 'norcalli/nvim-colorizer.lua' },

	{
    "VPavliashvili/json-nvim"
	},

	{
	    'nvim-lualine/lualine.nvim',
	    dependencies = { 'nvim-tree/nvim-web-devicons' }
	},

	{
	  "folke/todo-comments.nvim",
	  dependencies = { "nvim-lua/plenary.nvim" }
	},

	{ "ellisonleao/gruvbox.nvim", priority = 1000 , config = true, opts = ...},
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
 
	{
	    'numToStr/Comment.nvim',
	    lazy = false,
	},

	{'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons'},

	{
	  "nvim-tree/nvim-tree.lua",
	  version = "*",
	  lazy = false,
	  dependencies = {
	    "nvim-tree/nvim-web-devicons",
	  },
	  config = function()
	    require("nvim-tree").setup {}
	  end,
	},

	{
	    'dense-analysis/ale',
	    config = function()
	        local g = vim.g
	
	        g.ale_linters = {
	        	python = {'mypy'},
	            lua = {'lua_language_server'}
	        }
	    end
	},

	{ 'RRethy/vim-illuminate' },

	{
	    "vhyrro/luarocks.nvim",
	    priority = 1001,
	    opts = {
	        rocks = { "magick" },
	    },
	},

	{
	 "folke/trouble.nvim",
	 dependencies = { "nvim-tree/nvim-web-devicons" },
	},

	{'akinsho/toggleterm.nvim', version = "*", config = true},

	{
	  "folke/which-key.nvim",
	  event = "VeryLazy",
	  init = function()
	    vim.o.timeout = true
	    vim.o.timeoutlen = 300
	  end
	},

	{ 'echasnovski/mini.nvim', version = false },
	{ 'echasnovski/mini.move', version = false },
	{ 'echasnovski/mini.pairs', version = false },
	{
    "jose-elias-alvarez/typescript.nvim",
    dependencies = { "neovim/nvim-lspconfig" },
  },

  {
    "windwp/nvim-ts-autotag",
    config = true,
    ft = { "javascriptreact", "typescriptreact" },
  },


  {
    "cakebaker/scss-syntax.vim",
    ft = { "scss", "sass" },
  },


  {
    "nvim-tree/nvim-web-devicons",
    opts = {
      override = {
        ts = {
          icon = "",
          color = "#519aba",
          name = "TypeScript",
        },
        tsx = {
          icon = "",
          color = "#519aba",
          name = "TSX",
        },
        jsx = {
          icon = "",
          color = "#f0db4f",
          name = "JSX",
        },
        scss = {
          icon = "",
          color = "#cd6799",
          name = "SCSS",
        },
      },
    },
  },


  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "rafamadriz/friendly-snippets",
      config = function()
        require("luasnip.loaders.from_vscode").lazy_load()
      end,
    },
  },

  -- Дополнительные инструменты
  {
    "axelvc/template-string.nvim",
    config = true,
    event = "InsertEnter",
    ft = { "typescript", "javascript", "typescriptreact", "javascriptreact" },
  }
})

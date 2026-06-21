local opt = vim.opt

-- Leader keys.
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Appearance.
opt.background = "dark"
opt.cursorline = true
opt.lazyredraw = false
opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes"
opt.termguicolors = true
opt.showmode = false

-- Layout and scrolling.
opt.hidden = true
opt.mouse = "a"
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.splitbelow = true
opt.splitright = true
opt.wrap = false

-- Search.
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.inccommand = "split"
opt.hlsearch = true

-- Indentation.
opt.autoindent = true
opt.breakindent = true
opt.expandtab = true
opt.linebreak = true
opt.shiftwidth = 2
opt.shiftround = true
opt.smartindent = true
opt.softtabstop = 2
opt.tabstop = 2

-- Editing behavior.
opt.backspace = "indent,eol,start"
opt.clipboard = "unnamedplus"
opt.completeopt = "menu,menuone,noselect"
opt.confirm = true
opt.swapfile = false
opt.undofile = true
opt.undolevels = 10000
opt.updatetime = 200
opt.writebackup = false

-- Visual niceties.
opt.list = true
opt.listchars = "tab:»·,trail:·,extends:»,precedes:«,nbsp:␣"
opt.fillchars = "horiz:━,horizup:┅,horizdown:┅,vert:┃,diff:╱,msgsep:‾,foldopen:,foldsep:▏,foldclose:"

-- Folding is powered by Treesitter when available, but disabled by default.
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
opt.foldmethod = "expr"
opt.foldenable = false

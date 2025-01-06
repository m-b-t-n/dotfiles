-- Global Settings
vim.opt.title = true
vim.opt.number = true
vim.opt.tabstop = 8
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.showmatch = true
vim.opt.matchtime = 1
-- vim.opt.t_Co = 256
vim.opt.clipboard = 'unnamed,unnamedplus'
vim.opt.list = true
vim.opt.listchars = 'tab:> ,trail:_,nbsp:%,extends:>,precedes:<'
vim.opt.cursorline = true
vim.opt.laststatus = 2
vim.opt.background = 'dark'
vim.opt.incsearch = true
vim.opt.ruler = true
vim.opt.syntax = 'on'
vim.opt.hidden = true
vim.opt.writebackup = false
vim.opt.undofile = false
vim.opt.backup = false
vim.opt.cmdheight = 2
vim.opt.fileformats = 'unix,dos,mac'
vim.opt.fileencodings = 'utf-8,sjis,cp932,euc-jp'
vim.opt.wildmenu = true
vim.opt.signcolumn = 'yes'
vim.opt.ambiwidth = 'double'
vim.opt.nrformats = 'unsigned,bin,hex'
vim.opt.helplang = 'ja,en'

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.g.editorconfig = true

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- add your plugins here
    { import = "plugins" },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  -- install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})

require("lualine").setup()
require("core.neovide")
require("core.firenvim")


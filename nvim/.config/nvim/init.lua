-- Neovim entrypoint.
-- Lazy.nvim installs plugins on first run under ~/.local/share/nvim/lazy/.

require("config.options")
require("config.lazy")
require("config.keymaps")
require("config.autocmds")

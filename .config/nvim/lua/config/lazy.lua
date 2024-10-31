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

-- Define the CompileAndRun function
function CompileAndRun()
  local filetype = vim.bo.filetype
  local filename = vim.fn.expand("%:p")

  -- Define commands for different languages
  local commands = {
    v = "v run " .. filename,
    go = "go run " .. filename,
    python = "python3 " .. filename,
    javascript = "node " .. filename,
    typescript = "ts-node " .. filename,
  }

  -- Check if there's a command for the current file type
  if commands[filetype] then
    vim.cmd("!clear") -- Clear the terminal before running
    vim.cmd("!" .. commands[filetype])
  else
    print("No run command for filetype: " .. filetype)
  end
end

-- Set keybinding to run the function
vim.api.nvim_set_keymap("n", "<leader>r", ":lua CompileAndRun()<CR>", { noremap = true, silent = true })

-- Lazy setup
require("lazy").setup({
  spec = {
    -- add LazyVim and import its plugins
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    -- import/override with your plugins
    { "github/copilot.vim" },
    { import = "plugins" },
  },
  defaults = {
    lazy = false,
    version = false, -- always use the latest git commit
  },
  install = { colorscheme = { "tokyonight", "habamax" } },
  checker = {
    enabled = true, -- check for plugin updates periodically
    notify = false, -- notify on update
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})

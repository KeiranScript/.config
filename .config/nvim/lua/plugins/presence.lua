return {
  "andweeb/presence.nvim",
  event = "VeryLazy",
  config = function()
    require("presence").setup({
      auto_update = true,
      neovim_image_text = "The One True Text Editor",
      main_image = "neovim",
      log_level = "error",
      debounce_timeout = 1,
      enable_line_number = true,
      blacklist = {},
      buttons = { -- Adding a custom button
        { label = "My site", url = "https://kuuichi.xyz" },
      },
      file_assets = {},
      show_time = true,

      -- Rich Presence text options
      editing_text = "Editing %s",
      file_explorer_text = "Browsing %s",
      git_commit_text = "Committing changes",
      plugin_manager_text = "Managing plugins",
      reading_text = "Reading %s",
      workspace_text = "Working on %s",
      line_number_text = "%s/%s",
    })
  end,
}

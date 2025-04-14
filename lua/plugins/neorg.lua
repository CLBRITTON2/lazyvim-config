return {
  {
    "vhyrro/luarocks.nvim",
    priority = 1000, -- Load this plugin first
    config = true, -- Automatically run require("luarocks-nvim").setup()
  },
  {
    "nvim-neorg/neorg",
    dependencies = { "luarocks.nvim" },
    lazy = false, -- Ensure Neorg loads immediately (optional, adjust as needed)
    version = "*", -- Pin to the latest stable release
    config = function()
      require("neorg").setup({
        load = {
          ["core.defaults"] = {}, -- Load default Neorg modules
          ["core.concealer"] = {}, -- Enable icons and formatting
          ["core.dirman"] = { -- Manage Neorg workspaces
            config = {
              workspaces = {
                notes = "~/notes",
              },
              default_workspace = "notes",
            },
          },
        },
      })
    end,
  },
}

return {
  {
    "vhyrro/luarocks.nvim",
    priority = 1000,
    config = true,
  },
  {
    "nvim-neorg/neorg",
    dependencies = { "luarocks.nvim" },
    lazy = false,
    version = "*",
    config = function()
      -- Setup Neorg
      local ok, neorg = pcall(require, "neorg")
      if not ok then
        vim.notify("Failed to load Neorg", vim.log.levels.ERROR)
        return
      end
      neorg.setup({
        load = {
          ["core.defaults"] = {},
          ["core.concealer"] = {},
          ["core.dirman"] = {
            config = {
              workspaces = {
                notes = "~/neorgnotes",
              },
              default_workspace = "notes",
            },
          },
        },
      })
      -- Function to set bold highlight
      local function set_bold_highlight()
        vim.api.nvim_set_hl(0, "@neorg.markup.bold", { link = "@neorg.headings.1.title" })
      end
      -- Initial highlight
      set_bold_highlight()
      -- Reapply highlight on mode changes and buffer writes
      vim.api.nvim_create_autocmd({
        "BufEnter",
        "FileType",
        "ModeChanged",
        "BufWritePost",
      }, {
        pattern = "*.norg",
        callback = function()
          set_bold_highlight()
        end,
        desc = "Reapply Neorg bold highlight on mode changes and buffer writes",
      })
    end,
  },
}

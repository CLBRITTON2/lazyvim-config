return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    sections = {
      lualine_c = {
        { require("harpoon_files").lualine_component },
      },
    },
  },
}

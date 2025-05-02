return {
  "akinsho/toggleterm.nvim",
  version = "*",
  opts = {
    direction = "horizontal",
    open_mapping = [[<c-cr>]],
    size = 20,
    close_on_exit = true,
    shell = "zsh -l",
    on_open = function(term)
      local full_path = vim.fn.getcwd()
      vim.api.nvim_buf_set_name(term.bufnr, full_path .. " [Term " .. term.id .. "]")
      vim.cmd("startinsert!")
    end,
  },
  config = true,
}

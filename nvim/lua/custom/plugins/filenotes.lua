return {
  'UsamaQaisrani/filenotes.nvim',
  config = function()
    require('filenotes').setup {
      keymap = '<leader>nn',
      window_width = 0.6,
      window_height = 0.6,
    }
  end,
}

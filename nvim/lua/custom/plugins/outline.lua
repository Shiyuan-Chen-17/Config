return {
  'hedyhli/outline.nvim',
  config = function()
    vim.keymap.set('n', '<leader>o', '<cmd>Outline<CR>', { desc = 'Toggle Outline' })
    require('outline').setup {
      outline_window = {
        position = 'left',
        width = 20,
        centre_on_jump = true,
      },
      guides = {
        enabled = true,
      },
      symbol_folding = {
        autofold_depth = 4,
      },
    }
  end,
}

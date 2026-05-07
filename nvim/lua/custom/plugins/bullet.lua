return {
  'bullets-vim/bullets.vim',
  init = function()
    vim.g.bullets_enabled_file_types = {
      'markdown',
      'text',
      'gitcommit',
      'scratch',
    }
    vim.g.bullets_enable_in_empty_buffers = '0'
  end,
}

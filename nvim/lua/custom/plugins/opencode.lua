return {
  'sudo-tee/opencode.nvim',
  config = function()
    require('opencode').setup {
      preferred_picker = 'telescope',
      preferred_completion = 'blink',
      keymap_prefix = '<leader>c',
      context = {
        buffer = {
          enabled = true,
        },
        git_diff = {
          enabled = true,
        },
      },
    }
  end,
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      'MeanderingProgrammer/render-markdown.nvim',
      opts = {
        anti_conceal = { enabled = false },
        file_types = { 'markdown', 'opencode_output' },
      },
      ft = { 'markdown', 'Avante', 'copilot-chat', 'opencode_output' },
    },
  },
}

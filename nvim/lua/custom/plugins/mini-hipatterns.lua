return {
  {
    'echasnovski/mini.hipatterns',
    event = 'BufReadPre',
    config = function()
      local hipatterns = require 'mini.hipatterns'

      hipatterns.setup {
        highlighters = {
          -- Highlight standalone 'FIXME', 'IMPORTANT', 'TODO', 'NOTE'
          fixme = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
          hack = { pattern = '%f[%w]()IMPORTANT()%f[%W]', group = 'MiniHipatternsHack' },
          todo = { pattern = '%f[%w]()TODO()%f[%W]', group = 'MiniHipatternsTodo' },
          note = { pattern = '%f[%w]()NOTE()%f[%W]', group = 'MiniHipatternsNote' },

          -- Highlight hex color strings (`#rrggbb`)
          hex_color = hipatterns.gen_highlighter.hex_color(),
        },
      }
    end,
  },
}

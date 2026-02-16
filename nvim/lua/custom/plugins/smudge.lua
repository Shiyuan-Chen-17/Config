-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'stikypiston/smudge.nvim',
    opts = {
      -- These are the default options. Leave the table blank (as in opts = {}) for this config, or customise it yourself!
      char = '░', -- smear character
      hl = 'SmudgeCursor',
      max_age = 80, -- ms before smear disappears
      length = 2, -- max trail length
    },
  },
}

return {
  'stikypiston/smudge.nvim',
  opts = {
    char = '░', -- smear character
    hl = 'SmudgeCursor',
    max_age = 100, -- ms before smear disappears
    length = 3, -- max trail length
  },
}

return {
  'nanozuki/tabby.nvim',
  lazy = false, -- important: tabline plugins should not be lazy
  priority = 1000,
  config = function()
    -- Ensure truecolor
    vim.opt.termguicolors = true

    -- Define nord-based highlights (independent of colorscheme)
    local function set_hl(name, opts)
      vim.api.nvim_set_hl(0, name, opts)
    end

    set_hl('TabbyFill', { fg = '#D8DEE9', bg = '#14161B' })
    set_hl('TabbyHead', { fg = '#2E3440', bg = '#81A1C1', bold = true })
    set_hl('TabbyCurrent', { fg = '#434C5D', bg = '#88C0D0', bold = true })
    set_hl('TabbyTab', { fg = '#D8DEE9', bg = '#3B4252' })
    set_hl('TabbyWin', { fg = '#E5E9F0', bg = '#434C5E' })
    set_hl('TabbyTail', { fg = '#2E3440', bg = '#88C0D0', bold = true })

    require('tabby').setup {
      line = function(line)
        return {
          {
            { '  ', hl = 'TabbyHead' },
            line.sep('', 'TabbyHead', 'TabbyFill'),
          },

          line.tabs().foreach(function(tab)
            local hl = tab.is_current() and 'TabbyCurrent' or 'TabbyTab'
            return {
              line.sep('', hl, 'TabbyFill'),
              tab.is_current() and '' or '󰆣',
              tab.number(),
              tab.name(),
              tab.close_btn '',
              line.sep('', hl, 'TabbyFill'),
              hl = hl,
              margin = ' ',
            }
          end),

          line.spacer(),

          line.wins_in_tab(line.api.get_current_tab()).foreach(function(win)
            return {
              line.sep('', 'TabbyWin', 'TabbyFill'),
              win.is_current() and '' or '',
              win.buf_name(),
              line.sep('', 'TabbyWin', 'TabbyFill'),
              hl = 'TabbyWin',
              margin = ' ',
            }
          end),

          {
            line.sep('', 'TabbyTail', 'TabbyFill'),
            { '  ', hl = 'TabbyTail' },
          },

          hl = 'TabbyFill',
        }
      end,
    }
  end,
}

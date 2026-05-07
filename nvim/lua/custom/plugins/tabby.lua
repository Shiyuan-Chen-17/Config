return {
  'nanozuki/tabby.nvim',
  lazy = false,
  priority = 1000,

  config = function()
    vim.opt.termguicolors = true

    local function get_hl(name)
      return vim.api.nvim_get_hl(0, { name = name })
    end

    local function set_hl(name, opts)
      vim.api.nvim_set_hl(0, name, opts)
    end

    local function setup_tabby_highlights()
      local normal = get_hl 'Normal'
      local tabline = get_hl 'TabLine'
      local tabline_sel = get_hl 'TabLineSel'
      local tabline_fill = get_hl 'TabLineFill'
      local statusline = get_hl 'StatusLine'

      set_hl('TabbyFill', {
        fg = tabline_fill.fg,
        bg = tabline_fill.bg,
      })

      set_hl('TabbyHead', {
        fg = normal.bg,
        bg = tabline.fg,
        bold = true,
      })

      set_hl('TabbyCurrent', {
        fg = tabline_sel.fg,
        bg = tabline_sel.bg,
        bold = true,
      })

      set_hl('TabbyTab', {
        fg = tabline.fg,
        bg = tabline.bg,
      })

      set_hl('TabbyWin', {
        fg = statusline.fg,
        bg = statusline.bg,
      })

      set_hl('TabbyTail', {
        fg = normal.bg,
        bg = tabline_sel.bg,
        bold = true,
      })
    end

    -- Apply immediately
    setup_tabby_highlights()

    -- Reapply after changing colorscheme
    vim.api.nvim_create_autocmd('ColorScheme', {
      callback = setup_tabby_highlights,
    })

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
              ' ',
              tab.number(),
              ':',
              tab.name(),
              ' ',
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
              ' ',
              win.buf_name(),
              ' ',
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

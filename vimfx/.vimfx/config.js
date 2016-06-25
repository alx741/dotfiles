vimfx.addCommand({
  name: 'zoom_in',
  description: 'Zoom in',
}, ({vim}) => {
  vim.window.FullZoom.enlarge()
})

vimfx.addCommand({
  name: 'zoom_out',
  description: 'Zoom out',
}, ({vim}) => {
  vim.window.FullZoom.reduce()
})

vimfx.addCommand({
  name: 'zoom_reset',
  description: 'Zoom reset',
}, ({vim}) => {
  vim.window.FullZoom.reset()
})

vimfx.set('custom.mode.normal.zoom_in', '=')
vimfx.set('custom.mode.normal.zoom_out', '-')
vimfx.set('custom.mode.normal.zoom_reset', '0')

vimfx.set('mode.normal.scroll_down', 'j <c-e> e J')
vimfx.set('mode.normal.scroll_up', 'k <c-y> <c-s> K')
vimfx.set('mode.normal.scroll_left', '<c-w> <c-h> <space>')
vimfx.set('mode.normal.scroll_right', '<c-l>')
vimfx.set('mode.normal.scroll_half_page_down', 'd <c-d>')
vimfx.set('mode.normal.scroll_half_page_up', 'u <c-u>')
vimfx.set('mode.normal.scroll_page_down', '<c-f>')
vimfx.set('mode.normal.scroll_page_up', 'b <c-b>')

vimfx.set('mode.normal.tab_select_next', 'gt <c-k> <c-n> l')
vimfx.set('mode.normal.tab_select_previous', 'gT <c-j> <c-p> h')
vimfx.set('mode.normal.tab_move_forward', 'gL')
vimfx.set('mode.normal.tab_move_backward', 'gH')
vimfx.set('mode.normal.window_new', '')

vimfx.set('prevent_autofocus', true)

vimfx.set('mode.normal.scroll_to_mark', '` \'')

vimfx.set('mode.normal.history_list', '')
vimfx.set('mode.normal.tab_select_oldest_unvisited', '')

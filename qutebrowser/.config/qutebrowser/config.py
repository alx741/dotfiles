import sys, os
sys.path.append(os.path.join(sys.path[0], 'jblock'))
config.source("jblock/jblock/integrations/qutebrowser.py")
c.content.host_blocking.enabled = False
c.content.host_blocking.lists = ['https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts']
c.content.host_blocking.whitelist = []

c.auto_save.session = True
c.auto_save.interval = 15000
c.input.insert_mode.auto_load = False
c.session.lazy_restore = True
c.tabs.tooltips = False
c.aliases = {'w': 'session-save', 'q': 'close', 'qa': 'quit', 'wq': 'quit --save', 'wqa': 'quit --save'}
c.bindings.key_mappings = {'<Ctrl-[>': '<Escape>', '<Ctrl-6>': '<Ctrl-^>', '<Ctrl-M>': '<Return>', '<Ctrl-J>': '<Return>', '<Shift-Return>': '<Return>', '<Enter>': '<Return>', '<Shift-Enter>': '<Return>', '<Ctrl-Enter>': '<Ctrl-Return>'}
c.completion.cmd_history_max_items = 100
c.completion.delay = 0
c.completion.height = '25%'
c.completion.min_chars = 2
c.completion.open_categories = ['searchengines', 'quickmarks', 'bookmarks', 'history']
c.completion.quick = True
c.completion.scrollbar.padding = 2
c.completion.scrollbar.width = 12
c.completion.show = 'always'
c.completion.shrink = False
c.completion.timestamp_format = '%Y-%m-%d'
c.completion.use_best_match = True
c.completion.web_history.exclude = ['*://*/.'] #TODO
c.completion.web_history.max_items = -1
c.confirm_quit = ['downloads']
c.content.autoplay = True
c.content.canvas_reading = True
c.content.cookies.accept = 'all'
c.content.cookies.store = True
c.content.default_encoding = 'utf-8'
c.content.desktop_capture = 'ask'
c.content.dns_prefetch = False
c.content.geolocation = 'ask'
c.content.headers.accept_language = 'en-US,en;q=0.9'
c.content.headers.custom = {}
c.content.notifications = False
c.content.headers.do_not_track = True
c.content.headers.referer = 'same-domain'
c.content.headers.user_agent = 'Mozilla/5.0 ({os_info}) AppleWebKit/{webkit_version} (KHTML, like Gecko) {qt_key}/{qt_version} {upstream_browser_key}/{upstream_browser_version} Safari/{webkit_version}'
c.content.hyperlink_auditing = False
c.content.images = True
c.content.javascript.alert = True
c.content.javascript.can_access_clipboard = False
c.content.javascript.can_open_tabs_automatically = False
c.content.javascript.enabled = True
c.content.javascript.log = {'unknown': 'debug', 'info': 'debug', 'warning': 'debug', 'error': 'debug'}
c.content.javascript.modal_dialog = False
c.content.javascript.prompt = True
c.content.local_content_can_access_file_urls = True
c.content.local_content_can_access_remote_urls = False
c.content.local_storage = True
c.content.media_capture = 'ask'
c.content.mouse_lock = 'ask'
c.content.mute = False
c.content.netrc_file = None
c.content.pdfjs = True
c.content.persistent_storage = 'ask'
c.content.plugins = False
c.content.print_element_backgrounds = True
c.content.private_browsing = False
c.content.proxy = 'system'
c.content.register_protocol_handler = 'ask'
c.content.site_specific_quirks = True
c.content.ssl_strict = 'ask'

c.content.user_stylesheets = \
    [ 'styles/fb.css' \
    , 'styles/medium.css' \
    , 'styles/quora.css' \
    , 'styles/azlyrics.css' \
    ]
    # , 'styles/metrolyrics.css' \

c.content.webgl = True
c.content.webrtc_ip_handling_policy = 'all-interfaces'
c.content.windowed_fullscreen = False
c.content.xss_auditing = False
c.downloads.location.directory = None
c.downloads.location.prompt = True
c.downloads.location.remember = True
c.downloads.location.suggestion = 'path'
c.downloads.open_dispatcher = None
c.downloads.position = 'top'
c.downloads.remove_finished = -1
c.editor.command = ['gvim', '-f', '{file}', '-c', 'normal {line}G{column0}l']
c.editor.encoding = 'utf-8'
c.fonts.contextmenu = None
c.fonts.default_family = []
c.fonts.default_size = '10pt'
c.fonts.web.size.default = 16
c.fonts.web.size.default_fixed = 13
c.fonts.web.size.minimum = 1
c.fonts.web.size.minimum_logical = 6
c.hints.auto_follow = 'unique-match'
c.hints.auto_follow_timeout = 0
c.hints.chars = 'asdfghjkl'
c.hints.dictionary = '/usr/share/dict/words'
c.hints.hide_unmatched_rapid_hints = True
c.hints.leave_on_load = True
c.hints.min_chars = 1
c.hints.mode = 'letter'
c.hints.next_regexes = ['\\bnext\\b', '\\bmore\\b', '\\bnewer\\b', '\\b[>→≫]\\b', '\\b(>>|»)\\b', '\\bcontinue\\b']
c.hints.prev_regexes = ['\\bprev(ious)?\\b', '\\bback\\b', '\\bolder\\b', '\\b[<←≪]\\b', '\\b(<<|«)\\b']
c.hints.scatter = True
c.hints.selectors = {'all': ['a', 'area', 'textarea', 'select', 'input:not([type="hidden"])', 'button', 'frame', 'iframe', 'img', 'link', 'summary', '[onclick]', '[onmousedown]', '[role="link"]', '[role="option"]', '[role="button"]', '[ng-click]', '[ngClick]', '[data-ng-click]', '[x-ng-click]', '[tabindex]'], 'links': ['a[href]', 'area[href]', 'link[href]', '[role="link"][href]'], 'images': ['img'], 'media': ['audio', 'img', 'video'], 'url': ['[src]', '[href]'], 'inputs': ['input[type="text"]', 'input[type="date"]', 'input[type="datetime-local"]', 'input[type="email"]', 'input[type="month"]', 'input[type="number"]', 'input[type="password"]', 'input[type="search"]', 'input[type="tel"]', 'input[type="time"]', 'input[type="url"]', 'input[type="week"]', 'input:not([type])', 'textarea']}
c.hints.uppercase = False
c.history_gap_interval = 30
c.input.escape_quits_reporter = True
c.input.forward_unbound_keys = 'auto'
c.input.insert_mode.auto_enter = True
c.input.insert_mode.auto_leave = True
c.input.insert_mode.leave_on_load = True
c.input.insert_mode.plugins = False
c.input.links_included_in_focus_chain = True
c.input.partial_timeout = 5000
c.input.rocker_gestures = False
c.input.spatial_navigation = False
c.keyhint.blacklist = []
c.keyhint.delay = 500
c.keyhint.radius = 6
c.messages.timeout = 1000
c.new_instance_open_target = 'tab'
c.new_instance_open_target_window = 'last-focused'
c.prompt.filebrowser = True
c.prompt.radius = 8
c.scrolling.smooth = True
c.search.ignore_case = 'smart'
c.search.incremental = True
c.session.default_name = None
## Languages to use for spell checking. You can check for available
## languages and install dictionaries using scripts/dictcli.py. Run the
## script with -h/--help for instructions.
# c.spellcheck.languages = ['en-US', 'es-ES']
c.statusbar.hide = False
c.statusbar.padding = {'top': 1, 'bottom': 1, 'left': 1, 'right': 1}
c.statusbar.position = 'bottom'
c.statusbar.widgets = ['keypress', 'url', 'scroll', 'history', 'tabs', 'progress']
c.tabs.background = True
c.tabs.close_mouse_button = 'middle'
c.tabs.close_mouse_button_on_bar = 'ignore'
c.tabs.favicons.scale = 1.0
c.tabs.favicons.show = 'always'
c.tabs.focus_stack_size = 10
c.tabs.indicator.padding = {'top': 2, 'bottom': 2, 'left': 0, 'right': 4}
c.tabs.indicator.width = 3
c.tabs.last_close = 'ignore'
c.tabs.max_width = -1
c.tabs.min_width = -1
c.tabs.mode_on_change = 'normal'
c.tabs.mousewheel_switching = False
c.tabs.new_position.related = 'next'
c.tabs.new_position.stacking = True
c.tabs.new_position.unrelated = 'last'
c.tabs.padding = {'top': 0, 'bottom': 0, 'left': 5, 'right': 5}
c.tabs.pinned.frozen = True
c.tabs.pinned.shrink = True
c.tabs.position = 'top'
c.tabs.select_on_remove = 'next'
c.tabs.show = 'multiple'
c.tabs.show_switching_delay = 800
c.tabs.tabs_are_windows = False
c.tabs.title.alignment = 'left'
c.tabs.title.format = '{audio}{private}{index}: {current_title}'
c.tabs.title.format_pinned = '{index}'
c.tabs.undo_stack_size = 20
c.tabs.wrap = True
c.url.auto_search = 'naive'
c.url.default_page = 'https://start.duckduckgo.com/'
c.url.incdec_segments = ['path', 'query']
c.url.open_base_url = False
c.url.searchengines = {'DEFAULT': 'https://duckduckgo.com/?q={}'}
c.url.start_pages = ['https://start.duckduckgo.com']
c.url.yank_ignored_parameters = ['ref', 'utm_source', 'utm_medium', 'utm_campaign', 'utm_term', 'utm_content']
c.window.hide_decoration = True
c.window.title_format = '{perc}{current_title}{title_sep}qutebrowser'
c.zoom.default = '100%'
c.zoom.levels = ['25%', '33%', '50%', '67%', '75%', '90%', '100%', '110%', '125%', '150%', '175%', '200%', '250%', '300%', '400%', '500%']
c.zoom.mouse_divider = 512



# Bindings

config.bind('x', 'tab-close')

config.bind('j', 'scroll-px 0 25')
config.bind('e', 'scroll-px 0 25')
config.bind('k', 'scroll-px 0 -25')
config.bind('d', 'scroll-page 0 0.5')
config.bind('<ctrl-d>', 'scroll-page 0 0.5')
config.bind('u', 'scroll-page 0 -0.5')
config.bind('<ctrl-u>', 'scroll-page 0 -0.5')
config.bind('<ctrl-e>', 'scroll down')
config.bind('<ctrl-y>', 'scroll up')

config.bind('<ctrl-o>', 'back')
config.bind('<ctrl-i>', 'forward')

config.bind('h', 'tab-prev')
config.bind('l', 'tab-next')
config.bind('J', 'tab-prev')
config.bind('K', 'tab-next')

config.bind('<ctrl-w>', 'tab-close')
config.bind('gp', 'tab-pin')

config.bind('gH', 'tab-move -')
config.bind('gL', 'tab-move +')

config.bind('i', 'enter-mode insert')

config.bind('t', 'set-cmd-text -s :open -r -t')
config.bind('<ctrl-t>', 'set-cmd-text -s :open -t')
config.bind('gl', 'tab-focus last')

config.bind('+', 'zoom-in')
config.bind('-', 'zoom-out')
config.bind('=', 'zoom')

config.bind('r', 'reload')
config.bind('R', 'reload -f')

config.bind('gt', 'set-cmd-text -s :buffer')
config.bind('<ctrl-p>', 'set-cmd-text -s :buffer')

config.bind('X', 'undo')
config.bind('<ctrl-shift-t>', 'undo')

config.bind('[[', 'navigate prev')
config.bind(']]', 'navigate next')

config.bind('gm', 'spawn mpv {url}')
config.bind('gM', 'hint links spawn mpv {hint-url}')

config.unbind('<Return>')

# config.bind("'", 'enter-mode jump_mark')
# config.bind('.', 'repeat-command')
# config.bind('/', 'set-cmd-text /')
# config.bind(':', 'set-cmd-text :')
# config.bind(';I', 'hint images tab')
# config.bind(';O', 'hint links fill :open -t -r {hint-url}')
# config.bind(';R', 'hint --rapid links window')
# config.bind(';Y', 'hint links yank-primary')
# config.bind(';b', 'hint all tab-bg')
# config.bind(';d', 'hint links download')
# config.bind(';f', 'hint all tab-fg')
# config.bind(';h', 'hint all hover')
# config.bind(';i', 'hint images')
# config.bind(';o', 'hint links fill :open {hint-url}')
# config.bind(';r', 'hint --rapid links tab-bg')
# config.bind(';t', 'hint inputs')
# config.bind(';y', 'hint links yank')
# config.bind('<Alt-1>', 'tab-focus 1')
# config.bind('<Alt-2>', 'tab-focus 2')
# config.bind('<Alt-3>', 'tab-focus 3')
# config.bind('<Alt-4>', 'tab-focus 4')
# config.bind('<Alt-5>', 'tab-focus 5')
# config.bind('<Alt-6>', 'tab-focus 6')
# config.bind('<Alt-7>', 'tab-focus 7')
# config.bind('<Alt-8>', 'tab-focus 8')
# config.bind('<Alt-9>', 'tab-focus -1')
# config.bind('<Alt-m>', 'tab-mute')
# config.bind('<Ctrl-A>', 'navigate increment')
# config.bind('<Ctrl-Alt-p>', 'print')
# config.bind('<Ctrl-B>', 'scroll-page 0 -1')
# config.bind('<Ctrl-D>', 'scroll-page 0 0.5')
# config.bind('<Ctrl-F5>', 'reload -f')
# config.bind('<Ctrl-F>', 'scroll-page 0 1')
# config.bind('<Ctrl-N>', 'open -w')
# config.bind('<Ctrl-PgDown>', 'tab-next')
# config.bind('<Ctrl-PgUp>', 'tab-prev')
# config.bind('<Ctrl-Q>', 'quit')
# config.bind('<Ctrl-Return>', 'follow-selected -t')
# config.bind('<Ctrl-Shift-N>', 'open -p')
# config.bind('<Ctrl-Shift-T>', 'undo')
# config.bind('<Ctrl-Shift-Tab>', 'nop')
# config.bind('<Ctrl-Shift-W>', 'close')
# config.bind('<Ctrl-U>', 'scroll-page 0 -0.5')
# config.bind('<Ctrl-V>', 'enter-mode passthrough')
# config.bind('<Ctrl-X>', 'navigate decrement')
# config.bind('<Ctrl-^>', 'tab-focus last')
# config.bind('<Ctrl-h>', 'home')
# config.bind('<Ctrl-s>', 'stop')
# config.bind('<Escape>', 'clear-keychain ;; search ;; fullscreen --leave')
# config.bind('<F11>', 'fullscreen')
# config.bind('<F5>', 'reload')
# config.bind('<Return>', 'follow-selected')
# config.bind('<back>', 'back')
# config.bind('<forward>', 'forward')
# config.bind('?', 'set-cmd-text ?')
# config.bind('@', 'run-macro')
# config.bind('B', 'set-cmd-text -s :quickmark-load -t')
# config.bind('D', 'tab-close -o')
# config.bind('F', 'hint all tab')
# config.bind('G', 'scroll-to-perc')
# config.bind('H', 'back')
# config.bind('J', 'tab-next')
# config.bind('K', 'tab-prev')
# config.bind('L', 'forward')
# config.bind('M', 'bookmark-add')
# config.bind('N', 'search-prev')
# config.bind('O', 'set-cmd-text -s :open -t')
# config.bind('PP', 'open -t -- {primary}')
# config.bind('Pp', 'open -t -- {clipboard}')
# config.bind('Sb', 'open qute://bookmarks#bookmarks')
# config.bind('Sh', 'open qute://history')
# config.bind('Sq', 'open qute://bookmarks')
# config.bind('Ss', 'open qute://settings')
# config.bind('T', 'tab-focus')
# config.bind('ZQ', 'quit')
# config.bind('ZZ', 'quit --save')
# config.bind('`', 'enter-mode set_mark')
# config.bind('ad', 'download-cancel')
# config.bind('b', 'set-cmd-text -s :quickmark-load')
# config.bind('cd', 'download-clear')
# config.bind('co', 'tab-only')
# config.bind('f', 'hint')
# config.bind('g$', 'tab-focus -1')
# config.bind('g0', 'tab-focus 1')
# config.bind('gB', 'set-cmd-text -s :bookmark-load -t')
# config.bind('gC', 'tab-clone')
# config.bind('gD', 'tab-give')
# config.bind('gO', 'set-cmd-text :open -t -r {url:pretty}')
# config.bind('gU', 'navigate up -t')
# config.bind('g^', 'tab-focus 1')
# config.bind('ga', 'open -t')
# config.bind('gb', 'set-cmd-text -s :bookmark-load')
# config.bind('gd', 'download')
# config.bind('gf', 'view-source')
# config.bind('gg', 'scroll-to-perc 0')
# config.bind('gi', 'hint inputs --first')
# config.bind('go', 'set-cmd-text :open {url:pretty}')
# config.bind('gt', 'set-cmd-text -s :buffer')
# config.bind('gu', 'navigate up')
# config.bind('h', 'scroll left')
# config.bind('i', 'enter-mode insert')
# config.bind('j', 'scroll down')
# config.bind('k', 'scroll up')
# config.bind('l', 'scroll right')
# config.bind('m', 'quickmark-save')
# config.bind('n', 'search-next')
# config.bind('o', 'set-cmd-text -s :open')
# config.bind('pP', 'open -- {primary}')
# config.bind('pp', 'open -- {clipboard}')
# config.bind('q', 'record-macro')
# config.bind('sf', 'save')
# config.bind('sk', 'set-cmd-text -s :bind')
# config.bind('sl', 'set-cmd-text -s :set -t')
# config.bind('ss', 'set-cmd-text -s :set')
# config.bind('tIH', 'config-cycle -p -u *://*.{url:host}/* content.images ;; reload')
# config.bind('tIh', 'config-cycle -p -u *://{url:host}/* content.images ;; reload')
# config.bind('tIu', 'config-cycle -p -u {url} content.images ;; reload')
# config.bind('tPH', 'config-cycle -p -u *://*.{url:host}/* content.plugins ;; reload')
# config.bind('tPh', 'config-cycle -p -u *://{url:host}/* content.plugins ;; reload')
# config.bind('tPu', 'config-cycle -p -u {url} content.plugins ;; reload')
# config.bind('tSH', 'config-cycle -p -u *://*.{url:host}/* content.javascript.enabled ;; reload')
# config.bind('tSh', 'config-cycle -p -u *://{url:host}/* content.javascript.enabled ;; reload')
# config.bind('tSu', 'config-cycle -p -u {url} content.javascript.enabled ;; reload')
# config.bind('th', 'back -t')
# config.bind('tiH', 'config-cycle -p -t -u *://*.{url:host}/* content.images ;; reload')
# config.bind('tih', 'config-cycle -p -t -u *://{url:host}/* content.images ;; reload')
# config.bind('tiu', 'config-cycle -p -t -u {url} content.images ;; reload')
# config.bind('tl', 'forward -t')
# config.bind('tpH', 'config-cycle -p -t -u *://*.{url:host}/* content.plugins ;; reload')
# config.bind('tph', 'config-cycle -p -t -u *://{url:host}/* content.plugins ;; reload')
# config.bind('tpu', 'config-cycle -p -t -u {url} content.plugins ;; reload')
# config.bind('tsH', 'config-cycle -p -t -u *://*.{url:host}/* content.javascript.enabled ;; reload')
# config.bind('tsh', 'config-cycle -p -t -u *://{url:host}/* content.javascript.enabled ;; reload')
# config.bind('tsu', 'config-cycle -p -t -u {url} content.javascript.enabled ;; reload')
# config.bind('u', 'undo')
# config.bind('v', 'enter-mode caret')
# config.bind('wB', 'set-cmd-text -s :bookmark-load -w')
# config.bind('wO', 'set-cmd-text :open -w {url:pretty}')
# config.bind('wP', 'open -w -- {primary}')
# config.bind('wb', 'set-cmd-text -s :quickmark-load -w')
# config.bind('wf', 'hint all window')
# config.bind('wh', 'back -w')
# config.bind('wi', 'inspector')
# config.bind('wl', 'forward -w')
# config.bind('wo', 'set-cmd-text -s :open -w')
# config.bind('wp', 'open -w -- {clipboard}')
# config.bind('xO', 'set-cmd-text :open -b -r {url:pretty}')
# config.bind('xo', 'set-cmd-text -s :open -b')
# config.bind('yD', 'yank domain -s')
# config.bind('yM', 'yank inline [{title}]({url}) -s')
# config.bind('yP', 'yank pretty-url -s')
# config.bind('yT', 'yank title -s')
# config.bind('yY', 'yank -s')
# config.bind('yd', 'yank domain')
# config.bind('ym', 'yank inline [{title}]({url})')
# config.bind('yp', 'yank pretty-url')
# config.bind('yt', 'yank title')
# config.bind('yy', 'yank')
# config.bind('{{', 'navigate prev -t')
# config.bind('}}', 'navigate next -t')

## Bindings for caret mode
# config.bind('$', 'move-to-end-of-line', mode='caret')
# config.bind('0', 'move-to-start-of-line', mode='caret')
# config.bind('<Ctrl-Space>', 'drop-selection', mode='caret')
# config.bind('<Escape>', 'leave-mode', mode='caret')
# config.bind('<Return>', 'yank selection', mode='caret')
# config.bind('<Space>', 'toggle-selection', mode='caret')
# config.bind('G', 'move-to-end-of-document', mode='caret')
# config.bind('H', 'scroll left', mode='caret')
# config.bind('J', 'scroll down', mode='caret')
# config.bind('K', 'scroll up', mode='caret')
# config.bind('L', 'scroll right', mode='caret')
# config.bind('Y', 'yank selection -s', mode='caret')
# config.bind('[', 'move-to-start-of-prev-block', mode='caret')
# config.bind(']', 'move-to-start-of-next-block', mode='caret')
# config.bind('b', 'move-to-prev-word', mode='caret')
# config.bind('c', 'enter-mode normal', mode='caret')
# config.bind('e', 'move-to-end-of-word', mode='caret')
# config.bind('gg', 'move-to-start-of-document', mode='caret')
# config.bind('h', 'move-to-prev-char', mode='caret')
# config.bind('j', 'move-to-next-line', mode='caret')
# config.bind('k', 'move-to-prev-line', mode='caret')
# config.bind('l', 'move-to-next-char', mode='caret')
# config.bind('o', 'reverse-selection', mode='caret')
# config.bind('v', 'toggle-selection', mode='caret')
# config.bind('w', 'move-to-next-word', mode='caret')
# config.bind('y', 'yank selection', mode='caret')
# config.bind('{', 'move-to-end-of-prev-block', mode='caret')
# config.bind('}', 'move-to-end-of-next-block', mode='caret')

## Bindings for command mode
# config.bind('<Alt-B>', 'rl-backward-word', mode='command')
# config.bind('<Alt-Backspace>', 'rl-backward-kill-word', mode='command')
# config.bind('<Alt-D>', 'rl-kill-word', mode='command')
# config.bind('<Alt-F>', 'rl-forward-word', mode='command')
# config.bind('<Ctrl-?>', 'rl-delete-char', mode='command')
# config.bind('<Ctrl-A>', 'rl-beginning-of-line', mode='command')
# config.bind('<Ctrl-B>', 'rl-backward-char', mode='command')
# config.bind('<Ctrl-C>', 'completion-item-yank', mode='command')
# config.bind('<Ctrl-D>', 'completion-item-del', mode='command')
# config.bind('<Ctrl-E>', 'rl-end-of-line', mode='command')
# config.bind('<Ctrl-F>', 'rl-forward-char', mode='command')
# config.bind('<Ctrl-H>', 'rl-backward-delete-char', mode='command')
# config.bind('<Ctrl-K>', 'rl-kill-line', mode='command')
# config.bind('<Ctrl-N>', 'command-history-next', mode='command')
# config.bind('<Ctrl-P>', 'command-history-prev', mode='command')
# config.bind('<Ctrl-Return>', 'command-accept --rapid', mode='command')
# config.bind('<Ctrl-Shift-C>', 'completion-item-yank --sel', mode='command')
# config.bind('<Ctrl-Shift-Tab>', 'completion-item-focus prev-category', mode='command')
# config.bind('<Ctrl-Tab>', 'completion-item-focus next-category', mode='command')
# config.bind('<Ctrl-U>', 'rl-unix-line-discard', mode='command')
# config.bind('<Ctrl-W>', 'rl-unix-word-rubout', mode='command')
# config.bind('<Ctrl-Y>', 'rl-yank', mode='command')
# config.bind('<Down>', 'completion-item-focus --history next', mode='command')
# config.bind('<Escape>', 'leave-mode', mode='command')
# config.bind('<Return>', 'command-accept', mode='command')
# config.bind('<Shift-Delete>', 'completion-item-del', mode='command')
# config.bind('<Shift-Tab>', 'completion-item-focus prev', mode='command')
# config.bind('<Tab>', 'completion-item-focus next', mode='command')
# config.bind('<Up>', 'completion-item-focus --history prev', mode='command')

## Bindings for hint mode
# config.bind('<Ctrl-B>', 'hint all tab-bg', mode='hint')
# config.bind('<Ctrl-F>', 'hint links', mode='hint')
# config.bind('<Ctrl-R>', 'hint --rapid links tab-bg', mode='hint')
# config.bind('<Escape>', 'leave-mode', mode='hint')
# config.bind('<Return>', 'follow-hint', mode='hint')

## Bindings for insert mode
# config.bind('<Ctrl-E>', 'open-editor', mode='insert')
# config.bind('<Escape>', 'leave-mode', mode='insert')
# config.bind('<Shift-Ins>', 'insert-text -- {primary}', mode='insert')

## Bindings for passthrough mode
# config.bind('<Shift-Escape>', 'leave-mode', mode='passthrough')

## Bindings for prompt mode
# config.bind('<Alt-B>', 'rl-backward-word', mode='prompt')
# config.bind('<Alt-Backspace>', 'rl-backward-kill-word', mode='prompt')
# config.bind('<Alt-D>', 'rl-kill-word', mode='prompt')
# config.bind('<Alt-F>', 'rl-forward-word', mode='prompt')
# config.bind('<Alt-Shift-Y>', 'prompt-yank --sel', mode='prompt')
# config.bind('<Alt-Y>', 'prompt-yank', mode='prompt')
# config.bind('<Ctrl-?>', 'rl-delete-char', mode='prompt')
# config.bind('<Ctrl-A>', 'rl-beginning-of-line', mode='prompt')
# config.bind('<Ctrl-B>', 'rl-backward-char', mode='prompt')
# config.bind('<Ctrl-E>', 'rl-end-of-line', mode='prompt')
# config.bind('<Ctrl-F>', 'rl-forward-char', mode='prompt')
# config.bind('<Ctrl-H>', 'rl-backward-delete-char', mode='prompt')
# config.bind('<Ctrl-K>', 'rl-kill-line', mode='prompt')
# config.bind('<Ctrl-P>', 'prompt-open-download --pdfjs', mode='prompt')
# config.bind('<Ctrl-U>', 'rl-unix-line-discard', mode='prompt')
# config.bind('<Ctrl-W>', 'rl-unix-word-rubout', mode='prompt')
# config.bind('<Ctrl-X>', 'prompt-open-download', mode='prompt')
# config.bind('<Ctrl-Y>', 'rl-yank', mode='prompt')
# config.bind('<Down>', 'prompt-item-focus next', mode='prompt')
# config.bind('<Escape>', 'leave-mode', mode='prompt')
# config.bind('<Return>', 'prompt-accept', mode='prompt')
# config.bind('<Shift-Tab>', 'prompt-item-focus prev', mode='prompt')
# config.bind('<Tab>', 'prompt-item-focus next', mode='prompt')
# config.bind('<Up>', 'prompt-item-focus prev', mode='prompt')

## Bindings for register mode
# config.bind('<Escape>', 'leave-mode', mode='register')

## Bindings for yesno mode
# config.bind('<Alt-Shift-Y>', 'prompt-yank --sel', mode='yesno')
# config.bind('<Alt-Y>', 'prompt-yank', mode='yesno')
# config.bind('<Escape>', 'leave-mode', mode='yesno')
# config.bind('<Return>', 'prompt-accept', mode='yesno')
# config.bind('N', 'prompt-accept --save no', mode='yesno')
# config.bind('Y', 'prompt-accept --save yes', mode='yesno')
# config.bind('n', 'prompt-accept no', mode='yesno')
# config.bind('y', 'prompt-accept yes', mode='yesno')



# Solarized

base3   = "#fdf6e3"
base2   = "#eee8d5"
base1   = "#93a1a1"
base0   = "#839496"
base00  = "#657b83"
base01  = "#586e75"
base02  = "#073642"
base03  = "#002b36"
red     = "#dc322f"
orange  = "#cb4b16"
yellow  = "#b58900"
green   = "#859900"
cyan    = "#2aa198"
blue    = "#268bd2"
violet  = "#6c71c4"
magenta = "#d33682"

c.colors.completion.fg = base01
c.colors.completion.odd.bg = base3
c.colors.completion.even.bg = base3
c.colors.completion.category.fg = blue
c.colors.completion.category.bg = base3
c.colors.completion.category.border.top = base3
c.colors.completion.category.border.bottom = base3
c.colors.completion.item.selected.fg = base3
c.colors.completion.item.selected.bg = base00
c.colors.completion.item.selected.border.top = base00
c.colors.completion.item.selected.border.bottom = base00
c.colors.completion.item.selected.match.fg = base3
c.colors.completion.match.fg = orange
c.colors.completion.scrollbar.fg = base01
c.colors.completion.scrollbar.bg = base3
c.colors.contextmenu.menu.bg = base3
c.colors.contextmenu.menu.fg =  base01
c.colors.contextmenu.selected.bg = blue
c.colors.contextmenu.selected.fg = base3
c.colors.downloads.bar.bg = base3
c.colors.downloads.start.fg = base3
c.colors.downloads.start.bg = blue
c.colors.downloads.stop.fg = base3
c.colors.downloads.stop.bg = cyan
c.colors.downloads.error.fg = red
c.colors.hints.fg = base00
c.colors.hints.bg = base3
c.colors.hints.match.fg = orange
c.colors.keyhint.fg = base01
c.colors.keyhint.suffix.fg = base01
c.colors.keyhint.bg = base3
c.colors.messages.error.fg = base3
c.colors.messages.error.bg = red
c.colors.messages.error.border = red
c.colors.messages.warning.fg = base3
c.colors.messages.warning.bg = orange
c.colors.messages.warning.border = orange
c.colors.messages.info.fg = base01
c.colors.messages.info.bg = base3
c.colors.messages.info.border = base3
c.colors.prompts.fg = base01
c.colors.prompts.border = base3
c.colors.prompts.bg = base3
c.colors.prompts.selected.bg = yellow
c.colors.statusbar.normal.fg = base01
c.colors.statusbar.normal.bg = base3
c.colors.statusbar.insert.fg = base3
c.colors.statusbar.insert.bg = base00
c.colors.statusbar.passthrough.fg = yellow
c.colors.statusbar.passthrough.bg = base3
c.colors.statusbar.private.fg = magenta
c.colors.statusbar.private.bg = base02
c.colors.statusbar.command.fg = base00
c.colors.statusbar.command.bg = base2
c.colors.statusbar.command.private.fg = magenta
c.colors.statusbar.command.private.bg = base03
c.colors.statusbar.caret.fg = blue
c.colors.statusbar.caret.bg = base3
c.colors.statusbar.caret.selection.fg = blue
c.colors.statusbar.caret.selection.bg = base3
c.colors.statusbar.progress.bg = base01
c.colors.statusbar.url.fg = base01
c.colors.statusbar.url.error.fg = red
c.colors.statusbar.url.hover.fg = blue
c.colors.statusbar.url.success.http.fg = orange
c.colors.statusbar.url.success.https.fg = base00
c.colors.statusbar.url.warn.fg = violet
c.colors.tabs.bar.bg = base3
c.colors.tabs.indicator.start = blue
c.colors.tabs.indicator.stop = cyan
c.colors.tabs.indicator.error = red
c.colors.tabs.odd.fg = base01
c.colors.tabs.odd.bg = base3
c.colors.tabs.even.fg = base01
c.colors.tabs.even.bg = base3
c.colors.tabs.pinned.even.bg = base3
c.colors.tabs.pinned.even.fg = base3
c.colors.tabs.pinned.odd.bg = base3
c.colors.tabs.pinned.odd.fg = base3
c.colors.tabs.pinned.selected.even.bg = base1
c.colors.tabs.pinned.selected.even.fg = base3
c.colors.tabs.pinned.selected.odd.bg = base1
c.colors.tabs.pinned.selected.odd.fg = base3
c.colors.tabs.selected.odd.fg = base3
c.colors.tabs.selected.odd.bg = base1
c.colors.tabs.selected.even.fg = base3
c.colors.tabs.selected.even.bg = base1
c.colors.webpage.bg = base3
c.hints.border = '1px solid base02'

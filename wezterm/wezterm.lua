local wezterm = require 'wezterm'

-- starts wezterm in MacOS fullscreen mode
-- (need ""native_macos_fullscreen_mode" setting as well)
-- (see "window settings")
wezterm.on('gui-startup', function(cmd)
  local tab, pane, window = wezterm.mux.spawn_window(cmd or {})
  window:gui_window():toggle_fullscreen()
end)

return {
  automatically_reload_config = true,

  -- colors
  color_scheme = "Tokyo Night Storm",

  --font
  font = wezterm.font("Cousine Nerd Font Mono"),
  font_size = 20,

  enable_tab_bar = false, -- using tmux as multiplexer instead

  -- window settings
  adjust_window_size_when_changing_font_size = false,
  native_macos_fullscreen_mode = true, -- needed for MacOS fullscreen start

  send_composed_key_when_left_alt_is_pressed = true, -- needed for MacOS to use left option key win key combination/macros

  term = "xterm-256color",
  default_prog = { '/bin/zsh', '-l' },
}

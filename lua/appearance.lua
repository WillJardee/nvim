local dark_themes = {
  -- dark
  -- black
  'industry',
  'koehler',
  'wildcharm',

  -- brown
  'gruvbox',
  'melange',

  -- grey
  'desert',
  'seoul256',
  'habamax',

  -- blue
  'ayu',
  'onedark',
  'sorbet',
  'tokyonight-night',
  'tokyonight-storm',
}
local light_themes = {
  -- light
  'morning',
  'quiet',
  'tokyonight-day',
  'seoul256-light',
  'peachpuff',

  -- misc
  'blue',
}

local dark_current_theme = 12
local light_current_theme = 3
local lightmode = false

function ToggleTheme(increment)
  if lightmode then
    light_current_theme = (light_current_theme + increment - 1) % #light_themes +1
    vim.cmd('colorscheme ' .. light_themes[light_current_theme])
    vim.notify('Theme switched to: ' .. light_themes[light_current_theme], vim.log.levels.INFO)
  else
    dark_current_theme = (dark_current_theme + increment - 1) % #dark_themes +1
    vim.cmd('colorscheme ' .. dark_themes[dark_current_theme])
    vim.notify('Theme switched to: ' .. dark_themes[dark_current_theme], vim.log.levels.INFO)
  end
end

function ToggleLightMode()
  lightmode = not lightmode
  if lightmode then
    vim.notify('Switched to light Themes.', vim.log.levels.INFO)
    ToggleTheme(0)
  elseif not lightmode then
    vim.notify('Switched to dark Themes.', vim.log.levels.INFO)
    ToggleTheme(0)
  end
end

ToggleTheme(0)

local themes = { 
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

                -- light
                'morning',
                'quiet',
                'tokyonight-day',
                'seoul256-light',
                'peachpuff',

                -- misc
                'blue',
              }
local current_theme = 2
vim.cmd('colorscheme ' .. themes[current_theme])

function ToggleTheme()
    current_theme = current_theme % #themes + 1
    vim.cmd('colorscheme ' .. themes[current_theme])
    vim.notify('Theme switched to: ' .. themes[current_theme], vim.log.levels.INFO)
end

function LightMode()
  vim.cmd('colorscheme tokyonight-day')
end
function DarkMode()
  vim.cmd('colorscheme tokyonight-storm')
end

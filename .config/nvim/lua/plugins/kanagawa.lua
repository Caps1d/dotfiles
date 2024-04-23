return {
    'rebelot/kanagawa.nvim',
    dependencies = 'nvim-web-devicons',
    priority = 1000, -- load asap
    config = function()
        local kanagawa = require('kanagawa')
        local icons = require('nvim-web-devicons')
        local BG = '#0F0F12'
        -- local BG = '#0E0F11'
        local ALMOST_BG = '#1D1D23'
        -- local ALMOST_BG = '#1E2617'
        -- local ALMOST_BG = '#1A1C20'
        local WHITE = '#9da2af'
        local GRAY = '#80838f'
        local FADED_GRAY = '#516255'
        -- local FADED_GRAY = '#536056'
        local DARK_GREEN = '#5B6A56'
        -- local DARK_GREEN = '#647367'
        local VHIGHLIGHT = '#373140'
        -- local VHIGHLIGHT = '#28331F'
        -- local VHIGHLIGHT = '#3A4139'
        -- local STRONG_FADED_GRAY = '#2a2d30'
        kanagawa.setup({
            transparent = true,
            colors = {
                theme = {
                    all = {
                        ui = {
                            bg_gutter = 'none',
                        },
                    },
                },
                palette = {
                    oldWhite = WHITE, -- white text
                    fujiWhite = WHITE, -- white text
                    fujiGray = FADED_GRAY, -- comments
                    sumiInk3 = BG, -- bg
                },
            },
            overrides = function(colors)
                local c = colors.palette
                local overrides = {
                    --general
                    Visual = { bg = VHIGHLIGHT }, -- bg on select
                    ModeMsg = { fg = c.oniViolet },
                    CursorLineNr = { fg = c.oniViolet },
                    CursorLine = { bg = ALMOST_BG },
                    WinSeparator = { fg = ALMOST_BG },

                    -- bufferline
                    BufferLineFill = { bg = BG },
                    BufferLineBackground = { bg = BG, fg = FADED_GRAY }, -- unactive tabs to faded gray
                    BufferLineSeparator = { fg = BG },
                    BufferLineModified = { fg = BG },
                    BufferlineBufferSelected = { fg = DARK_GREEN }, -- active tabs to gray
                    BufferlineBufferVisible = { fg = FADED_GRAY }, -- active tabs to gray
                    BufferLineIndicatorVisible = { fg = BG },

                    -- indentline
                    IndentBlanklineChar = { fg = ALMOST_BG },

                    -- GitSigns
                    GitSignsAdd = { fg = c.oniViolet },
                    GitSignsAddNr = { fg = c.oniViolet },
                    GitSignsAddLn = { fg = c.oniViolet },
                    GitSignsChange = { fg = c.oniViolet },
                    GitSignsChangeNr = { fg = c.oniViolet },
                    GitSignsChangeLn = { fg = c.oniViolet },
                    GitSignsCurrentLineBlame = { fg = FADED_GRAY },
                }

                -- change color of icons
                local new_icons = {}
                for key, icon in pairs(icons.get_icons()) do
                    icon.color = GRAY
                    new_icons[key] = icon
                    overrides['BufferLineDevIcon' .. icon.name] = { bg = BG, fg = FADED_GRAY } -- unactive tabs to faded gray
                    overrides['BufferLineDevIcon' .. icon.name .. 'Selected'] = { bg = BG, fg = WHITE } -- active tabs to gray
                end
                icons.set_icon(new_icons)

                return overrides
            end,
        })
        vim.cmd([[colorscheme kanagawa-wave]])
    end,
}

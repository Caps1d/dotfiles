return {
    'nvim-lualine/lualine.nvim',
    enabled = true,
    lazy = false,
    config = function()
        -- custom theme
        local colors = {
            black = '#282828',
            white = '#ebdbb2',
            red = '#E45A69',
            pink = '#D27E99',
            green = '#98BB6C',
            darkgreen = '#546056',
            boldgreen = '#647367',
            seaweed = '#677F6B',
            brine = '#94A288',
            blue = '#80B4CA',
            darkblue = '#7E9CD8',
            orange = '#F99C64',
            yellow = '#E1BE81',
            lightyellow = '#E6C384',
            latte = '#C0A36E',
            gray = '#969BA8',
            lightgray = '#2E3036',
            darkgray = '#0E0F11',
            inactivegray = '#2D3141',
            lilac = '#957FB8',
        }
        local kanagawa = {
            normal = {
                a = { bg = colors.seaweed, fg = colors.black, gui = 'bold' },
                b = { bg = colors.lightgray, fg = colors.latte },
                c = { bg = colors.darkgray, fg = colors.darkgreen },
            },
            insert = {
                a = { bg = colors.gray, fg = colors.black, gui = 'bold' },
                b = { bg = colors.lightgray, fg = colors.latte },
                c = { bg = colors.darkgray, fg = colors.darkgreen },
            },
            visual = {
                a = { bg = colors.lilac, fg = colors.black, gui = 'bold' },
                b = { bg = colors.lightgray, fg = colors.latte },
                c = { bg = colors.darkgray, fg = colors.darkgreen },
            },
            replace = {
                a = { bg = colors.red, fg = colors.black, gui = 'bold' },
                b = { bg = colors.lightgray, fg = colors.latte },
                c = { bg = colors.darkgray, fg = colors.darkgreen },
            },
            command = {
                a = { bg = colors.red, fg = colors.black, gui = 'bold' },
                b = { bg = colors.lightgray, fg = colors.latte },
                c = { bg = colors.darkgray, fg = colors.darkgreen },
            },
            inactive = {
                a = { bg = colors.darkgray, fg = colors.gray, gui = 'bold' },
                b = { bg = colors.darkgray, fg = colors.gray },
                c = { bg = colors.darkgray, fg = colors.gray },
            },
        }
        -- end of theme definition

        require('lualine').setup({
            options = {
                icons_enabled = true,
                theme = kanagawa,
                section_separators = { left = '', right = '' },
                component_separators = { left = '', right = '' },
                disabled_filetypes = {
                    statusline = { 'packer', 'help', 'undotree' },
                },
            },
            sections = {
                lualine_a = { 'mode' },
                lualine_b = { 'branch' },
                lualine_c = {
                    {
                        'filename',
                        file_status = true, -- displays file status (readonly status, modified status)
                        path = 0, -- 0 = just filename, 1 = relative path, 2 = absolute path
                    },
                },
                lualine_x = {
                    {
                        'diagnostics',
                        sources = { 'nvim_diagnostic' },
                        symbols = {
                            error = ' ',
                            warn = ' ',
                            info = ' ',
                            hint = ' ',
                        },
                    },
                    'encoding',
                    'filetype',
                },
                lualine_y = { 'progress' },
                lualine_z = { 'location' },
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {
                    {
                        'filename',
                        file_status = true, -- displays file status (readonly status, modified status)
                        path = 1, -- 0 = just filename, 1 = relative path, 2 = absolute path
                    },
                },
                lualine_x = { 'location' },
                lualine_y = {},
                lualine_z = {},
            },
            tabline = {},
            extensions = { 'fugitive', 'nvim-dap-ui' },
        })
    end,
}
